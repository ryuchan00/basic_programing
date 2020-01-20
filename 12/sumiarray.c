#include <stdio.h>

int sumiarray(int n, int a[]) {
    int i, sum;
    sum = 0;
    for (i = 0; i < n; ++i) {
//        printf(" %d\n", a[i]);
        sum += a[i];
    }
    return sum;
}

int main(void) {
    int a[24] = {1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8};
    printf("%d\n", sumiarray(24, a));
    return 0;
}
