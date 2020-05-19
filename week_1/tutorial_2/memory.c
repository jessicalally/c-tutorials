# include <stdio.h>
# include <stdlib.h>
# include <assert.h>

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
  assert((commands != NULL) && "Pointer cannot be null.");

  for (int i = 0; i < n; i++) {
    printf("%s\n", commands[i]);
  }
}

void freeCommands(char **commands, int n) {
  assert((commands != NULL) && "Pointer cannot be null.");

  for (int i = 0; i < n; i++) {
    free(commands[i]);
  }
  free(commands);
}

int stringLength(char *string) {
  int length = 0;
  while (string[length] != '\0') {
    length++;
  }
  return length;
}

char *stringCat(char *string1, char *string2) {
  int len_string1 = stringLength(string1);
  int len_string2 = stringLength(string2);
  char *newString = (char*) calloc(len_string1 + len_string2, sizeof(char));

  for (int i = 0; i < len_string1; i++) {
    newString[i] = string1[i];
  }

  for (int i = 0; i < len_string2; i++) {
    newString[len_string1 + i] = string2[i];
  }

  newString[len_string1 + len_string2] = '\0';
  return newString;
}

void printCommandLengths(char **commands, int n) {
  for (int i = 0; i < n; i++) {
    printf("Command: %s, Length: %d\n", commands[i], stringLength(commands[i]));
  }
}

void printCommandConcat(char **commands, int n) {
  int total_length = 0;

  for (int i = 0; i < n; i++){
    total_length += stringLength(commands[i]);
  }

  char *concat_string = (char*) calloc(total_length, sizeof(char));

  for (int i = 0; i < n; i++) {
    concat_string = stringCat(concat_string, commands[i]);
  }

  printf("Command: %s, Length: %d\n", concat_string, stringLength(concat_string));

  free(concat_string);
}


int main(int argc, char **argv) {
  int n;
  size_t size;
  sscanf(argv[1], "%d", &n);
  sscanf(argv[2], "%lu", &size);

  char **commands = getCommands(n, size);
  printCommands(commands, n);

  printCommandLengths(commands, n);

  printCommandConcat(commands, n);

  freeCommands(commands, n);

}
