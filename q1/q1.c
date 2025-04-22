#include <stdio.h>

void modify_array(long long int *arr, long long int n);

int main()
{
    long long int n;
    scanf("%lld", &n);

    long long int arr[n];

    modify_array(arr, n);

    for(long long int i = 0; i < n; i++)
    {
        printf("%lld ", arr[i]);
    }
    printf("\n");
}