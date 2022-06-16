{ total[$1] += $2 }
# END { for (x in total) print x, total[x] | "sort -k1,2 -n" }
# END { for (x in total) print x, total[x] }
END { for ( x in total) print x, total[x] | "sort"}
