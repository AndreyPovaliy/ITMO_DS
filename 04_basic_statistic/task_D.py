import random
import matplotlib.pyplot as plt

k = 25
'''
random_numbers = [random.randint(0,100) for _ in range(1000)]
'''
# mu = 0    
# sigma = 1 
# random_numbers = [random.normalvariate(mu, sigma) for _ in range(1000)]
'''

lambd = 0.5
random_numbers = [random.expovariate(lambd) for _ in range(1000)]
'''

# plt.hist(random_numbers, bins=k, density=True)
# plt.title("Histogram of normal distribution")
# plt.xlabel("Value")
# plt.ylabel("Frequency")
# plt.show()

'''Задание. 
Постройте гистограмму случайных чисел, полученных как сумма 12-ти случайных чисел, 
распределенных по равномерному закону распределения.
Сделайте вывод о предположительном виде закона распределения.
Посмотрите, как изменится график при суммировании двух, трех чисел.
'''
random_numbers = [sum(random.randint(1,12)  for _ in range(1)) for _ in range(1000)]

plt.clf()
plt.hist(random_numbers, bins=k, density=True)
plt.title("Histogram of normal distribution")
plt.xlabel("Value")
plt.ylabel("Frequency")
plt.savefig('./04_basic_statistic/hist_D_one_num.png')

random_numbers = [sum(random.randint(1,12) for _ in range(2)) for _ in range(1000)]

plt.clf()
plt.hist(random_numbers, bins=k, density=True)
plt.title("Histogram of normal distribution")
plt.xlabel("Value")
plt.ylabel("Frequency")
plt.savefig('./04_basic_statistic/hist_D_two_num.png')

random_numbers = [sum(random.randint(1,12) for _ in range(3)) for _ in range(1000)]

plt.clf()
plt.hist(random_numbers, bins=k, density=True)
plt.title("Histogram of normal distribution")
plt.xlabel("Value")
plt.ylabel("Frequency")
plt.savefig('./04_basic_statistic/hist_D_three_num.png')
