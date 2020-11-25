#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum {false, true} bool;
typedef struct Client{
    char name[30];
    int year;
    int amount;
} Client;

int arr_size = 10;
int clients_registered = 0;

Client client(char name[30], int year, int amount);
int menu();

void addClient(Client *list);
void removeClient(Client *list);
void seed(Client *list);

int main(int argc, char const *argv[]){
    bool running = true;
    Client *clients;
    clients = (Client *) calloc(arr_size, sizeof(Client));
    printf("Welcome to Store System\n\n");
    while(running == true){ 
        if (clients_registered == arr_size) {
            printf("Client list full. Increasing list size...\n\n");
            arr_size = arr_size + 10;
            clients = (Client *) realloc(clients, arr_size * sizeof(Client));
        }
        switch (menu()){
        case 1:
            addClient(clients);
            break;
        case 2:
            removeClient(clients);
            break;
        case 3:
            printf("Option 3\n\n");
            break;        
        case 4:
            seed(clients);
            break;
        case 5:
            if (clients_registered == 0) {
                printf("No clients registered yet.\n\n");
            } else {
                printf("id   name    year     amount\n");
                for (size_t i = 0; i < clients_registered; i++) {
                    printf("%d. %s -- %d -- %d\n",i+1,clients[i].name,clients[i].amount,clients[i].year);
                }
            }
            break;
        case 6:
            printf("Bye!");
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
    strcpy(c.name,name);
    c.year = year;
    c.amount = amount;
    return c;
}

int menu(){
    int m;
    printf("What do you want to do?\n\n1. Add client\n2. Remove client\n3. Erase all\n4. Seed DB -- Find best customer\n5. List all -- Find specific customer\n6. Exit\n\n");
    scanf("%d", &m);
    return m;
}

void addClient(Client *list){
    char name[30];
    int amount;
    int year;

    printf("Enter client name\n");
    int scanN = scanf("%s",&name);
    printf("Enter client's year of birth\n");
    int scanY = scanf("%d",&year);
    printf("Enter how much the client spent\n");
    int scanA = scanf("%d",&amount);

    if (scanN >= 1 && scanY >= 1 && scanA >= 1) {
        printf("Client added successfully\n\n");
        list[clients_registered] = client(name,year,amount);
        clients_registered = clients_registered + 1;
    } else {
        printf("Incorrect values, try again.\n\n");
        addClient(list);
    }
}
void removeClient(Client *list){
    int target;
    printf("Inform id of the client to remove.\n");
    scanf("%d", &target);
    for (int i = target; i < clients_registered; i++){
        list[i] = list[i+1]; 
    }
    clients_registered = clients_registered - 1; 
}
void seed(Client *list){
    list[0] = client("clara", 19967, 30000);
    list[1] = client("amanda", 1970, 20000);
    list[2] = client("julia", 1993, 65000);
    list[3] = client("jenny", 1991, 453000);
    list[4] = client("rafaela", 1985, 323000);
    list[5] = client("josefina", 1997, 123000);
    list[6] = client("margarida", 1950, 24000);
    list[7] = client("isabela", 2000, 86000);
    list[8] = client("rosario", 1930, 90000);
    // list[9] = client("hayley", 1998, 902314000);
    clients_registered = 9;
    printf("Added 9 records!\n\n");
}