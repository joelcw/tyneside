library(ggplot2)
library(plyr)

####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("whetherifice.ice.cod.ooo",header=F,sep=":")

####Give appropriate column names to the columns

colnames(foo) <- c("WQ","Disj","Year")

####Throw out all the codes that refer to tokens that are irrelevant for the study.

whether.data <- subset(foo,WQ != "z" & Disj != "z" & Year != "z" & Year != "0")

library(gdata)

####Make sure R factor groups don't include factors for the irrelevant codes.

whether.data <- droplevels(whether.data)

####Make sure dates and 0/1 codes are stored as numbers.

whether.data$Year <- as.numeric(as.character(whether.data$Year))
whether.data$WQ <- as.numeric(as.character(whether.data$WQ))


####Fit a logistic regression with whether vs. if as a binary outcome, output a summary of the model, and output a model comparison to models without various factors.

"Icelandic Model"
whether.fit <- glm(WQ~Disj*Year, family = binomial, data=whether.data)
summary(whether.fit)
anova(whether.fit, test = "Chisq")


####Plot the logistic model of the data with ggplot2, creating a plot object.

library(RColorBrewer)
p <- ggplot(whether.data, aes(Year,WQ,color=Disj)) + scale_y_continuous(name = "Probability of Hvort", breaks=seq(0,1,by=0.1), labels=c("Ef",seq(0.1,0.9,by = 0.1),"Hvort") ) + scale_x_continuous(name = "\nTime") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth(method="glm", family ="binomial",fullrange=F) + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1")

ggsave(p, file = "whetherifIcemodel.pdf", width = 8, height = 5)


####Create a new variable in the data frame which will bin the data by century. The only point to doing this is to make a pretty graph of percentages across time.

whether.data$Time2 <- floor(whether.data$Year/100)*100


####Create a new data frame for the percentage plot which averages percentages for each century. Again, this is not useful for real data analysis -- just for making this particular plot. This graph only plots the overall percentages of whether vs. if, not differentiating the two contexts. This is not a particularly useful graph for anything except demonstration purposes.

plot.data <- ddply(whether.data, .(Time2),summarize, whet = mean(WQ, na.rm = T), n = sum(!is.na(WQ)))

p <- ggplot(aes(x = Time2, y = whet), data = plot.data) + geom_line() + geom_point(aes(size = n)) + scale_y_continuous(name = "\nProportion of Hvort", limits = c(0,1)) + scale_x_continuous(name = "\nCentury") + scale_color_brewer(palette = "Set1")

ggsave(p, file = "whetherifIceSimple.pdf", width = 8, height = 5)


####Create a new data frame for the percentage plot which averages percentages for each century. Again, this is not useful for real data analysis -- just for making this particular plot. This graph plots 2 lines for the two contexts, disjunction and simple.

plot.data <- ddply(whether.data, .(Time2, Disj),summarize, whet = mean(WQ, na.rm = T), n = sum(!is.na(WQ)))

p <- ggplot(aes(x = Time2, y = whet, color = Disj, group = Disj), data = plot.data) + geom_line() + geom_point(aes(size = n)) + scale_y_continuous(name = "\nProportion of Hvort", limits = c(0,1)) + scale_x_continuous(name = "\nCentury") + scale_color_brewer(palette = "Set1")

ggsave(p, file = "whetherifIce.pdf", width = 8, height = 5)