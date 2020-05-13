chromatic = ['a','a#','b','c','c#','d','d#','e','f','f#','g','g#']
patterns = {
    "major": [0,2,4,5,7,9,11],
    "minor": [0,2,3,5,7,8,10],
    "major_harmonic": [0,2,4,5,7,8,11],
    "minor_harmonic": [0,2,3,5,7,8,11],
    "major_pentatonic": [0,2,4,7,9],
    "minor_pentatonic": [0,3,5,7,10]
}
modes = {
    "ionian": 0,
    "dorian": 1,
    "phrygian": 2,
    "lydian": 3,
    "myxolydian": 4,
    "aeolian": 5,
    "locrian": 6
}
def reorder_scale(ar,idx):
    ini = ar[idx:]
    end = ar[:idx]
    return ini + end

def get_scale(chrom,pat):
    scl = list(filter(lambda x: chrom.index(x) in pat, chrom))
    return scl


def main():
    print("Welcome to MUSICAL SCALES.\nChoose a note from the chromatic scale\n'a','a#','b','c','c#','d','d#','e','f','f#','g','g#'\nto get all notes in the desired scale:\nmajor\nminor\nminor harmonic\nmajor harmonic\nminor pentatonic\nmajor pentatonic\n######")
    key_choice = chromatic.index(input("Choose key: "))
    scale_choice = input("Choose scale: ")
    scale = get_scale(reorder_scale(chromatic,key_choice),patterns[scale_choice])
    return scale

print(main())