with open('nc mercury.picoctf.net 49039.txt', 'r') as file:
    lines = file.readlines()

numbers = []
character = []

for line in lines:
    numbers.append(int(line.strip()))

for number in numbers:
    character.append(chr(number))

print(''.join(str(char) for char in character))
