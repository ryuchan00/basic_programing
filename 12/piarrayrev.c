#include <stdio.h>

void piarrayrev(int n, int a[]) {
    int i, j;
    for (i = 0; i < n; ++i) {
//        printf("(%d)", i);
        j = n - 1 - i;
//        printf("(%d)", j);
        printf(" %2d", a[j]);
        if (i % 10 == 9 || i == n - 1) { printf("\n"); }
    }
}

int main(void) {
    int a[24] = {1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8};
    piarrayrev(24, a);
    return 0;
}
