#!/usr/bin/env python3
import argparse

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

TEXT_TO_MORSE = {v: k for k, v in MORSE_CODE.items()}

def morse_to_text(filename):
    with open(filename, 'r') as f:
        morse = f.read().strip()
    words = morse.split(' / ')
    decoded_words = []
    for word in words:
        letters = word.split()
        decoded_word = ''.join(MORSE_CODE.get(l, '') for l in letters)
        decoded_words.append(decoded_word)
    return ' '.join(decoded_words)

def text_to_morse(filename):
    with open(filename, 'r') as f:
        text = f.read().upper()
    morse_words = []
    for word in text.split():
        letters = [TEXT_TO_MORSE.get(c, '') for c in word]
        morse_words.append(' '.join(letters))
    return ' / '.join(morse_words)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Encode text to Morse or decode Morse to text")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('-e', '--encode', help='Text file to encode to Morse', type=str)
    group.add_argument('-d', '--decode', help='Morse file to decode to text', type=str)
    args = parser.parse_args()

    if args.encode:
        print(text_to_morse(args.encode))
    elif args.decode:
        print(morse_to_text(args.decode))
