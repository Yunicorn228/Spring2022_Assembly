primeNum: main.o checkPrimeNumber.o
	gcc -o primeNum main.o checkPrimeNumber.o

main.o: main.c
	gcc -g -c main.c

checkPrimeNumber.o: checkPrimeNumber.s
	gcc -g -c checkPrimeNumber.s

clean:
	rm *.o