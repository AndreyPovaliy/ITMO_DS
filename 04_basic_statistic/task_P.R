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

task_P2$sum <- task_P2$`Число заболевших`+ task_P2$`Число не заболевших`
df_p2 <- data.frame(
  group <- c(rep("1",task_P2$sum[1]),rep("2",task_P2$sum[2]),rep("3",task_P2$sum[3])),
  outcome <- c(rep("1",task_P2$`Число заболевших`[1]),
               rep("0",task_P2$`Число не заболевших`[1]),
               rep("1",task_P2$`Число заболевших`[2]),
               rep("0",task_P2$`Число не заболевших`[2]),
               rep("1",task_P2$`Число заболевших`[3]),
               rep("0",task_P2$`Число не заболевших`[3]))
               
)
colnames(df_p2) <- c("group","outcome")
chisq.test(table(df_p2)) # X-squared = 40.073, df = 2, p-value = 1.988e-09

# вывод:
#  по представленным данным есть убедительные доказателства, что 
# вода является причиной заражения