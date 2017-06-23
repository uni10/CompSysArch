#!/bin/bash

clang -O2 epuzzle.c
./a.out > tmp
echo test0
diff tmp test0.txt
rm tmp
sed -e "s/{{2, 4}, {5, 3}, {1, 0}}/{{5, 3}, {0, 4}, {2, 1}}/g" epuzzle.c > epuzzle1.c
clang -O2 epuzzle1.c
./a.out > tmp
echo test1
diff tmp test1.txt
rm tmp
sed -e "s/{{2, 4}, {5, 3}, {1, 0}}/{{2, 0}, {1, 3}, {4, 5}}/g" epuzzle.c > epuzzle2.c
clang -O2 epuzzle2.c
./a.out > tmp
echo test2
diff tmp test2.txt
rm tmp
rm epuzzle1.c epuzzle2.c
rm a.out
