
FLOPPY=bin/test.adf
VASM=/opt/m68k-amigaos6/bin/vasm
VLINK=/opt/m68k-amigaos6/bin/vlink
FILES=out/main.raw data/sugtest.raw data/sugtest.pal
ASMFLAGS=-Fvobj -m68000 -L $@.lst


all: bin out $(FLOPPY)

bin:
	mkdir bin

out:
	mkdir out

$(FLOPPY): out/bb.sum $(FILES)
	python make-adf.py $@ out/bb.sum $(FILES)

out/bb.sum: out/bb.out
	python sum-bootblock.py $< $@

out/bb.out: out/bootblock.o
	$(VLINK) -brawbin1 $< -o $@

out/bootblock.o: bootblock.asm
	$(VASM) $(ASMFLAGS) $< -o $@

out/main.o: main.asm
	$(VASM) $(ASMFLAGS) $< -o $@

out/main.raw: out/main.o
	$(VLINK) -brawbin1 $< -o $@

clean:
	rm -rf out bin
