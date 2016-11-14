# elvi: vi-like editor in esoteric languages

This is a modified version of [Jody Bruchon's vi clone](https://github.com/jbruchon/vee-eye) that can be compiled into [esoteric languages](https://esolangs.org/wiki/Main_Page), using the [ELVM Compiler Infrastructure](https://github.com/shinh/elvm).

Only very limited commands are supported. It cannot even save / load files, because most esolangs does not have file I/O.
But it's pretty impressive to see vi running on a Brainfuck (or Unlambda) interpreter.

## Usage
To compile vi.c into esoteric languages, run `make`. If you already have an ELVM checkout, set the `ELVM` environment variable to point to that location. Otherwise, it checks out ELVM into `elvm` subdirectory.

The following files are generated:
````
vi.eir      -  ELVM IR code
vi.eir.bef  -  Befunge
vi.eir.bf   -  Brainfuck
vi.eir.unl  -  Unlambda
vi.eir.ws   -  Whitespace
````

To run, use the `runvi` script. it sets your terminal to non-canonical mode, and run the esolang interpreter bundled with ELVM. After elvi exits, it restores the terminal mode.

