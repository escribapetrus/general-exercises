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
Vehicle vehicle(char model[50],char license[50], int year);
Vehicle getVehicle();
void init();
void addVehicle(int idx);
void filterVehicles();
void listVehicles();

//define global object
Vehicle vehicles[10];

void seed(){
vehicles[0] = vehicle("palio","AHXH-1001",1999);
vehicles[1] = vehicle("siena", "BHDS-1495",2000);
vehicles[2] = vehicle("focus", "AEJE-6344",2018);
vehicles[3] = vehicle("logan", "HDHD-3423",2018);
vehicles[4] = vehicle("renegade", "OIEF-3423",2015);
vehicles[5] = vehicle("corsa", "AEOI-2342",2015);
vehicles[6] = vehicle("fusca", "AEGE-7464",2015);
vehicles[7] = vehicle("uno", "AFEV-9874",2015);
vehicles[8] = vehicle("celta", "AEKJ-3456",2015);
vehicles[9] = vehicle("jeep", "AEDF-4523",2015);
}

//main program
int main(){
    printf("Welcome to Car Register. In this program you can register your car and list all available cars.\n\n");
    seed();
    init();
    return 0;
}

//helper functions
Vehicle vehicle(char model[50],char license[50], int year){
    Vehicle a;
    strcpy(a.license,license);
    strcpy(a.model, model);
    a.year = year;
    return a;
}
Vehicle getVehicle(char query[50]){
    Vehicle a;
    for (int i = 0; i < 10; i++){
        if (stricmp(vehicles[i].model,query) == 0) {
            a = vehicles[i];
        } 
    }
    return a;
}

int menuSelect(){
    int option;
    printf("Select option\n1.Add new vehicle\n2.List vehicles\n3.Search vehicles\n4.Exit\n");
    int scan = scanf("%d", &option);
    return option;
}

void addVehicle(int idx){
    int year;
    char model[50];
    char license[50];

    printf("Please inform the model:\n");
    int scanModel = scanf("%s", &model);
    printf("Please inform the license plate:\n");
    int scanLicense = scanf("%s", &license);
    printf("Please inform the year:\n");
    int scanYear = scanf("%d", &year);

    if (scanYear >= 1 && scanModel >= 1 && scanLicense >=1) {
        vehicles[idx] = vehicle(model,license,year);
    } else {
        printf("Error. Input correct values");
        addVehicle(idx);
    }
}
void filterVehicles(){
    char query[50];
    printf("What model are you looking for?\n");
    scanf("%s",&query);
    Vehicle searchResult = getVehicle(query);
    if(searchResult.model[0] != '\0'){
        printf("SEARCH RESULT: %s -- license %s\n\n", searchResult.model, searchResult.license);
    } else {
        printf("VEHICLE NOT FOUND\n\n");
    }
}
void listVehicles(){
    printf("############################\n");
    for (int i = 0; i < 10; i++){
        printf("%s -- ",vehicles[i].model);
        printf("%s -- ",vehicles[i].license);
        printf("%d\n",vehicles[i].year);
    }
    printf("############################\n");
}
void init(){
        switch (menuSelect()){
        case 1:
            printf("Add new!\n");
            for (int i = 0; i < 10; i++){
                if (vehicles[i].year == 0){
                    addVehicle(i);
                    printf("REGISTERED SUCCESSFULLY: %s -- license plate %s\n\n",vehicles[i].model, vehicles[i].license);
                    break;
                }
            }
            init();
            break;
        case 2:
            listVehicles();
            init();
            break;
        case 3:
            filterVehicles();
            init();
            break;
        case 4:
            printf("Bye!");
            break;
        default:
            printf("invalid option\n\n");
            init();
    }
}
/*
Em linguagens de programa��o estruturadas, tal como a linguagem C/C++ temos a possibilidade de organizar as informa��es a serem manipuladas sob dois aspectos:
organiza��o homog�nea e organiza��o heterog�nea. No vi�s homog�neo, todas as informa��es, possuidoras de um �nico tipo de dados, est�o dispostas em uma estrutura denominada vetor.
E, por sua vez, no vi�s heterog�neo, as informa��es, podendo possuir tipagens distintas, est�o armazenadas em estruturas de dados denominadas como �struct�.
Com base nisso, suponha que � necess�rio armazenar informa��es relacionadas � ve�culos, totalizando, no m�ximo, 10 ve�culos. Para cada ve�culo, dever�o ser fornecidos os seguintes dados:

- marca do ve�culo
- modelo
- ano de fabrica��o
- placa (formato XXX-YYYY; onde X denota as letras e Y denota os n�meros da placa).

O sistema dever� oferecer, ao usu�rio, as seguintes funcionalidades:

- Listar os ve�culos cadastrados;
- Inserir um novo ve�culo;
- Listar os ve�culos filtrando-se por ano de fabrica��o;
- Listar os ve�culos com o ano de fabrica��o acima de um certo valor especificado pelo usu�rio

. - Listar os ve�culos filtrando-se pelo modelo.

O sistema dever� armazenar os ve�culos ordenados pelo ano de fabrica��o, ou seja, ao inserir um novo ve�culo, este deve ser inserido em ordem crescente de ano de fabrica��o.

*/
