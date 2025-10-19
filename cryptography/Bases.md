# What are number bases?
Number bases are commonly used to represent data in different forms. A base is the number of different digits or combination of digits and letters that a system of counting uses to represent numbers. You are probably more familiar with base-10 (decimal), where there are 10 possible values for each digit (0-9). There are infinite number bases, but you will only encounter a small handful of them because there is no benefit to using any arbitrary number base (except maybe for hiding data? 🤔). In computer science, in addition to decimal, you may see these common number bases:
- base-2 (binary)
- base-8 (octal)
- base-16 (hexadecimal)
- base-64 (base64)

# How are number bases used?
Number bases are used for a variety of reasons. Binary is used because the memory in computers is made via a series of on and off switches which represent ones and zeros. We use octal and hexadecimal because they are more concise than binary and easier for humans to read. Base64 is used to more efficiently represent binary data in ASCII. In cybersecurity, you will find data being represented in a variety of number bases, so it is important to be able to understand how number bases work and how to understand them so you can interpret the data. 

# How do you count in different number bases?
Let's start simple with binary. Binary is base-2, meaning that there are 2 possible values for each digit, typically 0 (zero) and 1 (one). Incrementing numbers works the same way in every number base; when you have reached the max value of a single digit, you increment the next significant digit by one and reset the current digit to zero. This is how you would count in binary:

Decimal | Binary
--- | ---
0 | 00000
1 | 00001
2 | 00010
3 | 00011
4 | 00100
5 | 00101
6 | 00110
7 | 00111
8 | 01000
9 | 01001
10 | 01010
11 | 01011
12 | 01100
13 | 01101
14 | 01110
15 | 01111
16 | 10000

The same idea applies to all the other number bases. Let's move on to hexadecimal. With hexadecimal, there are 16 possible values for each digit. You might be wondering how you could squeeze 16 values into a single digit. 

In order to do this, we must expand past our normal decimal numbers and into the alphabet (in theory you could use any other characters/symbols - we're just familiar with numbers and letters but you could make up your own symbols or even use emojis if you wanted to). In hexadecimal, instead of each digit being 0-9, it's now 0-F where A represents a value of decimal 10 and F represents a value of decimal 15. Take a look at this table to see how it works.

Decimal | Hexadecimal
--- | ---
0 | 00
1 | 01
2 | 02
3 | 03
4 | 04
5 | 05
6 | 06
7 | 07
8 | 08
9 | 09
10 | 0A
11 | 0B
12 | 0C
13 | 0D
14 | 0E
15 | 0F
16 | 10
17 | 11
18 | 12
19 | 13
20 | 14

# More info

There is so much more to learn about number bases. Like converting between number bases or doing math in different number bases. Check out these resources to learn more:

https://www.khanacademy.org/math/algebra-home/alg-intro-to-algebra/algebra-alternate-number-bases/v/number-systems-introduction

https://www.purplemath.com/modules/numbbase.htm

https://betterexplained.com/articles/numbers-and-bases/