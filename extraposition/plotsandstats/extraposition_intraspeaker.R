library(ggplot2)
library(plyr)

####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("../queriesandoutput/cprelExtrapos.pceec.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech","Weight","Year","ASex","RSex","Author")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position != "z" & Year != "z" & Year != "0" & ASex != "z" & RSex != "z" & Author != "z")


library(gdata)


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)


####Make sure dates abd 0/1 codes are stored as numbers.

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$WQ))


####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

ex.fit <- glm(Extraposition~Year*Position*Clause*TextOrSpeech*Weight*ASex*RSex, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")

####Mixed effects logistic; check with joe about how author affects all this stuff

library(lme4)

ex.fit2 <- lmer(Extraposition ~ Year + Position + Clause + TextOrSpeech + Weight + ASex + RSex + Author + (1 + Weight|Author), data = ex.data, family = binomial)
summary(ex.fit2)

ex.fit3 <- lmer(Extraposition ~ Year + Position + Clause + TextOrSpeech + Weight + ASex + RSex + Author + (1 + Weight|Author) + Year*Extraposition, data = ex.data, family = binomial)

summary(ex.fit3)

anova(ex.fit3,ex.fit2)

####Plot the logistic model of the data with ggplot2, creating a plot object.

###Subsetting Author to only a few with the most data

ex.data <- subset(foo,Author == "ARABELLA_STUART"|"BRIAN_DUPPA"|"DOROTHY_OSBORNE/TEMPLE"|"HENRY_OXINDEN_BARHAM_"|"JOHN_CHAMBERLAIN"|"JOHN_HOLLES_SR"|"JOHN_JONES"|"NATHANIEL_BACON_I"|"MARGARET_PASTON_N.MAUTBY_"|"ROBERT_DUDLEY"|"SAMUEL_PEPYS"|"THOMAS_CROMWELL"|"THOMAS_MORE"|"THOMAS_WENTWORTH"|"WILLIAM_PETTY_1")


library(RColorBrewer)

p <- ggplot(ex.data, aes(Weight,Extraposition,color=Author)) + scale_y_continuous(name = "Probability of Extraposition", breaks=seq(0,1,by=0.1), labels=c("In Situ",seq(0.1,0.9,by = 0.1),"EX") ) + scale_x_continuous(name = "\nNumber of Words") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1")

####Save the plot as a pdf file, with dimensions that are pleasing to the eye.

ggsave(p, file = "exWeightLoess.pdf", width = 8, height = 5)


####Create a new variable in the data frame which will bin the data by century. The only point to doing this is to make a pretty graph of percentages across time.

ex.data$Time2 <- floor(whether.data$Year/50)*50

####Create a new data frame for the percentage plot which averages percentages for each century. Again, this is not useful for real data analysis -- just for making this particular plot. This graph only plots the overall percentages of whether vs. if, not differentiating the two contexts. This is not a particularly useful graph for anything except demonstration purposes.

plot.data <- ddply(ex.data, .(Time2),summarize, whet = mean(Extraposition, na.rm = T), n = sum(!is.na(Extraposition)))

#p <- ggplot(aes(x = Time2, y = whet), data = plot.data) + geom_line() + geom_point(aes(size = n)) + scale_y_continuous(name = "\nProportion of Whether", limits = c(0,1)) + scale_x_continuous(name = "\nCentury") + scale_color_brewer(palette = "Set1")

#ggsave(p, file = "whetherifEngSimple.pdf", width = 8, height = 5)


####Create a new data frame for the percentage plot which averages percentages for each century. Again, this is not useful for real data analysis -- just for making this particular plot. This graph plots 2 lines for the two contexts, disjunction and simple.

#plot.data <- ddply(whether.data, .(Time2, Disj),summarize, whet = mean(WQ, na.rm = T), n = sum(!is.na(WQ)))

####Experimenting with loess and splines

library(splines)
library(MASS)

#p <- ggplot(aes(x = Time2, y = whet, color = Disj, group = Disj), data = plot.data) + stat_smooth() + geom_point(aes(size = n)) + scale_y_continuous(name = "\nProportion of Whether", limits = c(0,1)) + scale_x_continuous(name = "\nCentury") + scale_color_brewer(palette = "Set1")

#ggsave(p, file = "whetherifEng.pdf", width = 8, height = 5)


#p <- ggplot(whether.data, aes(Year,WQ,color=Disj)) + scale_y_continuous(name = "Probability of Whether", breaks=seq(0,1,by=0.1), labels=c("If",seq(0.1,0.9,by = 0.1),"Whether") ) + scale_x_continuous(name = "\nTime") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + stat_smooth(method= "lm", formula = y ~ ns(x,3)) #+ stat_smooth(method="glm", family ="binomial",fullrange=F)

####Save the plot as a pdf file, with dimensions that are pleasing to the eye.

#ggsave(p, file = "whetherifEngsplines.pdf", width = 8, height = 5)