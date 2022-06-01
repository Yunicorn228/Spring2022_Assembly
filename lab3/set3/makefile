primeNum: main.o checkPrimeNumber.o
	gcc -o primeNum main.o checkPrimeNumber.o

main.o: main.s
	gcc -g -c main.s

checkPrimeNumber.o: checkPrimeNumber.s
	gcc -g -c checkPrimeNumber.s

clean:
	rm *.o