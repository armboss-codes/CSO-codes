#include <stdio.h>

long long int special(long long int n, long long int arr[]);

int main()
{
    long long int n;
    scanf("%lld", &n);

    long long int arr[10];

    if(special(n, arr) == 1)
    {
        printf("True\n");
    }
    else
    {
        printf("False\n");
    }
}