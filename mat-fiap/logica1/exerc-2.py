from functools import reduce

def nomesobrenome():
    nome = input("Qual é seu nome? ")
    sobrenome = input("Qual é seu sobrenome? ")
    return print("Olá, {} {}".format(nome, sobrenome))

def nomenasc():
    nome = input("Qual é seu nome? ")
    ano = int(input("Em que ano você nasceu? "))
    idade = 2020 - ano
    return print("{} tem (ou terá) {} anos".format(nome, idade))

def ex4():
    x = (int(input("x: ")))
    y = (int(input("y: ")))
    soma = x + y
    mult = x * y
    divint = x // y
    resto = x % y
    return print({'soma': soma, 'multiplicação': mult, 'divint': divint, 'resto': resto})

def circulo():
    radius = float(input("Qual é o valor do raio?"))
    pi = 3.141592
    a = lambda r: pi * (r**2)
    p = lambda r: 2 * pi * r
    return print({'área': a(radius), 'perimetro': p(radius)})

def ex7():
    x = int(input("x: (0-99)"))
    dezenas = x // 10
    unidades = x % 10
    print({'dezenas': dezenas, 'unidades': unidades})

def ex8():
    gen_comb = lambda a,b,c: [[i,j,k] for i in a for j in b for k in c]
    camisas = ['polo', 'social','regata']
    calcas = ['jeans','shorts','saia']
    sapatos = ['sapato', 'tenis', 'chinelo']
    comb = gen_comb(camisas, calcas, sapatos)
    return {'numero de combinações':len(comb),'combinações': comb}

def ex9():
    valor = int(input("Informe o valor do produto: "))
    desconto = int(input("Informe o valor do desconto: "))
    valor -= valor * (desconto / 100)
    return {'desconto': "{}%".format(desconto), 'valor': valor}

def velmedia():
    d=int(input("Informe a distância percorrida: "))
    t=int(input("Informe o tempo gasto: "))
    m_s = d/t
    km_h = m_s * 3.6
    return {'m/s': m_s, 'km/h':km_h}

def ex11():
    sal_antigo = int(input("Informe o salário antigo: "))
    sal_novo = int(input("Informe o salário novo: "))
    get_percentual = lambda new,old: round((new / old) % 1, 2) * 100
    return get_percentual(sal_novo,sal_antigo)

def ex12():
    # rm = input("Informe seu RM: ")
    # macete = list(map(lambda x: int(x),rm))
    # res = reduce(lambda x,y: x+y, macete)
    # return res
    rm = int(input("Informe seu RM: "))
    def get_res(x):
        if x < 10:
            return x
        return ((x % 10) + get_res(x // 10))
    return get_res(rm)
print(ex12())
    

def ex13():
    nac = int(input("Informe o nac: "))
    am = int(input("Informe o am: "))
    ps = int(input("Informe o ps: "))
    media = (2 * nac) + (3 * am) + (5 * ps) / 10
    return media

def ex14():
    a_vista = int(input("Informe o valor a vista: "))
    parcela = int(input("Informe o valor da parcela: "))
    get_percentual = lambda high,low: round((high / low) % 1, 2) * 100
    d = get_percentual((parcela*10),a_vista)
    return {'desconto': "{}%".format(d)}
