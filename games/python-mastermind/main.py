import pegs
import turn

def main():
    print("### WELCOME TO PYTHON MASTERMIND ###\nThere is a secret of 4 pegs of letters a, b, c, d, e.\nYour objective is to discover the secret.\nGood luck!")
    secret = pegs.gensecret()
    game = turn.taketurn(secret,10)
    return print(game)

main()