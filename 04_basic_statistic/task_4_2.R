library(ggplot2)
x <- c(12.1,
       14.7,
       20.5,
       16.6,
       19.0)
y <- c(53.2,
       44.2,
       51.4,
       45.5,
       34.0)
df1 <-  data.frame(x,y)

cor.test(x,y) # -0.3636188 

image1 <- ggplot(df1,aes(x,y))+
  geom_point()+
  geom_smooth(method = "lm")

ggsave("./04_basic_statistic/cor_test_4_2_by_R.png",image1)
  