#include <stdio.h>

void print_array(int *, int);


void print_array(int *a, int n)
{
    int i;

    for (i = 0; i < n; i++)
        printf("%d ", *(a+i));

    printf("\n\n");
}
