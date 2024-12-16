'''
Упражнение 1. Использование списков
'''

fruits = ['Apple', 'Grape', 'Peach', 'Banan', 'Orange']

print(fruits[0]) # нумерация начинается с нуля
print(fruits[1])
print(fruits[4])
print(fruits[-1]) # последний элемент –
# Индексирование работает и в обратную сторону

fruits[0] = 'Watermelon'
fruits[3] = 'Lemon'

if 'Apple' in fruits:
  print('В списке есть элемент Apple')
else:
  print('В списке нет элемента Apple')
  
print(fruits)

'''
Упражнение 2. Получение требуемых данных
'''
s = 'ab12c59p7dq'
digits = []

for symbol in s:
  if '1234567890'.find(symbol) != -1:
    digits.append(int(symbol))
    
print(digits)

'''
Упражнение 3. Применение словаря для хранения данных
'''
user1 = {'firstname': 'Ivan', 'lastname':'Петров','age': 19}

print(user1)

fname = input('Enter your firstname: ')
lname = input('Enter your lastname: ')

age = int(input('Enter your age: '))


user2 = dict(firstname=fname, lastname=lname, age=age)

print(user2)

users = []

users.append(user1)
users.append(user2)

print(users)


'''
Упражнение 4.1 (контрольное) Объем продаж
'''
week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
revenue = []

for day in week:
  daily_revenue = input(f'Enter daily revenue in {day}: ')
  revenue.append(daily_revenue)

print(sorted(revenue))


'''
Упражнение 4.2 (контрольное) Форматирование по уровню
'''
# Напишите программу, в которой создайте список случайно сгенерированных
# чисел от 1 до 100. На основе этого списка создайте второй, который будет содержать
# слова “High” ("высокий”) или “Low” ("низкий") в зависимости от того, больше или
# меньше соответствующее число исходного списка некого порогового значения
# (само значение порога должно вводится пользователем).
import random

random_numbers = []
threshold_value = int(input("Введите пороговое число: "))
threshold_iterpretation = []


for random_number in range(99):
  random_number = random.randint(0, 100)
  random_numbers.append(random_number)
  
  if (random_number > threshold_value):
    threshold_iterpretation.append("High")
  else:
    threshold_iterpretation.append("Low")
    
    
print(random_numbers)
print(threshold_iterpretation)
