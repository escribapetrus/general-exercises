#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum {false, true} bool;
typedef struct Client{
    char name[30];
    int year;
    float amount;
} Client;

int arr_size = 10;
int clients_registered = 0;

Client client(char name[30], int year, float amount);
int menu();

void list(Client *list);
void add(Client *list);
void getBest(Client *list);
void update(Client *list);
void seed(Client *list);
void reset(Client *list);
void resetAmount(Client *list);
void removeClient(Client *list);
void getOne(Client *list);

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
        case 1: // add clients
            add(clients);
            break;
        case 2: // remove one client
            removeClient(clients);
            break;
        case 3: //update client amount
            update(clients);
            break;        
        case 4: // clean amount from all clients
            resetAmount(clients);
            break;
        case 5: //find best customer
            getBest(clients);
            break;
        case 6: //find specific client amount
            getOne(clients);
            break;
        case 7: // exit
            printf("Bye!");
            running = false;
            break;
        default:
            printf("Invalid option!\n\n");
            seed(clients);
            list(clients);
            break;
        }
    }
    return 0;
}

Client client(char name[30], int year, float amount){
    Client c;
    strcpy(c.name,name);
    c.year = year;
    c.amount = amount;
    return c;
}
int menu(){
    int m;
    printf("What do you want to do?\n\n1. Add client\n2. Remove client\n3. Update client amount spent\n4. Reset amount spent by customers\n5. Find best customer\n6. Find how much a client spent\n7. Exit\n\n");
    scanf("%d", &m);
    return m;
}
void list(Client *list){
                if (clients_registered == 0) {
                printf("No clients registered yet.\n\n");
            } else {
                printf("id   name    year     amount\n");
                for (size_t i = 0; i < clients_registered; i++) {
                    printf("%d. %s -- %d -- %f\n",i+1,list[i].name,list[i].year,list[i].amount);
                }
            }
}
void add(Client *list){
    char name[30];
    float amount;
    int year;

    printf("Enter client name\n");
    int scanN = scanf("%s",&name);
    printf("Enter client's year of birth\n");
    int scanY = scanf("%d",&year);
    printf("Enter how much the client spent\n");
    int scanA = scanf("%f",&amount);

    if (scanN >= 1 && scanY >= 1 && scanA >= 1) {
        printf("Client added successfully\n\n");
        list[clients_registered] = client(name,year,amount);
        clients_registered = clients_registered + 1;
    } else {
        printf("Incorrect values, try again.\n\n");
        add(list);
    }
}
void getBest(Client *list){
    Client c = client("_",0,0);
    for (int i = 0; i < clients_registered; i++) {
        if (list[i].amount > c.amount){
            c = list[i];
        }
    }
    printf("The best customer is %s, who spent %f$", c.name,c.amount);
}
void getOne(Client *list){
    char name[30];
    printf("Enter the client name: ");
    scanf("%s", &name);
    for (int i = 0; i < clients_registered; i++){
        if (strcmp(list[i].name,name) == 0){
            printf("%s spent %f this month.\n\n",list[i].name,list[i].amount);
        }
    }
    
}
void update(Client *list){
    int target;
    float amount;
    printf("Inform id of the client to update.\n");
    scanf("%d", &target);
    printf("Inform the amount spent this month.\n");
    scanf("%f", &amount);
    list[target - 1].amount = amount;
}
void removeClient(Client *list){
    int target;
    printf("Inform id of the client to remove.\n");
    scanf("%d", &target);
    for (int i = target - 1; i < clients_registered; i++){
        list[i] = list[i+1]; 
    }
    clients_registered = clients_registered - 1; 
}
void resetAmount(Client *list){
    printf("Cleaning the amount spent by all clients this year\n\n");
    for (int i = 0; i < clients_registered; i++){
        list[i].amount = 0;
    }
}
void seed(Client *list){
    list[0] = client("clara", 19967, 3043.54);
    list[1] = client("amanda", 1970, 2002.34);
    list[2] = client("julia", 1993, 650.01);
    list[3] = client("jenny", 1991, 4530.12);
    list[4] = client("rafaela", 1985, 3230.00);
    list[5] = client("josefina", 1997, 1230.50);
    list[6] = client("margarida", 1950, 240.00);
    list[7] = client("isabela", 2000, 860.00);
    list[8] = client("rosario", 1930, 900.90);
    // list[9] = client("hayley", 1998, 902314000);
    clients_registered = 9;
    printf("Added 9 records!\n\n");
}
void reset(Client *list){
    free(list);
    arr_size = 10;
    clients_registered = 0;
    list = (Client *) realloc(list, arr_size * sizeof(Client));
    printf("Cleaned client list");
}