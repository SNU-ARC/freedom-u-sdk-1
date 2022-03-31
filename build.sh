#!/bin/bash

unset RISCV

if [ $1 = 'clean' ]
then
	rm work/bbl.bin
	rm -rf work/riscv-pk
	rm -rf work/linux

elif [ $1 = 'make' ]
then
  unset LD_LIBRARY_PATH
	make -j`nproc`
  cp work/riscv-pk/bbl boot.elf

elif [ $1 = 'sd' ]
then
	make DISK=/dev/sdb vc707-sd-write

else
	echo "Wrong command! Input clean, make or sd!"
fi
