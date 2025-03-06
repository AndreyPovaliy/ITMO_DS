library(ggplot2)
x <- c(7,
       6,
       7,
       8,
       9,
       9,
       9,
       9,
       6,
       9)
y <- c(483,
       489,
       486,
       563,
       570,
       559,
       594,
       575,
       464,
       647)

df1 <-  data.frame(x,y)

myfit <- lm(y~x, df1)
summary(myfit)
# С равномерностью модели, где p-value: 0.000558 можно сказать, что при увеличении
# числа работников будет ожидаться увеличение производительности



ggsave("./04_basic_statistic/linear_regression_4_3_by_R.png",image1)
