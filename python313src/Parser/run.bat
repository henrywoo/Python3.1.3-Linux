

cl acceler.obj grammar1.obj listnode.obj node.obj parser.obj  parsetok.obj tokenizer.obj bitset.obj metagrammar.obj firstsets.obj grammar.obj pgen.obj printgrammar.obj pgenmain.obj ..\PCbuild\python31_d.lib /0d /Zi /Fepgen.exe


pgen.exe ../Grammar/grammar graminit.h graminit.c
