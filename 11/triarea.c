// triarea --- area of triangle
#include <stdio.h>

double triarea(double w, double h) {
    double s;
    s = (w * h) / 2.0;
    return s;
}

int main(void) {
    double w, h, s;
    printf("w> ");
    scanf("%lf", &w);
    printf("h> ");
    scanf("%lf", &h);
    s = triarea(w, h);
    printf("triarea = %g\n", s);
    return 0;
}
