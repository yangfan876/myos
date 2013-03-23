##################################################
# Makefile
##################################################
ASM:=nasm
ASMFLAG:=-f elf -o
CC:=gcc
CCFLAG:=-c -o
LD:=ld
LDFLAG:= -s -Ttext 0x30400 -o
CLEAN:=rm -f

ASM_BIN:= kernel/kernel.o asm/display.o asm/io.h
C_BIN:= lib/printk.o kernel/main.o kernel/i8259.o

KERNEL_BIN:= kernel.bin
OBJS:= kernel/kernel.o kernel/main.o asm/display.o lib/printk.o kernel/i8259.o asm/io.o

IMG:=a.img
FLOPPY:=/mnt/floppy/


.PHONY: all

all: $(OBJS)
	$(LD) $(LDFLAG) $(KERNEL_BIN) $(OBJS)


########################################################################################

install: all
	sudo mount -o loop $(IMG) $(FLOPPY)
	sudo cp kernel.bin $(FLOPPY) -v
	sudo umount $(FLOPPY)

clean :
	$(CLEAN) $(C_BIN) $(ASM_BIN) $(KERNLE_BIN)

##########################################################################################

kernel/main.o: kernel/main.c	
	$(CC) $(CCFLAG) $@ $<

kernel/kernel.o: kernel/kernel.asm
	$(ASM) $(ASMFLAG) $@ $<

kernel/i8259.o: kernel/i8259.c
	$(CC) $(CCFLAG) $@ $<

asm/display.o: asm/display.asm
	$(ASM) $(ASMFLAG) $@ $<

asm/io.o: asm/io.asm
	$(ASM) $(ASMFLAG) $@ $<

lib/printk.o: lib/printk.c
	$(CC) $(CCFLAG) $@ $<


