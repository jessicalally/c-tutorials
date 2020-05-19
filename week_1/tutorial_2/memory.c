# include <stdio.h>
# include <stdlib.h>
# include <string.h>

char *createCommand(size_t size) {
  char *ptr = (char*) calloc(size, sizeof(char));
  return ptr;
}

char **createCommands(int n) {
  char **ptrs = (char**) calloc(n, sizeof(char*));
  for (int i = 0; i < n; i++) {
    ptrs[i] = NULL;
  }
  return ptrs;
}

char *getCommand(size_t size) {
  char *command = createCommand(size);
  printf("> ");
  scanf("%s", command);
  return command;
}

char **getCommands(int n, size_t size) {
  char **commands = createCommands(n);
  for (int i = 0; i < n; i++) {
    commands[i] = getCommand(size);
  }
  return commands;
}

void printCommands(char **commands, int n) {
  for (int i = 0; i < n; i++) {
    printf("%s\n", commands[i]);
  }
}

void freeCommands(char **commands, int n) {
  for (int i = 0; i < n; i++) {
    free(commands[i]);
  }
  free(commands);
}

int main(int argc, char **argv) {
  int n;
  size_t size;
  sscanf(argv[1], "%d", &n);
  sscanf(argv[2], "%lu", &size);

  char **commands = getCommands(n, size);
  printCommands(commands, n);
  freeCommands(commands, n);
}
