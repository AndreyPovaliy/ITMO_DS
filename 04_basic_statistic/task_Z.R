library(readr)
library(BSDA)

df_z1 <- read_csv("04_basic_statistic/task_z1.csv")

shapiro.test(df_z1$`1 станок`) # W = 0.93577, p-value = 0.3322
shapiro.test(df_z1$`2 станок`) # W = 0.9422, p-value = 0.5778
# ---> нормальное распределение



z.test(df_z1$`1 станок`,df_z1$`2 станок`,sigma.x=0.5, sigma.y=0.5, conf.level=0.90)

# z = -17.457, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0


X1 <- c(rep(12,3),
        rep(13,8),
        rep(14,16),
        rep(15,19),
        rep(16,21),
        rep(17,17),
        rep(18,9),
        rep(19,5),
        rep(20,2))

X2 <- c(rep(11,1),
        rep(12,4),
        rep(13,4),
        rep(14,7),
        rep(15,12),
        rep(16,18),
        rep(17,22),
        rep(18,15),
        rep(19,8),
        rep(20,6),
        rep(21,3))

z.test(X1,X2,sigma.x=0.5, sigma.y=0.5, conf.level=0.90) 
# z = -12.021, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
