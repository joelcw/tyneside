library(ggplot2)

p <- ggplot(data.frame(x = c(0, 50)), aes(x)) + stat_function(fun = dnorm, args = list(mean = 12.5, sd = 4))+stat_function(fun = dnorm, args = list(mean = 37.5, sd = 4))

ggsave(p, file = "twonormals.pdf", width = 8, height = 5)