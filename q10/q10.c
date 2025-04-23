#include <stdio.h>

long long int is_balanced(char *str, long long int len);
// {    
//     char stack[len];     // Stack to store opening brackets
//     long long int top = -1;

//     for (long long int i = 0; i < len; i++) {
//         char ch = str[i];

//         if (ch == '(' || ch == '{' || ch == '[')
//         {
//             stack[++top] = ch;   // Push to stack
//         }
//         else 
//         {
//             if (top == -1) {
//                 return 0; // No matching opening bracket
//             }

//             char top_char = stack[top--]; // Pop from stack

//             if ((ch == ')' && top_char != '(') ||
//                 (ch == '}' && top_char != '{') ||
//                 (ch == ']' && top_char != '[')) {
//                 return 0; // Mismatch
//             }
//         }
//     }

//     // If stack is empty at the end, it's balanced
//     return (top == -1) ? 1 : 0;
// }

int main()
{
    long long int n;
    scanf("%lld", &n);

    char str[n + 1];
    scanf("%s", str);

    long long int result = is_balanced(str, n);

    if(result == 1)
    {
        printf("BALANCED\n");
    }
    else
    {
        printf("NOT BALANCED\n");
    }

    return 0;
}
