#!/usr/bin/env python3

TEXT_TO_MORSE = {
    'A':'.-', 'B':'-...', 'C':'-.-.', 'D':'-..', 'E':'.',
    'F':'..-.', 'G':'--.', 'H':'....', 'I':'..', 'J':'.---',
    'K':'-.-', 'L':'.-..', 'M':'--', 'N':'-.', 'O':'---',
    'P':'.--.', 'Q':'--.-', 'R':'.-.', 'S':'...', 'T':'-',
    'U':'..-', 'V':'...-', 'W':'.--', 'X':'-..-', 'Y':'-.--',
    'Z':'--..', '0':'-----', '1':'.----', '2':'..---', '3':'...--',
    '4':'....-', '5':'.....', '6':'-....', '7':'--...', '8':'---..',
    '9':'----.', '.':'.-.-.-', ',':'--..--', '?':'..--..', '!':'-.-.--',
    '-':'-....-', '/':'-..-.', '@':'.--.-.', '(':'-.--.', ')':'-.--.-'
}

def text_to_morse(text_file):
    with open(text_file, 'r') as f:
        text = f.read().upper()
    morse_words = []
    for word in text.split():
        letters = [TEXT_TO_MORSE.get(c, '') for c in word]
        morse_words.append(' '.join(letters))
    return ' / '.join(morse_words)

if __name__ == "__main__":
    morse = text_to_morse('text.txt')
    print(morse)
