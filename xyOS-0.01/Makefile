##################################################
# Makefile
##################################################

KERNEL:=kernel/kernel.asm
KERNEL_BIN:=kernel/kernel.o

STRING:=lib/string.asm
STRING_BIN:=lib/string.o

PRINTK:=lib/printk.c
PRINTK_BIN:=lib/printk.o

IMG:=a.img
FLOPPY:=/mnt/floppy/

.PHONY: all

all:
	nasm -f elf $(STRING) -o $(STRING_BIN)
	nasm -f elf $(KERNEL) -o $(KERNEL_BIN)
	gcc -c $(PRINTK) -o $(PRINTK_BIN)
#	ld -s -Ttext 0x30400 *.o -o kernel.bin
	ld -s -Ttext 0x30400 $(KERNEL_BIN) $(STRING_BIN) $(PRINTK_BIN)  -o kernel.bin

install: kernel.bin
	sudo mount -o loop $(IMG) $(FLOPPY)
	sudo cp kernel.bin $(FLOPPY) -v
	sudo umount $(FLOPPY)

clean :
	rm -f *.o *.bin
	rm -f $(KERNEL_BIN) $(PRINTK_BIN) $(STRING_BIN)


