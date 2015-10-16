opt=-O2
def="-DNO_RANK_SELECT"

cd bitrank
gcc $debug -std=gnu89 -c *.c

cd ..

echo "Compiling per level algorithm"
gcc $opt $def -std=gnu89 -c pwt.c util.c -lrt -fcilkplus -lcilkrts -lm
gcc $opt $def -std=gnu89 pwt.o util.o bitrank/basic.o bitrank/bit_array.o bitrank/bitrankw32int.o -o pwt -lrt -fcilkplus -lcilkrts -lm

echo "Compiling domain decomposition algorithm"
gcc $opt $def -std=gnu89 -c dd.c util.c -lrt -fcilkplus -lcilkrts -lm
gcc $opt $def -std=gnu89 dd.o util.o bitrank/basic.o bitrank/bit_array.o bitrank/bitrankw32int.o -o dd -lrt -fcilkplus -lcilkrts -lm

echo "Done."
