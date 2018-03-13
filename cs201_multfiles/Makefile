.PHONY: clean
CFLAGS= -ansi -pedantic -O0 -Wall

all: hw4 hw4asm

hw4: hw4.o mult.o
	gcc -g -o hw4 $(CFLAGS) hw4.o mult.o

hw4asm: hw4.o multA.o
	gcc -g -o hw4asm $(CFLAGS) hw4.o multA.o

hw4.o: hw4.c
	gcc -c -g -o hw4.o $(CFLAGS) hw4.c

mult.o: mult.c
	gcc -c -g -o mult.o $(CFLAGS) mult.c

multA.o: multA.S
	as --64 -o multA.o multA.S
	
clean:
	rm -f *.o hw4 hw4asm
