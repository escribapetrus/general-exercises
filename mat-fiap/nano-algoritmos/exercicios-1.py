# EX. 1.a
def divisores(x):
    i = 1
    res = []
    while i <= x:
        if (x % i == 0):
            res.append(i)
            i += 1
        else:
            i += 1
    return res

print(divisores(144))

# EX. 1.b
def divi_funct(x):
    nums = list(range(1,(x+1)))
    res = list(filter(lambda y: (x % y == 0) , nums))
    return res
print(divi_funct(12))

# EX. 2
def salario(x):
    sal_hora = x
    sal_mes = (sal_hora * 4.5)
    sal_grat = (sal_mes * 1.1)
    sal_final = (sal_grat + (sal_grat / 6))
    return sal_final
print(salario(1000))

# EX. 3
def somamedia(x,y,z):
    soma = lambda x, y, z: (x + y + z)
    media = lambda x, y, z: ((x + y + z) / 3)
    return [soma(x,y,z), media(x,y,z)]
print(somamedia(144, 13, 16))

# EX. 4
subtracao = lambda x, y: (x - y)
print(subtracao(3243,12314))