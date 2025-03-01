import matplotlib.pyplot as plt
plt.clf()
prices = [7.5,7.6,8.7,6.1,10.6,9.8,7.0,6.0,8.3,6.0,8.2,8.5,7.4,7.1,9.5,6.8,9.6,6.3,6.3,8.5,5.8,7.5,9.2,7.2,7.0,8.0,7.5,7.5,8.0,6.5]

plt.hist(prices)
plt.savefig('./04_basic_statistic/histogram_3_2_by_Python.png')
plt.clf()

prices = [5.8,6.0,6.1,6.3,6.5,6.8,7.0,7.1,7.2,7.4,7.5,7.6,8.0,8.2,8.3,8.5,8.7,9.2,9.5,9.6,9.8,10.6] 
freq = [1,2,1,2,1,1,2,1,1,1,4,1,2,1,1,2,1,1,1,1,1,1]

plt.scatter(prices,freq)
plt.plot(prices,freq, linestyle = 'dotted')
plt.savefig('./04_basic_statistic/polygon_3_2_by_Python.png')

