points1 <- c("1","2","3","4","5","6")
counts1 <- c(101,
             86,
             107,
             94,
             97,
             117)

row_of_ponts <- c(rep(points1[1],counts1[1]),
                  rep(points1[2],counts1[2]),
                  rep(points1[3],counts1[3]),
                  rep(points1[4],counts1[4]),
                  rep(points1[5],counts1[5]),
                  rep(points1[6],counts1[6]))


chisq.test(table(row_of_ponts)) #X-squared = 5.7741, df = 5, p-value = 0.3288
# вывод:
#  по представленным данныубедительных доказателств, что кость, используемая 
# в казино, фальшива, нет.

library(readr)
task_P2 <- read_csv("04_basic_statistic/task_P2.csv")

chisq.test(task_P2$`Число заболевших`,task_P2$`Число не заболевших`) # X-squared = 6, df = 4, p-value = 0.1991

# вывод:
#  по представленным данным убедительных доказателств, что 
# вода является причиной заражения нет