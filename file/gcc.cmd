@set paths=%PATH%
@set PATH=C:\cygwin\bin;c:\mingw\bin\;c:\nasm\;c:\tcc\;%paths%
@as --32 -march=i686 -o .\tmp\boot.o .\file\boot.s
@gcc -m32  -c -nostdlib -o .\tmp\kernel.o %1
@ld -nostdlib -T .\file\link.ld .\tmp\boot.o .\tmp\kernel.o -o .\tmp\kernel.bin
@objcopy .\tmp\kernel.bin -O elf32-i386  .\tmp\file.bin
@set PATH=%paths%
