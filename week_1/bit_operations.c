# include <stdio.h>
# include <stdint.h>

void printBits(uint32_t x) {
  uint32_t mask = 1 << 31;

  for (int i = 0; i < 32; i++) {
    if ((x & mask) == 0) {
      printf("0");
    } else {
      printf("1");
  }
    if (i == 15) {
       printf(" ");
    }
    x = x << 1;
  }
  printf("\n");
}

int main(void) {
  uint32_t n = 1288243249;

  printBits(n);

  return 0;
}
