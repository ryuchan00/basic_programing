#include <stdio.h>

int main(void) {
    int i, n, fib[31] = {1, 1};
    printf("Fib Array");
    printf("\n");
    printf("%d: %2d", 0, fib[0]);
    printf("\n");
    printf("%d: %2d", 1, fib[1]);
    printf("\n");
    for (i = 2; i <= 30; ++i) {
        fib[i] = fib[i - 1] + fib[i - 2];
        printf("%d: %2d", i, fib[i]);
        printf("\n");
    }
    printf("n> ");
    scanf("%d", &n);
    printf(" %2d", fib[n]);
    printf("\n");
    return 0;
}
