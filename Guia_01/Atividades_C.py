"""
Marcos Antonio Lommez Candido Ribeiro
771157
03/08/2020
"""

def dec2bin(x):
    binario = 0
    char_At = 1
    while x > 0:
        temp = x % 2
        binario += temp * char_At
        x = int(x/2)
        char_At *= 10
    return binario

print("\nQuestao 01c.)\n")
print("27 =  ", dec2bin(27))
print("56 =  ", dec2bin(56))
print("721 = ", dec2bin(721))
print("231 = ", dec2bin(231))
print("365 = ", dec2bin(365))

def bin2dec(x):
    decimal = 0
    m = 1
    length = len(str(x))
    for i in range(length):
        temp = x % 10
        decimal = decimal + (temp * m)
        m = m * 2
        x = int(x/10)
    return (decimal)

print("\n\nQuestao 02c.)\n")
print("10111 =  ", bin2dec(10111))
print("11100 =  ", bin2dec(11100))
print("101100 = ", bin2dec(101100))
print("110101 = ", bin2dec(110101))
print("111001 = ", bin2dec(111001))

def dec2base(x, base):
    base_name = {
    0: "0", 1: "1", 2: "2", 3: "3", 
    4: "4", 5: "5", 6: "6", 7: "7", 
    8: "8", 9: "9", 10: "A", 11: "B", 
    12: "C", 13: "D", 14: "E", 15: "F"
    }

    final_number = ""
    while x > 0:
        temp = base_name[(x % base)]
        final_number = temp + final_number
        x = int(x/base)
    return final_number

print("\n\nQuestao 03c.)\n")
print("77  = ", dec2base(77, 4), "(4)")
print("49  = ", dec2base(49, 8), "  (8)")
print("68  = ", dec2base(68, 16), "  (16)")
print("175 = ", dec2base(175, 16), "  (16)")
print("781 = ", dec2base(781, 16), " (16)")

def bin2base(x, base):
    decimal = bin2dec(x)
    new_base = dec2base(decimal, base)
    return new_base

print("\n\nQuestao 04c.)\n")
print("0001 0010 = ", bin2base(10010, 4), "(4)")
print("0001 1001 = ", bin2base(11001, 8), " (8)")
print("0010 1101 = ", bin2base(101101, 16), " (16)")
print("0010 1110 = ", bin2base(101110, 8), " (8)")
print("0011 0101 = ", bin2base(110101, 4), "(4)")


def ASCII2base(x, new_base):
    base = []
    for i, _ in enumerate(x):
        base.append(dec2base(ord(x[i]), new_base))
    return base

def base2ASCII(x, base):
    decimal_version = []
    new_string = ""
    for i, _ in enumerate(x):
        decimal_version.append(int(x[i], base))
        new_string += chr(decimal_version[i])
    return new_string


print("\n\nQuestao 05c.)\n")
print("PUC-Minas = ", ASCII2base("PUC-Minas", 16))
print("02-2022 = ", ASCII2base("02-2022", 16))
print("Belo Horizonte = ", ASCII2base("Belo Horizonte", 2))
print("115 141 156 150 141 = ", base2ASCII(["115", "141", "156", "150", "141"], 8))
print("42 2E 48 74 65 2E = ", base2ASCII(["42", "2E", "48", "74", "65", "2E"], 16))
