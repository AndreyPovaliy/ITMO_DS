'''
Упражнение 1. Использование стандартных математических функций
'''
import math

help(math)

a = float(input("Введите число: "))

y1 = math.sqrt(a)

y = math.ceil(y1)

print('sqrt(a) = ', y1)
print('sqrt(a) = ', y)

y = math.ceil(math.sqrt(a))
'''
Упражнение 2. Подсчет количества итераций с помощью функции
'''

def countgit():
  n = int(input('Задайте число '))
  k = 0
  while n > 0: # прекратить действия, когда n станет 0
    n = n//10 # Отбрасывание последней цифры числа n
    k = k + 1 # Увеличение значения переменной-счетчика
  print("Количество цифр в числе", k)

countgit()

def countgit():
  n = int(input('Задайте число '))
  k = 0
  while n > 0: # прекратить действия, когда n станет 0
    n = n//10 # Отбрасывание последней цифры числа n
    k = k + 1 # Увеличение значения переменной-счетчика
  return k

h = countgit()

print(f"Количество цифр в числе {h}")


def countgit(n):
  k = 0
  while n > 0: # прекратить действия, когда n станет 0
    n = n//10 # Отбрасывание последней цифры числа n
    k = k + 1 # Увеличение значения переменной-счетчика
    return k

print(f"Количество цифр в {k} числе {h}")

'''
Упражнение 3 (контрольное). Реализация функций
'''

# Определение наибольшего общего делителя
a = int(input('Задайте первое число '))
b = int(input('Задайте второе число '))

def greatest_common_divisor(a,b):
  while a != b:
    if a > b:
      a = a - b
    else:
      b = b - a
  
  nod = a
  return nod

print(greatest_common_divisor(a,b))
# Наибольшее их трех чисел
x = int(input("Введите число 1"))
y = int(input("Введите число 2"))
z = int(input("Введите число 3"))

def more_number(x,y,z):
  if x>y and x>z:
    return x
  elif y>z and y>x:
    return y
  else:
    return z
  
print(more_number(x,y,z))

# Високосный год
year1 = int(input("Введите год: "))

def is_leap_year(year):
  is_leap = (year % 4 == 0 and year % 100 != 0) or year % 400 == 0
  return is_leap

print(is_leap_year(year1))
