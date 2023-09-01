# Nice netcat

## Overview
- **15 points**
- **General Skills**
- **Author: Syreal**

## Description
There is a nice program that you can talk to by using this command in a shell: **$ nc mercury.picoctf.net 49039**, but it doesn't speak English...

## Approach
The activity lets you enter a command in the Linux terminal: 
```
nc mercury.picoctf.net 49039
```

Once you have done that, it outputs a series of numbers, which is in the 
```
nc mercury.picoctf.net 49039.txt. 
```

I've found that the numbers seem to use **ASCII**, so I quickly made myself a python code that converts those ASCII values to character by using **'chr()'**.

That is found at the '**neocat-ascii-decrypter.py**'. It uses a file reader module and lists those numbers in an array while trying to convert them one by one,
and appending each into a final new array.

```python
with open('nc mercury.picoctf.net 49039.txt', 'r') as file:
    lines = file.readlines()

numbers = []
character = []

for line in lines:
    numbers.append(int(line.strip()))

for number in numbers:
    character.append(chr(number))

print(''.join(str(char) for char in character))
```

Flag:
```
picoCTF{g00d_k1tty!_n1c3_k1tty!_3d84edc8}
```
