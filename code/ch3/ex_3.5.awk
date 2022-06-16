# 根据比例决定星号的个数, 使得当数据过多时, 一行的长度不会超过屏幕的宽度
    { x[int($1/10)]++;sum++; }
END { for (i = 0; i < 10; i++)
        printf(" %2d - %2d: %3d, %2d%% %s\n",10*i, 10*i+9, x[i], int(x[i]*100/sum), rep(int(x[i]*100/sum),"*"))
        
      printf(" 100    : %3d, %2d%% %s\n", x[10], int(x[10]*100/sum), rep(int(x[10]*100/sum),"*"))
    }

function rep(n,s, t) { # return string of n s's
    while (n-- > 0){
        t = t s
    }
    return t
}