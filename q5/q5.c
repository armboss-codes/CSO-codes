#include <stdio.h>

long long int find_unique(long long int arr[], long long int n, long long int err[]);
// {
//     long long int m = 1;
//     long long int previous = arr[0];
//     err[0] = arr[0];

//     for(long long int i = 1; i < n; i++)
//     {
//         if(arr[i] == previous)
//         {
//             continue;
//         }

//         err[m] = arr[i];
//         m++;
//         previous = arr[i];
//     }

//     return m;
// }

int main()
{
    long long int n;
    scanf("%lld", &n);

    long long int arr[n];
    for(long long int i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }

    long long int err[n];

    long long int m = find_unique(arr, n, err);

    for(long long int i = 0; i < m; i++)
    {
        printf("%lld ", err[i]);
    }
    printf("\n");
    return 0;
}