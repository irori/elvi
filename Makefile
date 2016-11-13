ELVM ?= elvm
TARGETS := bf unl ws bef
RUNNERS := $(ELVM)/Whitespace/whitespace.out \
	$(ELVM)/out/befunge \
	$(ELVM)/out/bfopt \
	$(ELVM)/out/eli \
	$(ELVM)/tinycc/tcc

all: vi $(TARGETS:%=vi.eir.%) $(RUNNERS)

vi.eir: vi.c $(ELVM)/out/8cc
	$(ELVM)/out/8cc -S -I$(ELVM)/libc $< -o $@

vi.eir.%: vi.eir $(ELVM)/out/elc
	$(ELVM)/out/elc -$* $< >$@

vi: vi.c
	$(CC) -g -O0 $< -o $@

$(ELVM)/Makefile:
	git clone https://github.com/shinh/elvm.git

$(ELVM)/%: $(ELVM)/Makefile
	$(MAKE) -C $(ELVM) $*

clean:
	rm -f vi vi.eir*
