#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <sys/stat.h>

/**********************************************
 generate-data.c

 y = ax + b + e (eはN(0,1)) から x,y を生成するプログラム

 **********************************************/

#define randDouble ((double)rand()+1.0)/((double)RAND_MAX+2.0) // 0以上1未満の実数値の乱数を生成

double rand_normal(double mu, double sigma) {
    double e = sqrt(-2.0 * log(randDouble)) * sin(2.0 * M_PI * randDouble);
    return mu + sigma * e;
}

int main(int argc, char *argv[]) {
    int i, n = 100;
    double a = 1.0, b = 2.0, e;
    double x, y;

    if (argc >= 2)
        n = atoi(argv[1]);

    srand((unsigned int) time(NULL));
    rand();

    const char *dir = "./data";

    if (mkdir(dir, 0777) == 0)
        printf("ディレクトリ%sを作成しました。\n", dir);
    else
        printf("ディレクトリ%sを作成できませんでした。\n", dir);

    for (int j = 0; j < n; j++) {
        FILE *outputfile;         // 出力ストリーム

        char filename[100];
        sprintf(filename, "%s%d%s", "data/data", j + 1, ".csv");
        printf("%s", filename);
//        outputfile = fopen("data/data" + (char) j + ".csv", "w");  // ファイルを書き込み用にオープン(開く)
        outputfile = fopen(filename, "w");  // ファイルを書き込み用にオープン(開く)
        if (outputfile == NULL) {          // オープンに失敗した場合
            printf("cannot open\n");         // エラーメッセージを出して
            exit(1);                         // 異常終了
        }

        for (i = 0; i < n; i++) {
            x = randDouble * 10.0;
            e = rand_normal(0, 1);
            y = a * x + b + e;
            fprintf(outputfile, "%.3lf,%.3lf\n", x, y); // ファイルに書く
//        printf("%.3lf,%.3lf\n", x, y);
        }
        fclose(outputfile);          // ファイルをクローズ(閉じる)
    }
}

