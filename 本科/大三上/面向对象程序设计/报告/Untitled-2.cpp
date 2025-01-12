#include <iostream>
#include <conio.h>
#include <windows.h>
using namespace std;

const int width = 20;
const int height = 20;
int x, y, enemyX, enemyY, score;
bool gameOver;

void Setup() {
    gameOver = false;
    x = width / 2;
    y = height - 1;
    enemyX = rand() % width;
    enemyY = 0;
    score = 0;
}

void Draw() {
    system("cls");
    for (int i = 0; i < width + 2; i++)
        cout << "#";
    cout << endl;

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            if (j == 0)
                cout << "#";
            if (i == y && j == x)
                cout << "A";
            else if (i == enemyY && j == enemyX)
                cout << "E";
            else
                cout << " ";
            if (j == width - 1)
                cout << "#";
        }
        cout << endl;
    }

    for (int i = 0; i < width + 2; i++)
        cout << "#";
    cout << endl;
    cout << "Score: " << score << endl;
}

void Input() {
    if (_kbhit()) {
        switch (_getch()) {
        case 'a':
            x--;
            break;
        case 'd':
            x++;
            break;
        case 'w':
            y--;
            break;
        case 's':
            y++;
            break;
        case 'x':
            gameOver = true;
            break;
        }
    }
}

void Logic() {
    enemyY++;
    if (enemyY >= height) {
        enemyY = 0;
        enemyX = rand() % width;
        score++;
    }
    if (x == enemyX && y == enemyY)
        gameOver = true;
}

int main() {
    Setup();
    while (!gameOver) {
        Draw();
        Input();
        Logic();
        Sleep(100);
    }
    return 0;
}
