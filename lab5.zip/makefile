lab5: check_guess.o main.o getkeyword.o mod.o init_unknown.o print_array.o get_guess.o
	gcc -o lab5 check_guess.o main.o getkeyword.o mod.o init_unknown.o print_array.o get_guess.o 

main.o: main.s
	gcc -c -g main.s

getkeyword.o: getkeyword.s
	gcc -c -g getkeyword.s

mod.o: mod.s
	gcc -c -g mod.s

init_unknown.o: init_unknown.s
	gcc -c -g init_unknown.s


print_array.o: print_array.s
	gcc -c -g print_array.s

get_guess.o: get_guess.s
	gcc -c -g get_guess.s

check_guess.o: check_guess.s
	gcc -c -g check_guess.s

clean:
	rm *.o lab5
