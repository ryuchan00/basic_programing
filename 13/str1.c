// str1.c --- string demonstration 1.
#include <stdio.h>

void printdup(char s[]) {
    char buf[100];
    int i, j = 0;
    for (i = 0; s[i] != '\0';
         ++i) {
        buf[j++] = s[i];
        buf[j++] = s[i];
    }
    buf[j] = '\0';
    printf("%s\n", buf);
}

int main(void) {
    int n, i;
    printf("n> ");
    scanf("%d", &n);
    char str[] = "abcde";
    for (i = 0; i < n; i++) {
        printdup(str);
    }
    return 0;
}
