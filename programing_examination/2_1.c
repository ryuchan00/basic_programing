// memo: 最終的に(5)の式を利用する
#include <stdio.h>
#include <math.h>

void average(int n, int a[n][2], double ave[2]) {
    int i, j, sum = 0;
    for (j = 0; j < 2; ++j) {
        sum = 0;
        for (i = 0; i < n; ++i) {
            sum = sum + a[i][j];
        }
        ave[j] = (double) sum / n;
    }
}

double S1(int n, int a[n][2]) {
    int i = 0;
    double sum = 0;
    for (i = 0; i < n; ++i) {
        sum = sum + (a[i][0] * a[i][1]);
    }
    return (double) sum / n;
}

double S2(int n, int a[n][2]) {
    int i = 0;
    double sum = 0;
    for (i = 0; i < n; ++i) {
        sum = sum + (a[i][0] * a[i][0]);
    }
    return (double) sum / n;
}

double a_katamuki(int n, int a[n][2], double s1, double s2, double ave[2]) {
    return (s1 - (double) (ave[0] * ave[1])) / (s2 - (double) (ave[0] * ave[0]));
}

double b_seppen(int n, int a[11][2], double s1, double s2, double ave[2]) {
    return (ave[1] * s2 - ave[0] * s1) / (s2 - (double) (ave[0] * ave[0]));
}

int main(void) {
    double ave[2], s1, s2;
    int a[11][2] = {{168, 60},
                    {162, 55},
                    {171, 65},
                    {159, 60},
                    {174, 72},
                    {166, 57},
                    {175, 61},
                    {176, 66},
                    {168, 56},
                    {182, 69},
                    {179, 62}};
    average(11, a, ave);
    s1 = S1(11, a);
    s2 = S2(11, a);
    printf("a:%f\n", a_katamuki(11, a, s1, s2, ave));
    printf("b:%f\n", b_seppen(11, a, s1, s2, ave));
    return 0;
}

//実行結果
//$ ./2_1
//a:0.515184
//b:-25.958785
