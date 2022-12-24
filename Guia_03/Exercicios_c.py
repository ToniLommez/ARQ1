# Modelo em Python
"""
    Arquitetura de Computadores I - Guia_03.
    Nome: Marcos Antonio Lommez Candido Ribeiro   ---   Matricula: 771157
"""
"""
    Contador de erros.
"""


from xml.etree.ElementPath import xpath_tokenizer
errors = 0


def test_equals(x, y):
    """
    Testar se dois valores sao iguais.
    @param x - primeiro valor
    @param y - segundo valor
    """
    global errors
    if (str(x) != str(y)):
        errors = errors + 1
# end test_equals ( )


def test_report():
    """
    Exibir o total de erros.
    @return mensagem com o total de erros
    """
    return (""+str(errors))
# end test_report ( )


def dec2bin(value):
    """
    Converter valor decimal para binario.
    @param value - valor decimal
    @return binario equivalente
    """
    value = int(value)
    binario = 0
    char_At = 1
    while value > 0:
        temp = value % 2
        binario += temp * char_At
        value = int(value/2)
        char_At *= 10
    return str(binario)
# end dec2bin ( )


def bin2dec(value):
    """
    Converter valor binario para decimal.
    @param value - valor binario
    @return decimal equivalente
    """
    decimal = 0
    m = 1
    length = len(value)
    value = int(value)
    for i in range(length):
        temp = value % 10
        decimal = decimal + (temp * m)
        m = m * 2
        value = int(value/10)
    return str(decimal)
# end bin2dec ( )


def dec2base(value, base):
    """
    Converter valor decimal para base indicada.
    @param value - valor decimal
    @return base para a conversao
    """
    value = int(value)

    base_name = {
        0: "0", 1: "1", 2: "2", 3: "3",
        4: "4", 5: "5", 6: "6", 7: "7",
        8: "8", 9: "9", 10: "A", 11: "B",
        12: "C", 13: "D", 14: "E", 15: "F"
    }

    final_number = ""
    while value > 0:
        temp = base_name[(value % base)]
        final_number = temp + final_number
        value = int(value/base)
    return final_number
# end dec2base ( )


def bin2base(value, base):
    """
    Converter valor binario para base indicada.
    @param value - valor binario
    @param base - para a conversao
    @return valor equivalente na base indicada
    """
    decimal = bin2dec(value)
    new_base = dec2base(decimal, base)
    return new_base
# end bin2base ( )


def ASCII2base(x, new_base):
    """
    Converter valor em ASCII para hexadecimal.
    @param value - caractere(s) em codigo ASCII
    @return hexadecimal equivalente
    """
    base = []
    for i, _ in enumerate(x):
        base.append(dec2base(ord(x[i]), new_base))
    return base
# end ASCII2hex ( )


def base2ASCII(x, base):
    """
    Converter valor em hexadecimal para ASCII.
    @param value - hexadecimal equivalente(s)
    @return caractere(s) em codigo ASCII
    """
    decimal_version = []
    new_string = ""
    for i, _ in enumerate(x):
        decimal_version.append(int(x[i], base))
        new_string += chr(decimal_version[i])
    return new_string
# end hex2ASCII ( )


def base2bin(x, base):
    def val(c):
        if c >= '0' and c <= '9':
            return ord(c) - ord('0')
        else:
            return ord(c) - ord('A') + 10

    llen = len(x)
    power = 1  # Initialize power of base
    num = 0  # Initialize result

    # Decimal equivalent is str[len-1]*1 +
    # str[len-2]*base + str[len-3]*(base^2) + ...
    for i in range(llen - 1, -1, -1):

        # A digit in input number must
        # be less than number's base
        if val(x[i]) >= base:
            print('Invalid Number')
            return -1
        num += val(x[i]) * power
        power = power * base
    return dec2bin(num)
# end base2bin ( )


def C1a(length, value):
    """
    Converter valor binario para o complemento de 1.
    @param length - tamanho
    @param value - valor binario
    @return complemento de 1 equivalente
    """
    resultado = ""
    while length > len(value):
        value = '0' + value

    for x in value:
        if x == '1':
            resultado += "0"
        else:
            resultado += "1"

    return (resultado)
# end C1a ( )


def C2a(length, value):
    """
    Converter valor binario para o complemento de 2.
    @param length - tamanho
    @param value - valor binario
    @return complemento de 2 equivalente
    """
    c1 = ""
    while length > len(value):
        value = '0' + value

    for x in value:
        if x == '1':
            c1 += "0"
        else:
            c1 += "1"

    resultado = ""
    vai_um = '1'
    for x in c1[::-1]:
        if (x == '1') and (vai_um == '1'):
            resultado = '0' + resultado
            vai_um = '1'
        elif (x == '0') and (vai_um == '1') or (x == '1') and (vai_um == '0'):
            resultado = '1' + resultado
            vai_um = '0'
        else:
            resultado = '0' + resultado
            vai_um = '0'

    return (resultado)
# end C2a ( )


def C1b(length, value, base):
    """
    Converter valor em certa base para binario em complemento de 1.
    @param length - tamanho
    @param value - valor em outra base
    @param base - base desse valor
    @return complemento de 1 equivalente
    """
    value = base2bin(value, base)

    resultado = ""
    while length > len(value):
        value = '0' + value

    if length < len(value):
        value = value[:(length-len(value))]

    for x in value:
        if x == '1':
            resultado += "0"
        else:
            resultado += "1"

    return (resultado)
# end C1b ( )


def C2b(length, value, base):
    """
    Converter valor em certa base para binario em complemento de 2.
    @param length - tamanho
    @param value - valor em outra base
    @param base - base desse valor
    @return complemento de 2 equivalente
    """
    value = base2bin(value, base)

    c1 = ""
    while length > len(value):
        value = '0' + value

    if length < len(value):
        value = value[:(length-len(value))]

    for x in value:
        if x == '1':
            c1 += "0"
        else:
            c1 += "1"

    resultado = ""
    vai_um = '1'
    for x in c1[::-1]:
        if (x == '1') and (vai_um == '1'):
            resultado = '0' + resultado
            vai_um = '1'
        elif (x == '0') and (vai_um == '1') or (x == '1') and (vai_um == '0'):
            resultado = '1' + resultado
            vai_um = '0'
        else:
            resultado = '0' + resultado
            vai_um = '0'

    return (resultado)
# end C2b ( )


def sbin2dec(value):
    """
    Converter valor binario com sinal para decimal.
    @param value - valor binario
    @return decimal equivalente
    """
    menos_um = ""
    vai_um = '0'
    for x in value[::-1]:
        if (x == '1') and (vai_um == '1'):
            menos_um = '1' + menos_um
            vai_um = '1'
        elif ((x == '0') and (vai_um == '1')) or ((x == '1') and (vai_um == '0')):
            menos_um = '0' + menos_um
            vai_um = '1'
        else:
            menos_um = '1' + menos_um
            vai_um = '0'

    resultado = ""
    for x in menos_um:
        if x == '1':
            resultado += "0"
        else:
            resultado += "1"

    return bin2dec(resultado)
# end sbin2dec ( )


def eval(value1, op, value2, base):
    """
    Operar (subtrair) valores em certa base.
    @param value1 - primeiro valor na base dada
    @param op - operacao ("-")
    @param value2 - segundo valor na base dada
    @param base - base para a conversao
    @return valor resultante da operacao
    """
    return ("0")
# end eval ( )


def evalB1B2(value1, base1, op, value2, base2):
    """
    Operar valores em certas bases.
    @param value1 - primeiro valor
    @param base1 - primeira base
    @param op - operacao
    @param value2 - segundo valor
    @param base2 - segunda base
    @return valor resultante da operacao, se valida
    """
    return ("0")
# end dbinEval ( )


""" def main():
    ""
    Acao principal.
    ""

    print("Guia_03 - Python Tests")
    print("Nome: Marcos Antonio Lommez Candido Ribeiro  ---  Matricula: 771157 ")
    print()
    test_equals(C1a(6, "01001"), "0")
    test_equals(C1a(8, "01100"), "0")
    test_equals(C2a(6, "100111"), "0")
    test_equals(C2a(7, "101001"), "0")
    test_equals(C2a(8, "110001"), "0")
    print("1. errorTotalReportMsg = "+test_report())
    test_equals(C1b(6, "123", 4), "0")
    test_equals(C1b(8, "5E", 16), "0")
    test_equals(C2b(6, "231", 4), "0")
    test_equals(C2b(7, "517", 8), "0")
    test_equals(C2b(8, "D3", 16), "0")
    print("2. errorTotalReportMsg = "+test_report())
    test_equals(sbin2dec("10110"), 0)
    test_equals(sbin2dec("110101"), 0)
    test_equals(sbin2dec("110011"), 0)
    test_equals(sbin2dec("1011001"), 0)
    test_equals(sbin2dec("1011101"), 0)
    print("3. errorTotalReportMsg = "+test_report())
    test_equals(eval("11110", "-", "1101", 2), "0")
    test_equals(eval("101.1011", "-", "10.01", 2), "0")
    test_equals(eval("231", "-", "123", 4), "0")
    test_equals(eval("321", "-", "123", 8), "0")
    test_equals(eval("8C1", "-", "A1F", 16), "0")
    print("4. errorTotalReportMsg = "+test_report())
    test_equals(evalB1B2("101101", 2, "-", "1100", 2), "0")
    test_equals(evalB1B2("101,1101", 2, "-", "2,5", 8), "0")
    test_equals(evalB1B2("312", 4, "-", "E", 16), "0")
    test_equals(evalB1B2("CB", 16, "-", "1001001", 2), "0")
    test_equals(evalB1B2("39", 16, "-", "2A", 16), "0")
    print("5. errorTotalReportMsg = "+test_report())
    print("\n\nApertar ENTER para terminar.")
    input() """
# end main ( )


def main():
    """
    Acao principal.
    """

    print("Guia_03 - Python Tests")
    print("Nome: Marcos Antonio Lommez Candido Ribeiro  ---  Matricula: 771157 ")
    print()
    print(C1a(6, "1001"))
    print(C1a(8, "1100"))
    print(C2a(6, "100111"))
    print(C2a(7, "101001"))
    print(C2a(8, "110001"))
    print()
    print(C1b(6, "123", 4))
    print(C1b(8, "5E", 16))
    print(C2b(6, "231", 4))
    print(C2b(7, "517", 8))
    print(C2b(8, "D3", 16))
    print()
    print(sbin2dec("10110"))
    print(sbin2dec("110101"))
    print(sbin2dec("110011"))
    print(sbin2dec("1011001"))
    print(sbin2dec("1011101"))
    print()
    """ 
    print(eval("11110", "-", "1101", 2))
    print(eval("101.1011", "-", "10.01", 2))
    print(eval("231", "-", "123", 4))
    print(eval("321", "-", "123", 8))
    print(eval("8C1", "-", "A1F", 16))
    print("4. errorTotalReportMsg = "+test_report())
    print(evalB1B2("101101", 2, "-", "1100", 2))
    print(evalB1B2("101,1101", 2, "-", "2,5", 8))
    print(evalB1B2("312", 4, "-", "E", 16))
    print(evalB1B2("CB", 16, "-", "1001001", 2))
    print(evalB1B2("39", 16, "-", "2A", 16))
    print("5. errorTotalReportMsg = "+test_report())
    print("\n\nApertar ENTER para terminar.")
    input() """


if __name__ == "__main__":
    main()
