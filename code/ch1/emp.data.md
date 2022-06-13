```shell
awk '$3 > 0 { print $1, $2 * $3 }' emp.data

awk '$3 == 0 { print $1 }' emp.data

awk '$3 == 0 { print $1 }'
Beth 4.00 0
# Beth


awk -f progfile        optional list of files
```



## 实用一行程序

```shell
# 1. 输入行的总行数
 END { print NR }

# 2. 打印第 10 行
NR == 10

# 3. 打印每一个输入行的最后一个字段
{ print $NF }

# 4. 打印最后一行的最后一个字段
{ field = $NF }

END { print field }
# 5. 打印字段数多于 4 个的输入行

NF > 4

# 6. 打印最后一个字段值大于 4 的输入行

$NF > 4

# 7. 打印所有输入行的字段数的总和

{ nf = nf + NF }

END { print nf }

# 8. 打印包含 Beth 的行的数量

/Beth/ { nlines = nlines + 1 }

END { print nlines }

# 9. 打印具有最大值的第一个字段, 以及包含它的行 (假设 $1 总是 正的) 

$1 > max { max = $1; maxline = $0 }
END { print max, maxline }

# 10. 打印至少包含一个字段的行

NF > 0

# 11. 打印长度超过 80 个字符的行

length($0) > 80

# 12. 在每一行的前面加上它的字段数

{ print NF, $0 }

# 13. 打印每一行的第 1 与第 2 个字段, 但顺序相反

{ print $2, $1 }

# 14. 交换每一行的第 1 与第 2 个字段, 并打印该行

{ temp = $1; $1 = $2; $2 = temp; print }

# 15. 将每一行的第一个字段用行号代替

{ $1 = NR; print }

# 16. 打印删除了第 2 个字段后的行

{ $2 = ""; print }

# 17. 将每一行的字段按逆序打印

{ for (i = NF; i > 0; i = i - 1) printf("%s ", $i)
	printf("\n")
}

# 18. 打印每一行的所有字段值之和

{ sum = 0
  for (i = 1; i <= NF; i = i + 1) sum = sum + $i
  print sum
}

# 19. 将所有行的所有字段值累加起来

{ for (i = 1; i <= NF; i = i + 1) sum = sum + $i }
END { print sum }

# 20. 将每一行的每一个字段用它的绝对值替换

{ for (i = 1; i <= NF; i = i + 1) if ($i < 0) $i = -$i
 	print
}
```

