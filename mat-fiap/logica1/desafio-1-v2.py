class Car:
    def __init__(self, model, plate):
        self.model = model
        self.plate = plate
    def get_info(self):
        return "Car -- model: {}, license plate: {}".format(self.model,self.plate)
    def get_price(self, time):
        if time <= 15:
            return 0
        elif time > 15 and time <= 180:
            return 20
        else:
            return 20 + ((time - 180) * .15)

class Motorcycle:
    def __init__(self, model, plate):
        self.model = model
        self.plate = plate    
    def get_info(self):
        return "Car -- model: {}, license plate: {}".format(self.model,self.plate)
    def get_price(self, time):
        if time <= 15:
            return 0
        elif time > 15 and time <= 180:
            return 17
        else:
            return 17 + ((time - 180) * .10)

typ = input("Qual o tipo do veiculo? ")
mod = input("Qual o modelo do veiculo? ")
lic = input("Qual a placa do veiculo? ")
tim = int(input("Qual o tempo de permanencia? "))

if typ == "moto":
    ticket = Motorcycle(mod, lic)
elif typ == "carro":
    ticket = Car(mod, lic)

print(ticket.get_price(tim))