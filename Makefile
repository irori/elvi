ELVM ?= ../elvm
TARGETS := bf unl ws bef

all: vi $(TARGETS:%=vi.eir.%)

vi.eir: vi.c
	$(ELVM)/out/8cc -S -I$(ELVM)/libc $< -o $@

vi.eir.%: vi.eir
	$(ELVM)/out/elc -$* $< >$@

vi: vi.c
	$(CC) -g -O0 $< -o $@

clean:
	rm -f vi vi.eir*
