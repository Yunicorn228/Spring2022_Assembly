lab4: main.o init_deck.o mod.o print_array.o swap.o handleCheckEndGame.o handleCheckZero.o handleNextRound.o
	gcc -o lab4 main.o init_deck.o mod.o print_array.o swap.o handleCheckEndGame.o handleCheckZero.o handleNextRound.o

main.o: main.s
	gcc -c -g main.s

init_deck.o: init_deck.s
	gcc -c -g init_deck.s

mod.o: mod.s
	gcc -c -g mod.s

print_array.o: print_array.c
	gcc -c -g print_array.c

swap.o: swap.s
	gcc -c -g swap.s

handleCheckEndGame.o: handleCheckEndGame.s
	gcc -c -g handleCheckEndGame.s

handleCheckZero.o: handleCheckZero.s
	gcc -c -g handleCheckZero.s

handleNextRound.o: handleNextRound.s
	gcc -c -g handleNextRound.s

clean:
	rm *.o lab4
