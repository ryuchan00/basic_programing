// array1 --- array demonstration
#include <stdio.h>

void piarray(int n, int a[]) {
    int i;
    for (i = 0; i < n; ++i) {
//        printf("(%d)", i);
        printf(" %2d", a[i]);
        if (i % 10 == 9 || i == n - 1) { printf("\n"); }
    }
}

int main(void) {
    int a[24] = {1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8};
    piarray(24, a);
    return 0;
}
