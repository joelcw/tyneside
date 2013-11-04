
style <- seq(0.01, 0.99, length = 100)
plot(style, dbeta(style, 2,6))
lines(style, dbeta(style, 3,6))
lines(style, dbeta(style, 4,6))
lines(style, dbeta(style, 6,6))

d_in <- dbeta(style, 5,3)
d_in3 <- dbeta(style, 6,6)
d_ing <- dbeta(style, 2,6)
d_ing2 <- dbeta(style, 3,6)
d_ing3 <- dbeta(style, 6,6)

plot(d_in/(d_in+d_ing))
lines(d_in/(d_in+d_ing2))
lines(d_in3/(d_in3+d_ing3))