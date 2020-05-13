const read = require("readline-sync");

class Car{
    constructor(model, licensePlate){
        this.model = model;
        this.licensePlate = licensePlate;
    }
    showInfo(){
        return `Carro: modelo: ${this.model}, placa: ${this.licensePlate}`
    }
    getPrice(time){
        if (time <= 15) {
            return 0;
        } else if (time > 15 && time <= 180) {
            return 20;
        } else {
            return 20 + ((time - 180) * 0.15);
        }
    }
}

class Motorcycle{
    constructor(model, licensePlate){
        this.model = model;
        this.licensePlate = licensePlate;
    }
    showInfo(){
        return `Moto: modelo: ${this.model}, placa: ${this.licensePlate}`
    }
    getPrice(time){
        if (time <= 15) {
            return 0;
        } else if (time > 15 && time <= 180) {
            return 17;
        } else {
            return 17 + ((time - 180) * 0.10);
        }
    }
}

const typ = read.question("Qual e o tipo do veiculo? ");
const mod = read.question("Qual e o modelo do veiculo? ");
const lic = read.question("Qual e a placa do veiculo? ");
const tim = read.question("Qual foi o tempo de permanencia? ");

if (typ == "carro") {
    var ticket = new Car(mod, lic)
} else if (typ == "moto") {
    var ticket = new Motorcycle(mod, lic)
}

console.log(ticket.getPrice(tim))