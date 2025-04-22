#include <stdio.h>

long long int sum(long long int *arr, long long int size);

int main()
{
    long long int m, n;
    scanf("%lld %lld", &m, &n);

    long long int matrix[m * n];
    for(int i = 0; i < m * n; i++)
    {
        scanf("%lld", &matrix[i]);
    }

    printf("%lld\n", sum(matrix, m * n));
    return 0;
}