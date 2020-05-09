import pygame as game
import random
from character import Character
from bullet import Bullet

#initialize game and layout
game.init()
screen = game.display.set_mode((800,600))
bg = game.image.load('bg-2.jpg')
icon = game.image.load('icons/spaceship.png')
game.display.set_caption("Space Invaders")
game.display.set_icon(icon)
#player
player = Character('player',game.image.load('icons/spaceship-md.png'),370,480)

def mk_enemy():
    en = Character('enemy',game.image.load('icons/alien.png'),random.randint(0,736),random.randint(50,200))
    en.rightmove = True
    return en

def mk_bullets():
    bu = player.fire()
    bu.image = game.image.load('icons/bluelaser.png')
    return bu

enemies = [mk_enemy() for r in range(0,10)]
bullets = []

running = True
while running:
#player movement
    keys = game.key.get_pressed()
    if keys[game.K_w] or keys[game.K_UP]: player.move('y','up',1)
    if keys[game.K_s] or keys[game.K_DOWN]: player.move('y','down',1)
    if keys[game.K_a] or keys[game.K_LEFT]: player.move('x','left',1)
    if keys[game.K_d] or keys[game.K_RIGHT]: player.move('x','right',1)
# player movement boundaries
    if player.position_x <= 0: player.position_x = 0
    if player.position_x >= 736: player.position_x = 736
    if player.position_y <= 0: player.position_y = 0
    if player.position_y >= 536: player.position_y = 536
#enemy movement and boundaries
    for enemy in enemies:
        if enemy.rightmove:
            enemy.move('x','right',1)
        if not enemy.rightmove:
            enemy.move('x','left',1)
        if enemy.position_x <= 0 or enemy.position_x >= 736:
            enemy.move('y','down',20)
            enemy.rightmove = not enemy.rightmove
#bullet movement and boundaries
    if len(bullets) > 0:
        for bullet in bullets:
            bullet.move('y','up',1)
    
    for event in game.event.get():
        if event.type == game.KEYDOWN:
            if event.key == game.K_SPACE:
                bullets.append(mk_bullets())
            if event.key == game.K_r:
                player.bullet_reload()            
        if event.type == game.QUIT:
            running = False
    screen.fill((20,10,30))
    screen.blit(bg,(0,0))
    screen.blit(player.image,(player.position_x,player.position_y))
    for enemy in enemies:
        screen.blit(enemy.image,(enemy.position_x,enemy.position_y))
    if len(bullets) > 0:
        for bullet in bullets:
            screen.blit(bullet.image,(bullet.position_x,bullet.position_y))

    game.display.update()


#Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
#Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
#Background by <a href="https://www.freepik.com/free-photos-vectors/background">Background vector created by upklyak - www.freepik.com</a>
# Icons made by <a href="https://www.flaticon.com/authors/those-icons" title="Those Icons">Those Icons</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
