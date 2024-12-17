from random import randint
import time

def who_champion(a, b):
  if a > b:
    return ('Выиграл {0}, число побед: {1}'.format(gamer1, a))
  elif a < b:
    return ('Выиграл {0}, число побед: {1}'.format(gamer2, b))
  else:
    return 'Ничья'
  
  
def Input_gamer():
  ig1 = input('Введите имя 1-го играющего ')
  ig2 = input('Введите имя 2-го играющего ')
  return (ig1, ig2) # возвращается кортеж из двух переменных



#Ввод имен играющих
gamer1, gamer2 = Input_gamer()

k1 = k2 = 0 # количество побед каждого игрока
rezult_g1 = []
rezult_g2 = []

for i in range(5):
  #Моделирование бросания кубика первым играющим
  print('Кубик бросает', gamer1)
  time.sleep(2)
  n1 = randint(1, 6)
  rezult_g1.append(n1)
  print('Выпало:', n1)

  #Моделирование бросания кубика вторым играющим
  print('Кубик бросает', gamer2)
  time.sleep(2)
  n2 = randint(1, 6)
  rezult_g2.append(n2)
  print('Выпало:', n2)
  #Определение результата (3 возможных варианта)
  
  if n1 > n2:
    print('В раунде выиграл', gamer1)
    k1 += 1
  elif n1 < n2:
    print('В раунде выиграл', gamer2)
    k2 += 1
  else:
    print('Ничья')
    
# определение итогового победителя
fin = who_champion(k1,k2)
print("Итог игры: ", fin)
  
  
print("Результаты первого игрока: ", rezult_g1)
print("Результаты второго игрока: ", rezult_g2)
