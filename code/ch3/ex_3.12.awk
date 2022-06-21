# 利用前面提到过的程序 addcomma, 为金额加上逗号.

BEGIN {
    # FS = "\t"
    dashes = sp45 = sprintf("%45s", " ")
    gsub(/ /, "-", dashes) # to protect the payee
    "date" | getline date # get today's date
    split(date, d, " ")
    date = d[2] " " d[3] ", " d[6]
    initnum() # set up tables for number conversion
}
NF != 3 || $2 >= 1000000 { # illegal data
    printf("\nline %d illegal:\n%s\n\nVOID\nVOID\n\n\n", NR, $0)
    next # no check printed
}
{   printf("\n") # nothing on line 1
    printf("%s%s\n", sp45, $1) # number, indented 45 spaces
    printf("%s%s\n", sp45, date) # date, indented 45 spaces
    amt = sprintf("%.2f", $2) # formatted amount
    printf("Pay to %45.45s $%s\n", $3 dashes, addcomma(amt)) # line 4
    printf("the sum of %s\n", numtowords(amt)) # line 5
    printf("\n\n\n") # lines 6, 7 and 8
}
function numtowords(n, cents, dols) { # n has 2 decimal places
    cents = substr(n, length(n)-1, 2)
    dols = substr(n, 1, length(n)-3)
    
    if (dols == 0)
    s = "zero dollars and " cents " cents exactly"
    else
    s = intowords(dols) " dollars and " cents " cents exactly"
    
    sub(/^one dollars/, "one dollar", s)
    gsub(/ +/, " ", s)
    return s
}

function intowords(n) {
    n = int(n)

    if (n >= 1000)
        return intowords(n/1000) " thousand " intowords(n%1000)
    
    if (n >= 100)
        return intowords(n/100) " hundred " intowords(n%100)
    
    if (n >= 20){
        ten = tens[int(n/10)] 
        ones = intowords(n%10)
        if (ones == "")
            return ten
        else
            return ten "-" ones
    }

    return nums[n]
}

function initnum() {
    split("one two three four five six seven eight nine " \
          "ten eleven twelve thirteen fourteen fifteen " \
          "sixteen seventeen eighteen nineteen", nums, " ")

    split("ten twenty thirty forty fifty sixty " \
          "seventy eighty ninety", tens, " ")
}

function addcomma(x, num) {
    if (x < 0)
        return "-" addcomma(-x)
    
    num = sprintf("%.2f", x) # num is dddddd.dd
    
    while (num ~ /[0-9][0-9][0-9][0-9]/)
        sub(/[0-9][0-9][0-9][.,]/, ",&", num)
    
    return num
}