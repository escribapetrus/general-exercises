import random

pegchars = ['a','b','c','d','e','f']
numpegs = 4

def gensecret():
    secret = [pegchars[random.randint(0,len(pegchars) -1)] for x in range(numpegs)]
    return secret