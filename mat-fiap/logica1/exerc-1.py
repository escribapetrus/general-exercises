import math
from functools import reduce

# 1. PROGRAMA QUADRADO
def square():
    x = int(input("Escolha um valor para x"))
    return x**2

# 2. PROGRAMA QUADRADO 2.0
def squarethreesome():
    x = int(input("Escolha um valor para x"))
    y = int(input("Escolha um valor para y"))
    z = int(input("Escolha um valor para z"))
    square = lambda a: (a * a)
    return square(x + y + z)

# 3. PROGRAMA CALCULOS
def calculos(w, x, y, z):
    w = int(input("Escolha um valor para w"))
    x = int(input("Escolha um valor para x"))
    y = int(input("Escolha um valor para y"))
    z = int(input("Escolha um valor para z"))    
    m = (w * y)
    s = (x + z)
    return [m,s]

# 4. PROGRAMA COTACAO
def dolarconv():
    dol = float(input("Qual é a cotação do dólar para hoje?"))
    rl = float(input("Quanto dinheiro você quer trocar?"))
    res = round((rl/dol),2)
    return print("Com seus {} reais, você pode comprar {} dólares".format(rl, res))

# 5. PROGRAMA ABASTECIMENTO
combustivel = lambda din,plit: (din / plit)

# 6. PROGRAMA TEMPERATURA
fahr = lambda cels: ((cels * (9/5)) + 32)

# 7. PROGRAMA VOLUME
vol = lambda h,r: (3.14 * (r * r) * h)

# 8. PROGRAMA PRESTACAO
def prest (bol, jur, atr):
    val = (bol + (bol * (jur / 100)) * atr)
    return val

# 9. milionario
def milionario():
    print("Digite os valores abaixo em números inteiros")
    sal = int(input("Qual é seu salário mensal? "))
    desp = int(input("Qual é sua despesa mensal? "))
    sobra = (sal - desp)
    milh = 1000000
    salano = (sobra * 12)
    tempo = (milh / salano)
    (decimal, inteiro) = math.modf(tempo)
    anos = int(inteiro)
    meses = round(decimal * 12)
    resultado = "tempo para ficar milionário: {} anos e {} meses".format(anos,meses)
    return print(resultado)

# 10. APURACAO
def apuracao():
    votos = input("Digite os votos dos candidatos, seguidos por brancos e nulos, separados por vírgula e espaço: ")
    v = tuple(map(lambda x: int(x), votos.split(", ")))
    (canda,candb,candc,brancos,nulos) = v
    total = reduce(lambda x,y: x+y, v)
    p = lambda x: round(((x * 100) / total),1)
    apur = "resultado da eleicao: A: {}%, B: {}%, C: {}%, BRANCOS: {}%, NULOS: {}%".format(
        p(canda), p(candb), p(candc),p(brancos),p(nulos)
    )
    return apur

milionario()