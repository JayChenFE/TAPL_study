#假定一行内至多只能有 25 个星号. 把 max 设置为 25, 如果最长的行不会超过上#限, 那么下面的程序就不会对数据进行更改, 否则的话, 就对每一行按照比例进行缩放, 使得最长
#的行不会超过 25 个星号. 新数组 y 用来维护缩放后的长度, 这样的话, 数组 x 的元素仍然是有效的.
    { x[int($1/10)]++ }
END { max = MAXSTARS = 25;
    for (i = 0; i <= 10; i++)
        if (x[i] > max)
            max = x[i]
    
    for (i = 0; i <= 10; i++)
            y[i] = x[i]/max * MAXSTARS
    
    for (i = 0; i < 10; i++)
        printf(" %2d - %2d: %3d %s\n",10*i, 10*i+9, x[i], rep(y[i],"*"))
    
    printf("100: %3d %s\n", x[10], rep(y[10],"*"))
}

function rep(n,s, t) { # return string of n s's

    while (n-- > 0)
        t = t s
    
    return t
}