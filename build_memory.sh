opt=-O2
def="-DNO_RANK_SELECT"

cd bitrank
gcc $debug -std=gnu89 -c *.c

cd ..

gcc -g -W -Wall -ansi -I. -c -o ./malloc_count.o ./malloc_count.c # Measuring memory

echo "Compiling per level algorithm"
gcc -DMALLOC_COUNT $opt $def -std=gnu89 -c pwt.c util.c -lrt -fcilkplus -lcilkrts -lm -ldl
gcc -DMALLOC_COUNT $opt $def pwt.o util.o bitrank/basic.o bitrank/bit_array.o bitrank/bitrankw32int.o malloc_count.o -o pwt_mem -lrt -fcilkplus -lcilkrts -lm -ldl

echo "Compiling domain decomposition algorithm"
gcc -DMALLOC_COUNT $opt $def -std=gnu89 -c dd.c util.c -lrt -fcilkplus -lcilkrts -lm -ldl
gcc -DMALLOC_COUNT $opt $def dd.o util.o bitrank/basic.o bitrank/bit_array.o bitrank/bitrankw32int.o malloc_count.o -o dd_mem -lrt -fcilkplus -lcilkrts -lm -ldl

echo "Done."
