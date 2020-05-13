class Bullet:
    def __init__(self,x,y):
        self.image = 'icons/bluelaser.png'
        self.position_x = x
        self.position_y = y
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
