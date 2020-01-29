// str3.c --- string demonstration 3 --- wrong version.
#include <stdio.h>
#include <stdbool.h>

bool getl(char s[], int lim) {
    int c, i = 0;
    for (c = getchar(); c != EOF && c != '\n';
         c = getchar()) {
        s[i++] = c;
        if (i + 1 >= lim) { break; }
    }
    s[i] = '\0';
    return c != EOF;
}

int main(void) {
    int i, n;
    char buf[100];
    printf("n> ");
    scanf("%d", &n);
    printf("s> ");
    getl(buf, 100);
    for (i = 0; i < n; ++i) { printf("%s\n", buf); }
    return 0;
}
