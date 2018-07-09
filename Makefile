all: test21 test12

clean:
	rm -f lib1.o lib1.a lib2.o lib2.a test12 test21

.PHONY: all clean

lib1.o: lib1.c
	$(CC) -c $^ -o $@

lib1.a: lib1.o
	$(AR) rc $@ $^
	$(RANLIB) $@

lib2.o: lib2.c
	$(CC) -c $^ -o $@

lib2.a: lib2.o
	$(AR) rc $@ $^
	$(RANLIB) $@

test12: test.c lib1.a lib2.a
	$(CC) $^ -o $@

test21: test.c lib2.a lib1.a
	$(CC) $^ -o $@
