lab4: array.o init_deck.o main.o make_deck.o mod.o printArray.o sort.o stop.o swap.o
	gcc -o lab4 array.o init_deck.o main.o make_deck.o mod.o printArray.o sort.o stop.o swap.o 

array.o: array.s
	gcc -c -g array.s

init_deck.o: init_deck.s
	gcc -c -g init_deck.s

mod.o: mod.s
	gcc -c -g mod.s

main.o: main.s
	gcc -c -g main.s

printArray.o: printArray.s
	gcc -c -g printArray.s

make_deck.o: make_deck.s
	gcc -c -g make_deck.s

sort.o: sort.s
	gcc -c -g sort.s

stop.o: stop.s
	gcc -c -g stop.s
	
swap.o: swap.s
	gcc -c -g swap.s

clean:
	rm *.o lab4
