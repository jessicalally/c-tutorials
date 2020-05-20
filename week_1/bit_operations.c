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

uint16_t first(uint32_t x) {
  int mask = 0xffff0000;

  x = x & mask;
  x = x >> 16;

  uint16_t top_16 = (uint16_t) x;
  return top_16;
}

uint16_t second(uint32_t x) {
  int mask = 0x0000ffff;

  x = x & mask;

  uint16_t bottom_16 = (uint16_t) x;
  return bottom_16;
}

void printBits16(uint16_t x) {
  uint16_t mask = 1 << 15;

  for (int i = 0; i < 16; i++) {
    printf("%i", (x & mask) != 0);
    mask = mask >> 1;
  }
  printf("\n");
}

void printSBits16(int16_t x) {
 uint16_t mask = 1 << 15;

  for (int i = 0; i < 16; i++) {
    printf("%i", (x & mask) != 0);
    mask = mask >> 1;
  }
  printf("\n");
}


int main(void) {
  uint32_t n = 1288243249;

  printBits(n);

  printBits16(first(n));
  printBits16(second(n));

  printBits(first(n));
  printBits(second(n));

  int16_t signedFirst = first(n);

  printf("%u\n", first(n));
  printf("%d\n", signedFirst);

  signedFirst = first(n) << 1;

  printf("%u\n", first(n));
  printf("%d\n", signedFirst);

  printBits16(first(n));
  printSBits16(signedFirst);

  return 0;
}
