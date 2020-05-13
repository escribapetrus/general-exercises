##app estacionamento
##mostrar o valor que o cliente deve pagar dado o tempo de permanencia
moto = [lambda x: 0,lambda x: 17,lambda x: moto[1](x) + ((x - 180) * 0.1)]
carro = [lambda x: 0,lambda x: 20,lambda x: carro[1](x) + ((x - 180) * 0.15)]
classes = [moto, carro]

##pegar o tipo de veículo que será inputado como linha da matriz
def get_vehicle():
    val = input("Qual é o seu tipo de veículo? (ex: carro, moto) ")
    if val == "moto":
        return 0
    elif val == "carro":
        return 1
    else:
        print("Tipo incorreto. Escolha carro ou moto.")
        return get_vehicle()  

##pegar o tempo que será calculado para...
def get_time():
    try: 
        val = input("Qual foi o seu tempo de permanência? (ex: 15m, 2h) ")
        num = int(val[:-1])
        type = val[len(val)-1:]
        if type == 'h':
            num = num * 60
        elif num < 0:
            print("Valor inválido")
            get_time()
    except ValueError:
        print("Valor inválido.")
        get_time()
    return num
##classificar o tempo em categoria e inputar na matriz
def time_class(mins):
    if mins <= 15:
        return 0
    elif mins > 15 and mins <= 180:
        return 1
    else:
        return 2  
## fazer matriz de categorias de preco com a lista classes
def make_matrix(arr):
    matrix = lambda row, col: [[0 for r in range(row)] for r in range(col)]
    mtx = matrix(len(arr[0]),len(arr))
    mtxx = list(map(lambda x: list(map(lambda y: y, x)), arr))
    return mtxx
##pegar valor de acordo com o tipo de veiculo
def get_value(vehicle, time):
    table = make_matrix(classes)
    categoria = table[vehicle][time_class(time)]
    return {'valor': "R${}".format(categoria(time))}


##para rodar, usar função get_value com veiculo e tempo como argumentos
print(get_value(get_vehicle(),get_time()))