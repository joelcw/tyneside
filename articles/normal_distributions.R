library(ggplot2)

center1 <- 25
center2 <-  75

dist1 <- dnorm(seq(0,100,length = 100), mean= center1, sd=12.5)
dist2 <- dnorm(seq(0,100,length = 100), mean = center2, sd=12.5)
style <- seq(0,100, length = 100)


dists_df <- data.frame(variant1 = dist1, variant2 = dist2, style = style)

ggplot(dists_df, aes(style))+
  geom_line(aes(y = variant1), color = "red") +
  geom_line(aes(y = variant2), color = "blue")+
  ggtitle("distributions across style")

ggplot(dists_df, aes(style))+
  geom_vline(x = center1, color = "red")+
  geom_vline(x = center2, color = "blue")+
  geom_line(aes(y=variant1/(variant1 + variant2)), color = "red", linetype = 2)+
  ggtitle("classification probability")