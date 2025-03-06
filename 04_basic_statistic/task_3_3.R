mass <-  c(rep(24,3),
           rep(26,10),
           rep(28,6),
           rep(30,16),
           rep(32,15),
           rep(34,30),
           rep(36,20))
# количество элементов
n <- length(mass)
# среднее
mean1 <- sum(mass)/n
mean(mass)
# дисперсия
sum((mass-mean1)^2)/n
var(mass)
# среднее квадратическое отклонение
sigma <- sqrt(sum((mass-mean1)^2)/n-1)
sd(mass)
# ошибка средней
SE <-  sigma/sqrt(n)
# коэффициетнт вариаций
CV <-  sigma/mean1
# доверительный интервал
z <-  1.96
CI_1 <-  mean1 - z * sigma/n
CI_2 <-  mean1 + z * sigma/n
# 31.93643 < x < 32.06357