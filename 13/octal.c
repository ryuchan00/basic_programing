#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>

bool getl(char s[], int lim, int *octal, int *length) {
    int c, i = 0;
    for (c = getchar(); c != EOF && c != '\n';
         c = getchar()) {
        s[i++] = c;
        if (s[0] == '0') {
            *octal = 1;
            i--;
        }
        if (i + 1 >= lim) { break; }
    }
    *length = i;
    s[i] = '\0';
    return c != EOF;
}

int main(void) {
    int i, n, octal = 0, length, number;
    char buf[100];
    printf("n> ");
    getl(buf, 100, &octal, &length);
    n = atoi(buf);
    if (octal == 1) {
        n = 0;
        for (i = 0; i < length; i++) {
            // '0'は整数値48、それから引くと文字列から数値に変換できる
            n += (buf[i] - '0') * pow(8, length - 1 - i);
        }
    }
    printf("%d\n", n);
    return 0;
}
