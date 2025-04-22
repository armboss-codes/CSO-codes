#include <stdio.h>

long long int check(long long int arr[], long long int n);

int main()
{
    long long int n;
    scanf("%lld", &n);

    long long int arr[n];
    for(long long int i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }

    if(check(arr, n) == 1)
    {
        printf("True\n");
    }
    else
    {
        printf("False\n");
    }
}