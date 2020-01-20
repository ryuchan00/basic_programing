// sort2 --- sort 2 numbers
// ref: https://joho.g-edu.uec.ac.jp/moodle3/pluginfile.php/65085/mod_resource/content/3/ohp12.pdf
#include <stdio.h>
#include <stdlib.h>

void sort2(double a, double b, double *p, double *q) {
    if (a < b) {
        *p = a;
        *q = b;
    }
    else {
        *p = b;
        *q = a;
    }
}

int main(void) {
    double a, b, x, y;
    printf("a> ");
    scanf("%lf", &a);
    printf("b> ");
    scanf("%lf", &b);
    sort2(a, b, &x, &y);
    printf("smaller = %g, larger = %g\n", x, y);
    return 0;
}
