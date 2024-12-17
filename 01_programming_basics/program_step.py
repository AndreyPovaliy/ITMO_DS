'''
Настоящая реализация задания с исследованием полки магазина по следующей логике:
1) Вначале вносят имена об исследуемых полок и описательную часть
2) В данной программе иметируется продажа за день, а именно случайное количество товара и наименование из
заданного списка.
3) Каждый товар имеет заданное значение цены и для каждой полки определяется последовательность покупок и выручка
4) Разница между полками будет определять непараметрическим критерием, так как будем считать все распределения ненормальными
'''


from random import randint,choices
import scipy.stats as sps

# минимальная реализация описательночасти  
def input_shelf_data():
  shelf1 = input('Ввдиете обозначение полки №1 ')
  shelf2 = input('Ввдиете обозначение полки №2 ')
  return (shelf1,shelf2)


# моделирование количества покупок
n1 = randint(10, 60)
n2 = randint(10, 60)

# создание необходимых списков и словарей
goods = ["Йогрурт Персик","Молоко 2.5%", "Молоко 3.5%","Творог","Детский творожок", "Ряженка","Сметана","Сливки 22%"]

price = [44,54,57,45,32,52,48,31]
sales1 = []
sales2 = []

for i in range (30):
  s1 = random.choices(goods,  k=n1)
  s2 = random.choices(goods,  k=n2)
  p1 = random.choices(price,  k=n1)
  p2 = random.choices(price,  k=n2)
  sales1 = sales1 + p1
  sales2 = sales2 + p2


mann_pvalue = sps.mannwhitneyu(sales1, sales2, alternative='two-sided').pvalue
is_sighnificant = mann_pvalue < 0.05
       
if(is_sighnificant):
  print("Разница между полками есть")
  if(sales1>sales2):
    print(f"В пользу полки {shelf1}")
  else:
    print(f"В пользу полки {shelf2}")
else:
  print("Разницы между полками нет")
  

