library(ggplot2)

p <- ggplot(data.frame(x = c(0, 100)), aes(x)) + stat_function(fun = dnorm, args = list(mean = 12.5, sd = 10))+stat_function(fun = dnorm, args = list(mean = 35.5, sd = 10))

ggsave(p, file = "twonormals.pdf", width = 8, height = 5)
