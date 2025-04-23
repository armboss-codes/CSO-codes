#include <stdio.h>

long long int binary_search(long long int arr[], long long int low, long long int high, long long int target);
// {
//     if(low > high)
//     {
//         return -1;
//     }

//     long long int mid = (high + low) / 2;
    
//     if(arr[mid] == target)
//     {
//         return mid;
//     }
//     else if(arr[mid] < target)
//     {
//         return binary_search(arr, mid + 1, high, target);
//     }
//     else
//     {
//         return binary_search(arr, low, mid - 1, target);
//     }
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

    long long int target;
    scanf("%lld", &target);

    printf("%lld\n", binary_search(arr, 0, n - 1, target));
    return 0;
}