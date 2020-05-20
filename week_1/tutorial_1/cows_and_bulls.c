#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define CODE_LENGTH 4
#define NUM_GAMES 5

int anotherGame(void) {
	char answer;

	do {
		printf("Do you want to play another game? [y/n]:\n");
		scanf("%c", &answer);
	} while (!('y' == tolower(answer) || 'n' == tolower(answer)));

	return 'y' == tolower(answer);
}



void readGuess(int *guess) {
	printf("Enter your guess: \n");

	for (int i = 0; i < 4; i++) {
		do {
			scanf("%d", &guess[i]);
			getchar();
		} while (guess[i] < 1 || guess[i] > 9);
	}

}

int blackScore(int guess[CODE_LENGTH], int code[CODE_LENGTH]){
  int score = 0;
	for (int i = 0; i < CODE_LENGTH; i++) {
		if (code[i] == guess[i]){
			score++;
		}
	}

	return score;
}

int whiteScore(int guess[CODE_LENGTH], int code[CODE_LENGTH]) {
	int score = 0;
	for (int i = 0; i < CODE_LENGTH; i++) {
		for (int j = 0; j < CODE_LENGTH; j++) {
			if (i != j && code[i] == guess[j]) {
				score++;
			}
		}
	}
	return score;
}

void printScore(int g[CODE_LENGTH], int c[CODE_LENGTH]) {
	printf("(%d,%d)\n", blackScore(g, c), whiteScore(g, c));
}

int main(void) {
	int codes[NUM_GAMES][CODE_LENGTH] = {{1, 8, 9, 2}, {2, 4, 6, 8}, {1, 9, 8, 3}, {7, 4, 2, 1}, {4, 6, 8, 9}};

	for (int i = 0; i < NUM_GAMES; i++) {
		int guess[CODE_LENGTH];

		while (blackScore(guess, codes[i]) != CODE_LENGTH) {
			readGuess(guess);
			printScore(guess, codes[i]);
		}

		printf("You have guessed correctly!\n");

		if (i < NUM_GAMES - 1) {
			int another = anotherGame();
			if (!another) {
				break;
			}
		}
	}
	return 0;
}





