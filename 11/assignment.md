基礎プログラミングおよび演習レポート ＃11
学籍番号:1920031
氏名:山川竜太郎
ペア学籍番号・氏名(または「個人作業」):個人作業
提出日付:2020/1/19

[課題の再掲]
演習3 数え上げ法によって平方根を求めるCプログラムを作成しなさい。精度をあげた時にどれくらいまで実用になるか検討しなさい。

演習4 区間2分法によって平方根を求めるCプログラムを作成しなさい。必要と思われる精度にしたとき、繰り返し回数がいくつになるか検討しなさい。

[実施したこととその結果]
演習3

作成したプログラム

```
#include <stdio.h>

double square_root(double n) {
    double a, b, i, x;
    for (i = 0; i < n; i += 0.0001) {
        x = 1 + i;
        a = x * x;
        b = a - n;
        if (b >= 0) {
            return x;
        }
    }
    return 0;
}

int main(void) {
    double a, n;
    printf("n> ");
    scanf("%lf", &n);
    a = square_root(n);
    printf("square_root = %g\n", a);
    return 0;
}
```

結果

```

```

演習4

作成したプログラム

```
#include <stdio.h>

double square_root(double n) {
    double a, b, c, i, y, count;
    a = 0;
    b = n;
    count = 1000;
    for (i = 0; i < count; i++) {
        c = (a + b) / 2;
        // f(x) = x^2 - N
        y = c * c - n;
        if (y < 0) {
            // 区間(c,b]
            a = c;
        } else {
            // 区間[a,c]
            b = c;
        }
    }
    return c;
}

int main(void) {
    double a, n;
    printf("n> ");
    scanf("%lf", &n);
    a = square_root(n);
    printf("square_root = %g\n", a);
    return 0;
}
```

[考察]

[アンケート]
Q1. C言語でプログラムが書けるようになりましたか。

Q2. CとRubyはどのように違うと感じていますか。

Q3. リフレクション(今回の課題で分かったこと)・感想・要望をどうぞ。
