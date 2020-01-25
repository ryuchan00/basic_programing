#include <stdio.h>

// 整数配列と整数値を渡し、指定した整数値が配列の何番に入っているかを返す。ただし1番最初にマッチした配列の添字である。
int iindex(int n, int a[], int x) {
    int i;
    for (i = 0; i < n; ++i) {
        if (x == a[i]) {
            return i + 1;
        }
    }
    return -1;
}

int main(void) {
    int a[8] = {1, 2, 3, 4, 5, 6, 7, 8};
    printf("%d\n", iindex(8, a, 2));
    printf("%d\n", iindex(8, a, 8));
    printf("%d\n", iindex(8, a, 9));
    return 0;
}
