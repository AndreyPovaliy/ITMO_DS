# Упражнение 4.1 (контрольное). Преобразователь температуры
celsius = float(input("Please enter Celsius degree: "))
fahrenheit = celsius * (9 / 5) + 32
print(f"{celsius} celsius is {fahrenheit}")

fahrenheit = float(input("Please enter Fahrenheit degree: "))
celsius = (fahrenheit - 32) * (5 / 9)
print(f"{fahrenheit} celsius is {celsius}")

# Упражнение 4.2 (контрольное). Расчет оплаты счета

tax = 0.06
tip = 0.1
check = float(input("Enter the check in rubles: "))

sum = check + check * tax + check * tip

print(f"Total check  is {sum}")