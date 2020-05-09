from bullet import Bullet
class Character:
    def __init__(self, name, image, x, y):
        self.name = name
        self.image = image
        self.position_x = x
        self.position_y = y
        self.bullets = 5
    def move(self, axis, direction, speed):
        if axis == 'x':
            if direction == 'left':
                self.position_x -= speed
            if direction == 'right':
                self.position_x += speed
        if axis == 'y':
            if direction == 'up':
                self.position_y -= speed
            if direction == 'down':
                self.position_y += speed
    def fire(self):
            bullet = Bullet(self.position_x + 13,self.position_y - 40)
            self.bullets -= 1
            return bullet
    def bullet_reload(self):
        self.bullets = 5
