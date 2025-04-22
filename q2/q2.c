#include <stdio.h>

int palindrome(int n);

int main()
{
    int n;
    scanf("%d", &n);

    if(palindrome(n))
    {
        printf("True\n");
    }
    else
    {
        printf("False\n");
    }
}