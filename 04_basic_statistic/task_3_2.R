library(ggplot2)
prices <- c(7.5,7.6,8.7,
            6.1,10.6,9.8,
            7,6,8.3,
            6,8.2,8.5,
            7.4,7.1,9.5,
            6.8,9.6,6.3,
            6.3,8.5,5.8,
            7.5,9.2,7.2,
            7,8,7.5,
            7.5,8,6.5)

df <- data.frame(prices)
df1 <- data.frame(table(prices))
df1$group <- rep("1",length(df1$prices))

image1 <- ggplot(df, aes(prices))+
  geom_histogram(bins = 15)


image2 <- ggplot(df1, aes(prices, Freq))+
  geom_point()+
  geom_line(aes(group = group))

ggsave("./04_basic_statistic/histogram_3_2_by_R.png",image1)
ggsave("./04_basic_statistic/polygon_3_2_by_R.png",image2)

