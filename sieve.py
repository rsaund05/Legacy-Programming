#!/usr/bin/python3
import sys
import time

#Algorithm used: https://www.geeksforgeeks.org/sieve-of-eratosthenes/

upper = int(input("(Python)\nEnter Upper Bound: "))
fp = open("outputPython.txt", "w")
if upper > 0:
	start_time = time.time()
	prime = [1 for k in range(upper + 1)]
	i = 2
	while(i * i <= upper):
		if(prime[i] == 1):
			#Update multiples of p
			for j in range(i * 2, upper + 1, i):
				prime[j] = 0
		i += 1
	for i in range(2, upper):
		if prime[i] == 1:
			fp.write(str(i) + "\n")
	print("Execution time: {} milliseconds".format(1000*(time.time() - start_time)))
	fp.close()
else:
	print("INPUT ERROR: Exiting.\n")
	fp.close()
