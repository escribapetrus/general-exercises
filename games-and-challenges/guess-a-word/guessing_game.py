def guessing_game(word,lives):
    def take_guess(status,lives):
        guess = input("take a guess: ")
        def update_status(guess):
            jackie = zip(word,status)
            jenny = map(lambda x: x[0] if x[0] == guess else x[1],jackie)
            return "".join([str(j) for j in jenny])
        if guess in word:
            return take_turn(update_status(guess),lives)
        else: 
            return take_turn(status,lives-1)    
    def take_turn(status,lives):
        print(status,lives)
        if lives == 0:
            return print("You lose")
        elif status == word:
            return print("You win!")
        else:
            return take_guess(status,lives)
    print("lets play a guessing game")
    return take_turn("{}".format("_"*len(word)),lives)

guessing_game("alphanumeric",5)

