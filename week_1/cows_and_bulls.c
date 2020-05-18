#include <stdio.h>
#include <ctype.h>
#include <string.h>

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

int blackScore(int guess[4], int code[4]){
	int score = 0;
	for (int i = 0; i < 4; i++) {
		if (code[i] == guess[i]){
			score++;
		}
	}

	return score;
}

int whiteScore(int guess[4], int code[4]) {
	int score = 0;
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			if (i != j && code[i] == guess[j]) {
				score++;
			}
		}
	}
	return score;
}

void printScore(int g[4], int c[4]) {
	printf("(%d,%d)\n", blackScore(g, c), whiteScore(g, c));
}

int main(void) {
	int codes[5][4] = {{1, 8, 9, 2}, {2, 4, 6, 8}, {1, 9, 8, 3}, {7, 4, 2, 1}, {4, 6, 8, 9}};

	for (int i = 0; i < 4; i++) {
		int guess[4];

		while (blackScore(guess, codes[i]) != 4) {
			readGuess(guess);
			printScore(guess, codes[i]);
		}

		printf("You have guessed correctly!\n");
		
		if (i < 4) {
			int another = anotherGame();
			if (!another) {
				break;
			}
		}
	}
	return 0;
}

	



