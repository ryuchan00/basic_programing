#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 10000

double averagex(int n, double x[n]) {
    int i, sum = 0;
    for (i = 0; i < n; ++i) {
        sum = sum + x[i];
    }
    return (double) sum / n;
}

double averagey(int n, double y[n]) {
    int i, sum = 0;
    for (i = 0; i < n; ++i) {
        sum = sum + y[i];
    }
    return (double) sum / n;
}

double S1(int n, double x[n], double y[n]) {
    int i = 0;
    double sum = 0;
    for (i = 0; i < n; ++i) {
        sum = sum + (x[i] * y[i]);
    }
    return (double) sum / n;
}

double S2(int n, double x[n]) {
    int i = 0;
    double sum = 0;
    for (i = 0; i < n; ++i) {
        sum = sum + (x[i] * x[i]);
    }
    return (double) sum / n;
}

double a_katamuki(int n, double x[n], double y[n], double avex, double avey, double s1, double s2) {
    return (s1 - (double) (avex * avey)) / (s2 - (double) (avex * avex));
}

double b_seppen(int n, double x[n], double y[n], double avex, double avey, double s1, double s2) {
    return (avey * s2 - avex * s1) / (s2 - (double) (avex * avex));
}

void read_file(int n, double x[], double y[], char *filename) {
    int i = 0;

    FILE *fp;
    //ファイルを開く

    if ((fp = fopen(filename, "r")) != NULL) {
        //ファイルが終わるまで読み込む
        while (fscanf(fp, "%lf,%lf", &x[i], &y[i]) != EOF) {
//            テスト用
//            printf("%lf,%lf\n", x[i], y[i]);
            i++;
        }
        fclose(fp);
    }
}

int main(int argc, char *argv[]) {
    int i, n = 100;
    char filename[100];

    if (argc >= 2) {
        n = atoi(argv[1]);
    }

    for (i = 0; i < 100; i++) {
        // ファイル読み込み処理
        double x[N], y[N];
        sprintf(filename, "%s%d%s", "data/data", i + 1, ".csv");
        read_file(N, x, y, filename);

        double avex, avey, s1, s2;
        avex = averagex(N, x);
        avey = averagey(N, y);
        s1 = S1(N, x, y);
        s2 = S2(N, x);
        printf("%f\t%f\n", a_katamuki(N, x, y, avex, avey, s1, s2), b_seppen(N, x, y, avex, avey, s1, s2));
//        printf("b:%f\n", b_seppen(N, x, y, avex, avey, s1, s2));
    }

    return 0;
}
