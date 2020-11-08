#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//type definitions
typedef enum {false, true} bool;
typedef struct Vehicle{
    int year;
    char license[50];
    char model[50];
} Vehicle;

//prototype helper functions
int menuSelect();

int partition(Vehicle arr[], int low, int high);

Vehicle vehicle(char model[50],char license[50], int year);
Vehicle getVehicle(Vehicle arr[], char query[50]);

void swap(Vehicle* a, Vehicle* b);
void quickSort(Vehicle arr[],int low, int high);
void seed(Vehicle arr[]);
void init();
void addVehicle(Vehicle arr[]);
void filterVehicles();
void listVehicles(Vehicle arr[]);

//define global object
// Vehicle vehicles[10];

//main program
int main(){
    bool running = true;
    Vehicle vehicles[10] = {
        vehicle("", "", 0),
        vehicle("", "", 0),
        vehicle("", "", 0),
        vehicle("", "", 0),
        vehicle("", "", 0),
        vehicle("", "", 0),
        vehicle("", "", 0),
        vehicle("", "", 0),
        vehicle("", "", 0),
        vehicle("", "", 0)
    };

    printf("Welcome to Car Register. In this program you can register your car and list all available cars.\n\n");
    seed(vehicles);
    quickSort(vehicles, 0, sizeof(vehicles)/sizeof(vehicles[0])-1);
    while(running == true){
        switch (menuSelect()){
            case 1:
                addVehicle(vehicles);
                break;
            case 2:
                listVehicles(vehicles);
                break;
            case 3:
                filterVehicles(vehicles);
                break;
            case 4:
                running = false;
                printf("Bye!");
                break;
            default:
                printf("invalid option\n\n");
        }
    }
    
    return 0;
}
int menuSelect(){
    int option;
    printf("Select option\n1.Add new vehicle\n2.List vehicles\n3.Search vehicles\n4.Exit\n");
    scanf("%d", &option);
    return option;
}
int partition(Vehicle arr[], int low, int high){
    Vehicle pivot = arr[high];
    int i = (low - 1);

    for (int j = low; j <= high -1; j++){
        if (arr[j].year > pivot.year) {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i+1],&arr[high]);
    return (i + 1);
}

Vehicle vehicle(char model[50],char license[50], int year){
    Vehicle a;
    strcpy(a.license,license);
    strcpy(a.model, model);
    a.year = year;
    return a;
}
Vehicle getVehicle(Vehicle arr[], char query[50]){
    Vehicle a;
    for (int i = 0; i < 10; i++){
        if (stricmp(arr[i].model,query) == 0) {
            a = arr[i];
        }
    }
    return a;
}

void addVehicle(Vehicle arr[]){
    bool full = true;
    for (int i = 0; i < 10; i++){
        if (arr[i].year == 0){
            full = false;
            int year;
            char model[50];
            char license[50];
            printf("Add new!\n");
            printf("Please inform the model:\n");
            int scanModel = scanf("%s", &model);
            printf("Please inform the license plate:\n");
            int scanLicense = scanf("%s", &license);
            printf("Please inform the year:\n");
            int scanYear = scanf("%d", &year);

            if (scanYear >= 1 && scanModel >= 1 && scanLicense >=1) {
                arr[i] = vehicle(model,license,year);
                printf("REGISTERED SUCCESSFULLY: %s -- license plate %s\n\n",arr[i].model, arr[i].license);
            } else {
                printf("Error. Input correct values");
                addVehicle(arr);
            }
            break;
        }
    }
    if (full == true) {printf("No slots available (max: 10).");}
}
void filterVehicles(Vehicle arr[]){
    char query[50];
    printf("What model are you looking for?\n");
    scanf("%s",&query);
    Vehicle searchResult = getVehicle(arr, query);
    if(searchResult.model[0] != '\0'){
        printf("SEARCH RESULT: %s -- license %s\n\n", searchResult.model, searchResult.license);
    } else {
        printf("VEHICLE NOT FOUND\n\n");
    }
}
void listVehicles(Vehicle arr[]){
    printf("############################\n");
    for (int i = 0; i < 10; i++){
        printf("%s -- ",arr[i].model);
        printf("%s -- ",arr[i].license);
        printf("%d\n",arr[i].year);
    }
    printf("############################\n");
}
void seed(Vehicle arr[]){
arr[0] = vehicle("palio","AHXH-1001",1999);
arr[1] = vehicle("siena","BHDS-1495",2000);
arr[2] = vehicle("focus","AEJE-6344",2018);
arr[3] = vehicle("logan","HDHD-3423",2016);
arr[4] = vehicle("renegade","OIEF-3423",2020);
arr[5] = vehicle("fusca","AEGE-7464",1967);
arr[6] = vehicle("uno","AFEV-9874",1985);
arr[7] = vehicle("celta","AEKJ-3456",2005);
// vehicles[5] = vehicle("corsa","AEOI-2342",2015);
// vehicles[9] = vehicle("jeep","AEDF-4523",2015);
}
void swap(Vehicle* a, Vehicle* b){
    // printf("\nSWAPPED!\n");
    Vehicle t = *a;
    *a = *b;
    *b = t;
}
void quickSort(Vehicle arr[],int low, int high){
    if (low < high){
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}
