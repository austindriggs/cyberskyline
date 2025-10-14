#!/usr/bin/env python3

MORSE_CODE = {
    '.-':'A', '-...':'B', '-.-.':'C', '-..':'D', '.':'E',
    '..-.':'F', '--.':'G', '....':'H', '..':'I', '.---':'J',
    '-.-':'K', '.-..':'L', '--':'M', '-.':'N', '---':'O',
    '.--.':'P', '--.-':'Q', '.-.':'R', '...':'S', '-':'T',
    '..-':'U', '...-':'V', '.--':'W', '-..-':'X', '-.--':'Y',
    '--..':'Z', '-----':'0', '.----':'1', '..---':'2', '...--':'3',
    '....-':'4', '.....':'5', '-....':'6', '--...':'7', '---..':'8',
    '----.':'9', '.-.-.-':'.', '--..--':',', '..--..':'?', '-.-.--':'!',
    '-....-':'-', '-..-.':'/', '.--.-.':'@', '-.--.':'(', '-.--.-':')'
}

def morse_to_text(morse_file):
    with open(morse_file, 'r') as f:
        morse = f.read().strip()
    words = morse.split(' / ')  # words separated by '/'
    decoded_words = []
    for word in words:
        letters = word.split()
        decoded_word = ''.join(MORSE_CODE.get(l, '') for l in letters)
        decoded_words.append(decoded_word)
    return ' '.join(decoded_words)

if __name__ == "__main__":
    text = morse_to_text('morse.txt')
    print(text)
