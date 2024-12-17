from random import randint
import time


#Ввод имен играющих
gamer1 = input('Введите имя 1-го играющего ')
gamer2 = input('Введите имя 2-го играющего ')

#Моделирование бросания кубика первым играющим
print('Кубик бросает', gamer1)
time.sleep(2)
n1 = randint(1, 6)
print('Выпало:', n1)

#Моделирование бросания кубика вторым играющим
print('Кубик бросает', gamer2)
time.sleep(2)
n2 = randint(1, 6)
print('Выпало:', n2)

#Определение результата (3 возможных варианта)
if n1 > n2:
  print('Выиграл', gamer1)
elif n1 < n2:
  print('Выиграл', gamer2)
else:
  print('Ничья')
