// arrayread --- array input
#include <stdio.h>

int riarrayz(int lim, int a[]) {
    int i;
    for (i = 0; i < lim; ++i) {
        printf("%d> ", i + 1);
        scanf("%d", a + i); // &a[i]でもOK
        if (*(a + i) == 0) {
            return i;
        }
    }
    return lim;
}

int main(void) {
    int n;
    n = 2;
    int a[n];
    printf(" %2d", riarrayz(n, a));
    printf("\n");
    return 0;
}

