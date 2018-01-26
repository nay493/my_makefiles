CC=gcc
CFLAGS=-shared
LFLAGS=""


a.out: main.o libavg.a libadd.so
	${CC} -o a.out main.o -I. -L. -lavg -ladd

main.o: main.c
	${CC} -c  main.c

libavg.a: average.o
	ar cr libavg.a average.o

average.o: average.c
	${CC} -c average.c

libadd.so: add.o
	${CC} -fPIC ${CFLAGS}  add.o -o libadd.so

add.o: add.c
	${CC} -fPIC -c add.c
clean:
	rm *.o *.a *.so a.out
