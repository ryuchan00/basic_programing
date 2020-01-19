#include <stdio.h>

double square_root(double n) {
    double a, b, c, i, y, count;
    a = 0;
    b = n;
    count = 1000;
    for (i = 0; i < count; i++) {
        c = (a + b) / 2;
        // f(x) = x^2 - N
        y = c * c - n;
        if (y < 0) {
            // 区間(c,b]
            a = c;
        } else {
            // 区間[a,c]
            b = c;
        }
    }
    return c;
}

int main(void) {
    double a, n;
    printf("n> ");
    scanf("%lf", &n);
    a = square_root(n);
    printf("square_root = %g\n", a);
    return 0;
}
