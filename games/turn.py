import keyboard
import numpy as np

def turn(): 
    keyboard.wait("enter")
    num = np.random.randint(1,7)
    return num

print(turn())