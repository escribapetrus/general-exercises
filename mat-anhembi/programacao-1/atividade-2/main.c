#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum {false, true} bool;
typedef struct Client{
    int id;
    char name[30];
    int year;
    int amount;
} Client;

int arr_size = 10;
int clients_registered = 0;

Client client(int id, char name[30], int year, int amount);
Client getClient(int id, Client *list);
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
            printf("Option 1\n");
            addClient(clients);
            break;
        case 2:
            printf("Option 2\n\n");
            removeClient(clients);
            break;
        case 3:
            printf("Option 3\n\n");
            break;        
        case 4:
            printf("Option 4\n\n");
            seed(clients);
            break;
        case 5:
            printf("id   name    year     amount\n");
            for (size_t i = 0; i < clients_registered; i++) {
                printf("%d. %s -- %d -- %d\n", clients[i].id, clients[i].name,clients[i].amount,clients[i].year);
            }
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

Client client(int id, char name[30], int year, int amount){
    Client c;
    c.id = id;
    strcpy(c.name,name);
    c.year = year;
    c.amount = amount;
    return c;
}
Client getClient(int id, Client *list){
    // Client c;
    // for (int i = id - 1; i < clients_registered; i++){
    //     list[i] = list[id]; 
    // }
    // clients_registered = clients_registered - 1; 
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
        list[clients_registered] = client(clients_registered + 1,name,year,amount);
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
        strcpy(list[i - 1].name, list[i].name); 
        list[i - 1].year = list[i].year; 
        list[i - 1].amount = list[i].amount; 
    }
    clients_registered = clients_registered - 1; 
}

void seed(Client *list){
    list[0] = client(1,"clara", 19967, 30000);
    list[1] = client(2,"amanda", 1970, 20000);
    list[2] = client(3,"julia", 1993, 65000);
    list[3] = client(4,"jenny", 1991, 453000);
    list[4] = client(5,"rafaela", 1985, 323000);
    list[5] = client(6,"josefina", 1997, 123000);
    list[6] = client(7,"margarida", 1950, 24000);
    list[7] = client(8,"isabela", 2000, 86000);
    list[8] = client(9,"rosario", 1930, 90000);
    // list[9] = client(10,"hayley", 1998, 902314000);
    clients_registered = 9;
}