library(ggplot2)

center1 <- -1
center2 <-  1

dist1 <- dnorm(seq(-4,4,length = 100), mean= center1)
dist2 <- dnorm(seq(-4,4,length = 100), mean = center2)
style <- seq(-4,4, length = 100)


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