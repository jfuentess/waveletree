# Parallel wavele tree construction #

In this repository we provide the implementation of two new parallel
algorithms to the construction of wavalet trees. The first algorithm,
pwt, has $O(n)$ time complexity and uses O$(n\lg\sigma+\sigma\lg n)$ bits of space,
including the space of the final wtree and excluding the input. The
second algorithm, dd, has $O(\lg n)$ time complexity and uses
$O(n\lg\sigma+p\sigma\lg n\lg\sigma)$ bits of space, using $p$
threads.

## Input ##

Our implementation is intended only for research. The input of our
algorithms is limited to integer alphabets in binary format,
where the alphabet is continuous.

## Compilation ##

We provide two bash scripts to the compilation of our algorithms. The
first script, *build.sh*, is intended to run experiments to measure
the running time.

	```shell
	bash build.sh
	```
The second script in intended to run experiments to measure the
memory consumption.

	```shell
	bash build_memory.sh
	```
	
By default, our algorithms use Cilk Plus and assume integer alphabets
using 4 bytes to encode each symbol of the input. Below, we provide a
list of additional options to compile our algorithms:

### Options ###

* -DNO\_RANK_SELECT: This option avoids the construction of the
  rank/select structures of the $\lg\sigma$ bitarrays of the wavelet
  tree.
* -DNO_CILK: This option allows to compile a sequential version of our
  algorithms, avoiding to use Cilk Plus.
* -DCHARS: This option allows to read inputs with 1 byte per symbol.
* -DSHORT: This option allows to read inputs with 2 bytes per symbol.
* -DMALLOC_COUNT: This option allows to measure the memory consumption
  of our algorithms.
  
## Usage ##

	```shell
	./pwt <input sequence> <alphabet size> [validation file]
	./dd <input sequence> <alphabet size> [validation file]
	```
A limitation of our current implementation is that the alphabet size
is not computed by the implementation. Instead, the alphabet size has
to be given as an argument. Note that the alphabet size has to be a
power of two. For input sequences that has an alphabet size that is
not a power of two, *<alphabet size>* is the closest power of two that
is greater that the original alphabet size.

For validation purpose, our algorithms accepts a third argument
indicating the name of an output file. We fill this output file using
the *access* operation of the wavelet tree from the position 0 up to
n-1. In order to validate the construction, is it necessary to compare
the input sequence with the output file. If both are equal, then the
wavelet tree construction is correct. This can be done with the *diff*
command. 


## To Do ##

* Compute on-the-fly the alphabet size of the input.
* Extend the input sequences to non-continous alphabets.
* Include a make file to make the compilation simpler.

## Notes ##

In our implementation we use bit array implementation of *Isaac
Turner* and the implementation of rank/select structures of *Rodrigo
Gonzalez*. To measure the memory consumption, we use the
*malloc_count* wrapper of Timo Bingmann.
