#include <stdio.h>
#include <math.h>

double square_root(double n) {
    double a, b, i, x;
    for (i = 1; i < n; i += 0.0001) {
        x = 1 + i;
        a = pow(x, 2);
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
