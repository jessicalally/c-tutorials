# include <stdio.h>

/* The challenge was to write a swap function which does not use a temporary variable */

void swap(int *a, int *b) {
  *a -= *b;
  *b += *a;
  *a = *b - *a;
}

int main(void) {
  int a = 42;
  int b = 77;

  printf("a : %i, b : %i\n", a, b);
  swap(&a, &b);
  printf("a : %i, b : %i\n", a, b);

  return 0;
}
