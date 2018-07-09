this is why i dislike gnu linker

```
❯ make clean all CC=x86_64-linux-musl-gcc AR=x86_64-linux-musl-ar RANLIB=x86_64-linux-musl-ranlib
rm -f lib1.o lib1.a lib2.o lib2.a test12 test21
x86_64-linux-musl-gcc -c lib2.c -o lib2.o
x86_64-linux-musl-ar rc lib2.a lib2.o
x86_64-linux-musl-ranlib lib2.a
x86_64-linux-musl-gcc -c lib1.c -o lib1.o
x86_64-linux-musl-ar rc lib1.a lib1.o
x86_64-linux-musl-ranlib lib1.a
x86_64-linux-musl-gcc test.c lib2.a lib1.a -o test21
x86_64-linux-musl-gcc test.c lib1.a lib2.a -o test12
lib2.a(lib2.o): In function `lib2':
lib2.c:(.text+0x5): undefined reference to `lib1'
collect2: error: ld returned 1 exit status
make: *** [test12] Error 1

❯ make clean all CC=clang AR=ar RANLIB=ranlib
rm -f lib1.o lib1.a lib2.o lib2.a test12 test21
clang -c lib2.c -o lib2.o
ar rc lib2.a lib2.o
ranlib lib2.a
clang -c lib1.c -o lib1.o
ar rc lib1.a lib1.o
ranlib lib1.a
clang test.c lib2.a lib1.a -o test21
```
