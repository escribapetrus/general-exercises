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

//define global object
Vehicle vehicles[10];

//prototype helper functions
int menuSelect();
Vehicle vehicle(char model[50],char license[50], int year);
void addVehicle(int idx);
int filterVehicles(char model[50]);
void listVehicles();

//main program
int main(){
    bool running = true;

    while(running == true){
        switch (menuSelect()){
            case 1:
                printf("Add new!\n");
                for (int i = 0; i < 10; i++){
                    if (vehicles[i].year == 0){
                        addVehicle(i);
                        break;
                    }
                }
                printf("%s - license plate %s registered successfully\n",vehicles[0].model, vehicles[0].license);
                break;
            case 2:
                listVehicles();
                break;
            case 3:
                printf("Bye!\n");
                running = false;
                break;
            default:
                printf("invalid option\n");
        }
    }
    return 0;
}

//helper functions
void addVehicle(int idx){
    int year;
    char model[50];
    char license[50];

    printf("Please inform the model:\n");
    scanf("%s", &model);
    printf("Please inform the license plate:\n");
    scanf("%s", &license);
    printf("Please inform the year:\n");
    scanf("%d", &year);

    vehicles[idx] = vehicle(model,license,year);
}

Vehicle vehicle(char model[50],char license[50], int year){
    Vehicle a;
    strcpy(a.license,license);
    strcpy(a.model, model);
    a.year = year;
    return a;
}

int menuSelect(){
    int option;
    printf("Select option\n1.Add new vehicle\n2.List vehicles\n3.Exit\n");
    scanf("%d", &option);
    return option;
}

int filterVehicles(char model[50]){
    //https://fresh2refresh.com/c-programming/c-passing-struct-to-function/
    return 1;
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
