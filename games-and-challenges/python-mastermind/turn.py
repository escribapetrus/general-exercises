from functools import reduce

def taketurn(secret,lives):
    print("You have {} lives".format(lives))
    def takeguess():
        guess = input("Choose 4 pegs: (ex: abcd)\n")
        if len(guess) == 4:
            return list(guess)
        else:
            return takeguess()
    def getscore(guess, secret):
        jenny = list(zip(secret,guess))
        jill = list(map(lambda x: 1 if x[0] == x[1] else 0,jenny))
        rebecca = list(filter(lambda x: x in secret ,guess))
        lorelei = list(filter(lambda x: x not in guess, secret))
        right = reduce(lambda x,y: x+y,jill)
        wrong = len(secret) - len(lorelei) - right
        return (right, wrong)        
    guess = takeguess()
    if lives == 0:
        return "You lose. The answer is {}".format(secret)
    elif guess == secret:
        return "{} is correct!".format(secret)
    else:
        print(getscore(guess,secret))
        return taketurn(secret,lives -1)