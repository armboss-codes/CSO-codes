#include <stdio.h>

void waveform(long long int arr[], long long int n);

int main()
{
    long long int n;
    scanf("%lld", &n);

    long long int arr[n];
    for(long long int i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }

    waveform(arr, n);

    for(long long int j = 0; j < n; j++)
    {
        printf("%lld ", arr[j]);
    }
    printf("\n");
    return 0;
}