##################################################
# Makefile
##################################################
ASM:=nasm
ASMFLAG:=-f elf -g -F stabs -o
CC:=gcc
CCFLAG:=-c -g -o
LD:=ld
LDFLAG:= -Ttext 0x30400 -o
CLEAN:=rm -f

ASM_BIN:= kernel/kernel.o asm/display.o asm/io.o asm/pm.o kernel/pm.o asm/exception_handler.o 
#C_BIN:= lib/printk.o kernel/main.o kernel/i8259.o kernel/interrupt_handler.o
C_BIN:= kernel/main.o kernel/i8259.o kernel/interrupt_handler.o thread/thread.o test/testA.o lib/printk.o
KERNEL_BIN:= kernel.bin
OBJS:= kernel/kernel.o kernel/main.o thread/thread.o asm/display.o kernel/i8259.o asm/io.o kernel/pm.o asm/pm.o  asm/exception_handler.o kernel/interrupt_handler.o lib/printk.o
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
	$(CLEAN) $(C_BIN) $(ASM_BIN) $(KERNEL_BIN)

##########################################################################################

kernel/main.o: kernel/main.c	
	$(CC) $(CCFLAG) $@ $<

kernel/kernel.o: kernel/kernel.asm
	$(ASM) $(ASMFLAG) $@ $<

kernel/pm.o: kernel/pm.c
	$(CC) $(CCFLAG) $@ $<

kernel/i8259.o: kernel/i8259.c
	$(CC) $(CCFLAG) $@ $<

thread/thread.o: thread/thread.c
	$(CC) $(CCFLAG) $@ $<

kernel/interrupt_handler.o: kernel/interrupt_handler.c
	$(CC) $(CCFLAG) $@ $<


asm/display.o: asm/display.asm
	$(ASM) $(ASMFLAG) $@ $<

asm/io.o: asm/io.asm
	$(ASM) $(ASMFLAG) $@ $<

asm/pm.o: asm/pm.asm
	$(ASM) $(ASMFLAG) $@ $<

asm/exception_handler.o: asm/exception_handler.asm
	$(ASM) $(ASMFLAG) $@ $<
