import random
import keyboard

matrix = lambda row, col: [[0 for r in range(row)] for r in range(col)]

def get_players():
    #get player names and first position(0,0)
    num = int(input("informe o numero de jogadores: "))
    players = [{'name': input("nome: "),'position': (0,0)} for  x in range(0,num)]
    return players

def phase(players):
    #players roll the dice and get new positions
    def turn(player):
        print('{}, é seu turno'.format(player['name']))
        keyboard.wait("enter")
        num = random.randrange(1,7)
        print(num)
        if player['position'][1] + num <= 10:
            x = player['position'][1] + num
            y = player['position'][0]
        else:
            a = (player['position'][1] + num) -10
            x = player['position'][1] + a
            y = player['position'][0] + 1
        pos = (y,x)
        return {'name':player['name'],'position':pos}

    pl = list(map(lambda x: turn(x), players))
    print(pl)
    return pl

def set_board(players):
    #put players in their positions in the board
    #if score repeated, -1 position
    newboard = list(map(lambda x: x,matrix(10,10)))
    for p in players:
        if newboard[p['position'][0]][p['position'][1]] == 0:
            newboard[p['position'][0]][p['position'][1]] = p['name']
        else:
            newboard[p['position'][0]][p['position'][1]-1] = p['name']
    if newboard[9][9] != 0:
        return '{} is the winner!!'.format(newboard[9][9])
    else:   
        print(newboard)
        return set_board(phase(players))

def main():
    players = get_players()
    a = phase(players)
    set_board(a)
main()