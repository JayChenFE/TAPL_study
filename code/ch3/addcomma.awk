# addcomma - put commas in numbers
# input: a number per line
# output: the input number followed by
# the number with commas and two decimal places

#请注意 & 的用法, 通过文本替换, sub 在每三个数字的前面插入一个逗号.
#这是某些测试数据的输出: 0 0.00
#-1 -1.00
#-12.34 -12.34
#12345 12,345.00
#-1234567.89 -1,234,567.89
#-123. -123.00
#-123456 -123,456.00
{ printf("%-12s %20s\n", $0, addcomma($0)) }

function addcomma(x, num) {
    if (x < 0)
        return "-" addcomma(-x)
    
    num = sprintf("%.2f", x) # num is dddddd.dd
    
    while (num ~ /[0-9][0-9][0-9][0-9]/)
        sub(/[0-9][0-9][0-9][.,]/, ",&", num)
    
    return num
}