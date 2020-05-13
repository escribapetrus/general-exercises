# EX. 1
def doisounao(x):
    if (x == 2):
        return (x * 2)
    else:
        return (x + 1)

# EX. 2
def is_computable(a,b,c):
    delta = ((b**2)-(4*a*c))
    computable = (delta >= 0)
    return computable

# EX. 3
def greater(x,y):
    if (x >= y):
        return x
    else:
        return y

# EX. 4
def greater_of_three(x,y,z):
    if (x >= y and x >= z):
        return x
    elif (y >= x and y >= z):
        return y
    else:
        return z

#EX. 5
def two_greater_of_three(x,y,z):
    if (x <= y and x <= z):
        return [y,z]
    elif (y <= x and y <= z):
        return [x, z]
    else:
        return [x,y]

#EX. 6
def parouimpar(x,y):
    par = lambda x: x % 2 == 0
    if (par(x) and par(y)):
        return "ambos pares"
    elif (not(par(x)) and not(par(y))):
        return "ambos impares"
    else:
        return "par e impar"

# EX. 9
plans = [[1,2,3],[2,3,4],[3,4,5],[4,5,6],[7,8,9]]
def findplan(age,risk):
    x = (age-1)
    y = (risk-1)
    return plans[x,y]

# EX. 10 a
def coin_change(money):
    coins = [0.01, 0.05, 0.10, 0.25, 0.50, 1.0]
    flag = None
    for c in coins:
        if (c == money): return c
        if (c < money): flag = c
    balance = round((money - flag),2)
    def flatten(L):
        for l in L:
            try:
                yield from flatten(l)
            except TypeError:
                yield l
    # HIGHLY NESTED LIST
    result = [flag] + [coin_change(balance)]
    return list(flatten(result))

# EX. 10 b
def coin_change2(money):
    coins = [25,10,5,1]
    count = 0
    coin_list = {}
    if money < 1:
        return 0
    for coin in coins:
        if money // coin > 0:
            c = money // coin
            money = money % coin
            coin_list[coin] = c
            count += c
    return [count, coin_list]

# EX. 10 c
def coin_change3(coins, money):
    def matrix(kit, amount):
        m = [[0 for r in range(amount + 1)] for r in range(len(kit) + 1)]
        for i in range(amount+1):
            m[0][i] = i 
        return m

    change_matrix = matrix(coins, money)

    for c in range(1,len(coins)+1):
        for r in range(1, money + 1):
            if coins[c-1] == r:
                change_matrix[c][r] = 1
            elif coins[c-1] > r:
                change_matrix[c][r] = change_matrix[c-1][r]
            else:
                change_matrix[c][r] = min(change_matrix[c-1][r], 1 + change_matrix[c][r - coins[c-1]])
    return change_matrix[-1][-1]




