ENTRY(_start)

mmio        = 0xfffffffff8000000;
fb          = 0xfffffffffc000000;
bootboot    = 0xffffffffffe00000;
environment = 0xffffffffffe01000;

PHDRS
{
  boot PT_LOAD;
}
SECTIONS
{
    . = 0xffffffffffe02000;
    .text : {
        KEEP(*(.text.boot)) *(.text .text.*)
        *(.rodata .rodata.*)
        *(.data .data.*)
    } :boot
    .bss (NOLOAD) : {
        . = ALIGN(16);
        *(.bss .bss.*)
        *(COMMON)
    } :boot

    /DISCARD/ : { *(.eh_frame) *(.comment) *(.note.*) }
}
