all:
	gcc sieve.c -o sieveC
	gfortran -o sieveFortran sieve.f95
	gnatmake sieve.adb -o sieveAda
