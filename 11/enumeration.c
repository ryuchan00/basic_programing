#include <stdio.h>

double square_root(double n) {
    double a, b, i, x;
    for (i = 0; i < n; i += 0.000001) {
        x = 1 + i;
        a = x * x;
        b = a - n;
        if (b >= 0) {
            return x;
        }
    }
    return 0;
}

int main(void) {
    double a, n;
    printf("n> ");
    scanf("%lf", &n);
    a = square_root(n);
    printf("square_root = %g\n", a);
    return 0;
}
