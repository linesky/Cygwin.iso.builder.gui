@set paths=%PATH%
@set PATH=c:\cygwin64\bin;c:\mingw\bin\;c:\nasm\;%paths%
@as --32 -o .\tmp\boot.o .\file\boot.s
@gcc -m32 -c -nostdlib -o .\tmp\kernel.o %1
@c:\mingw\bin\ld -nostdlib -T .\file\link.ld .\tmp\boot.o .\tmp\kernel.o -o .\tmp\kernel.bin
@objcopy .\tmp\kernel.bin -O elf32-i386  .\tmp\file.bin
@set PATH=%paths%
