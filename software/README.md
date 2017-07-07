# なんたらアーキテクチャなんたら特論

```sh
/opt/riscv32/bin/clang -O2 -target riscv64 -mriscv=RV64IAMFD -S epuzzle.c -o epuzzle.S
riscv32-unknown-elf-clang -O2 -S epuzzle.c -o epuzzle.S --sysroot=/opt/riscv32
```

## Test case

```
  uint8_t state[][COLUMN] = {{2, 4}, {5, 3}, {1, 0}};
  uint8_t state[][COLUMN] = {{5, 3}, {0, 4}, {2, 1}};
  uint8_t state[][COLUMN] = {{2, 0}, {1, 3}, {4, 5}};
```
