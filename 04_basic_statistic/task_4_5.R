library(ggplot2)
x <- c(1,2,3,4,5,6,7,8)
y <- c(1,4,2,5,1,2,5,3)

df1 <- data.frame(x,y)

image1 <- ggplot(df1, aes(x,y))+
  geom_line()+
  geom_point()+
  geom_smooth(se = F)
ggsave("./04_basic_statistic/row_4_5_by_R.png",image1)
