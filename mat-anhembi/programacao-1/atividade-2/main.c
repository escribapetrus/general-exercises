#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum {false, true} bool;

typedef struct Client{
    char name[30];
    int year;
    int amount;
} Client;

Client client(char name[30], int year, int amount);
int menu();

int main(int argc, char const *argv[]){
    bool running = true;
    printf("Welcome to Store System\n\n");
    while(running == true){      
        switch (menu()){
        case 1:
            printf("Option 1\n\n");
            break;
        case 2:
            printf("Option 2\n\n");
            break;
        case 3:
            printf("Option 3\n\n");
            break;        
        case 4:
            printf("Option 4\n\n");
            break;
        case 5:
            printf("Option 5\n\n");
            break;
        case 6:
            printf("Option 6\n\n");
            running = false;
            break;
        default:
            printf("Invalid option!");
            break;
        }
    }
    return 0;
}

Client client(char name[30], int year, int amount){
    Client c;
    strcpy(name,c.name);
    c.year = year;
    c.amount = amount;
    return c;
}

int menu(){
    int m;
    printf("What do you want to do?\n\n1. Add client\n2.Remove client\n3.Erase all\n4.Find best customer\n5.Find specific customer\n6.Exit\n\n");
    scanf("%d", &m);
    return m;
}