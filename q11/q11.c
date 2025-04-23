#include <stdio.h>

void find(long long int arr[], long long int n, long long int result[]);

int main()
{
    long long int n;
    scanf("%lld", &n);

    long long int arr[n];
    for(long long int i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }

    long long int result[n];

    find(arr, n, result);
    
    for(long long int i = 0; i < n; i++)
    {
        printf("%lld ", result[i]);
    }
    printf("\n");
}