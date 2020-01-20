#include <stdio.h>

void sumiarray(int n, int a[]) {
    int i, sum;
    sum = 0;
    for (i = 0; i < n; ++i) {
//        printf(" %d\n", a[i]);
        sum += a[i];
    }
    printf("%d\n", sum);
}

int main(void) {
    int a[24] = {1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8};
    sumiarray(24, a);
    return 0;
}
