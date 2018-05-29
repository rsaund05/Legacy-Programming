
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//Algorithm used: https://www.geeksforgeeks.org/sieve-of-eratosthenes/

void sieve(int upper);

int main(void){
	int upper = 0;
	printf("(C)\nInput upper bound: ");
	scanf("%d", &upper);
	if(upper > 0){
		clock_t begin = clock();
		sieve(upper);
		clock_t end = clock();
		double time = 1000*(double)(end - begin) / CLOCKS_PER_SEC;
		printf("Total Execution Time: %lf milliseconds\n", time);
	} else {
		printf("INPUT ERROR. Exiting.\n");
	}

	return 0;
}

void sieve(int upper){
	char* buff;
	FILE* fp = fopen("outputC.txt", "w");
	int *prime = malloc(sizeof(int) * (upper + 1)); //Need to allocate on the heap, as allocating over 1,000,000 ints on the stack causes a segfault
	//Init array to all be 'true'
	for(int i = 0; i < upper + 1; i++){
		prime[i] = 1; 
	}
	for(int p = 2; p * p <= upper; p++){
		if(prime[p] == 1){
			//Update mutiples of p
			for(int j = p * 2; j <= upper; j += p){
				prime[j] = 0;
			}
		}
	}
	for(int k = 2; k <= upper; k++){
		if(prime[k] == 1){
			fprintf(fp, "%d\n", k);
		}
	}
}