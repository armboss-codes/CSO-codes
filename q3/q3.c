#include <stdio.h>

long long score(char *str);

int main()
{
    char str[101];
    scanf("%s", str);

    printf("%lld\n", score(str));
    return 0;
}