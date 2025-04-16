library(plotly)
# mpg
fig <- plot_ly(mpg, y = ~cty, color = ~drv, type = "violin")
fig