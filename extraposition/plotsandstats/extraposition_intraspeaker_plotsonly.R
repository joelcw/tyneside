library(ggplot2)
library(plyr)

####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("../queriesandoutput/cprelExtrapos.pceec.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech","Weight","Year","ASex","RSex","Author")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position != "z" & Year != "z" & Year != "0" & Year != "" & ASex != "z" & RSex != "z" & Author != "z" & Weight != "z")


library(gdata)


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

"finished converting to numeric"

###Subsetting Author to only ones with 100 or more tokens

ex.data.author <- subset(ex.data,Author == "ARABELLA_STUART" | Author == "BRIAN_DUPPA" | Author == "DOROTHY_OSBORNE/TEMPLE" | Author == "HENRY_OXINDEN_BARHAM_" | Author == "JOHN_CHAMBERLAIN" | Author == "JOHN_HOLLES_SR" | Author == "JOHN_JONES" | Author == "NATHANIEL_BACON_I" | Author == "MARGARET_PASTON_N.MAUTBY_" | Author == "ROBERT_DUDLEY" | Author == "SAMUEL_PEPYS" | Author == "THOMAS_CROMWELL" | Author == "THOMAS_MORE" | Author == "THOMAS_WENTWORTH" | Author == "WILLIAM_PETTY_1")

ex.data.author <- droplevels(ex.data.author)


library(RColorBrewer)

p <- ggplot(ex.data.author, aes(Weight, Extraposed)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)

####Save the plot as a pdf file, with dimensions that are pleasing to the eye.

ggsave(p, file = "exWeightLoess.pdf", width = 8, height = 5)


####Experimenting with cubic splines

library(splines)
library(MASS)


p <- ggplot(ex.data.author, aes(Weight, Extraposed)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth(method= "lm", formula = y ~ ns(x,3)) + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)


ggsave(p, file = "exWeightSpline.pdf", width = 8, height = 5)

####Plot with logistic

p <- ggplot(ex.data.author, aes(Weight, Extraposed)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth(method="glm", family ="binomial",fullrange=F) + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)


ggsave(p, file = "exWeightLogistic.pdf", width = 8, height = 5)

####Create a new variable in the data frame which will bin the data by weight windows of 15 words each. The only point to doing this is to make a pretty graph of percentages across time.

ex.data.author$Weight2 <- floor(ex.data.author$Weight/5)*5

####Create a new data frame for the percentage plot which averages percentages for each weight value of 15 words. Again, this is not useful for real data analysis -- just for making this particular plot.

plot.data <- ddply(ex.data.author, .(Weight2, Author),summarize, whet = mean(Extraposed, na.rm = T), n = sum(!is.na(Extraposed)))

head(plot.data)

p <- ggplot(plot.data, aes(Weight2, whet)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + geom_point(aes(size = n)) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)

ggsave(p, file = "exWeightBinned.pdf", width = 8, height = 5)


####Create a new variable in the data frame which will bin the data by century. The only point to doing this is to make a pretty graph of percentages across time.

ex.data$Time2 <- floor(ex.data$Year/50)*50

####Create a new data frame for the percentage plot which averages percentages for each century. Again, this is not useful for real data analysis -- just for making this particular plot.

plot.data <- ddply(ex.data, .(Time2),summarize, whet = mean(Extraposed, na.rm = T), n = sum(!is.na(Extraposed)))

p <- ggplot(plot.data, aes(Time2, whet)) + labs(y = "Probability of Extraposition", x = "\nTime Period") + geom_point(aes(size = n)) + scale_size_area(max_size=12) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + ylim(0,1)

ggsave(p, file = "exYearBinned50.pdf", width = 8, height = 5)


####Trying the same stuff, but separating sbj and obj positions

p <- ggplot(ex.data.author, aes(Weight, Extraposed, color=Position, group=Position)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)


ggsave(p, file = "exSbjObjWeightLoess.pdf", width = 8, height = 5)

plot.data <- ddply(ex.data, .(Time2, Position),summarize, whet = mean(Extraposed, na.rm = T), n = sum(!is.na(Extraposed)))

p <- ggplot(plot.data, aes(Time2, whet, color=Position, group=Position)) + labs(y = "Probability of Extraposition", x = "\nTime Period") + geom_point(aes(size = n)) + scale_size_area(max_size=12) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + ylim(0,1)

"N for PCEEC ="
sum(plot.data$n)

ggsave(p, file = "exSbjObjYearBinned50.pdf", width = 8, height = 5)

####Trying the same stuff, but using only sbj position

ex.data.author.sbj <- subset(ex.data.author,Position == "sbj")

ex.data.author.sbj <- droplevels(ex.data.author.sbj)

p <- ggplot(ex.data.author.sbj, aes(Weight, Extraposed)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)

####Save the plot as a pdf file, with dimensions that are pleasing to the eye.

ggsave(p, file = "exSbjWeightLoess.pdf", width = 8, height = 5)

####Logistic plot

p <- ggplot(ex.data.author.sbj, aes(Weight, Extraposed)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth(method="glm", family ="binomial",fullrange=F) + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)

####Save the plot as a pdf file, with dimensions that are pleasing to the eye.

ggsave(p, file = "exSbjWeightLogistic.pdf", width = 8, height = 5)


####Experimenting with cubic splines

library(splines)
library(MASS)


p <- ggplot(ex.data.author.sbj, aes(Weight, Extraposed)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + stat_sum(aes(size=..n.., alpha=.5)) + scale_size_area(max_size=12) + stat_smooth(method= "lm", formula = y ~ ns(x,3)) + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)


ggsave(p, file = "exSbjWeightSpline.pdf", width = 8, height = 5)

ex.data.author.sbj$Weight2 <- floor(ex.data.author.sbj$Weight/5)*5

####Create a new data frame for the percentage plot which averages percentages for each weight value of 15 words. Again, this is not useful for real data analysis -- just for making this particular plot.

plot.data <- ddply(ex.data.author.sbj, .(Weight2, Author),summarize, whet = mean(Extraposed, na.rm = T), n = sum(!is.na(Extraposed)))

head(plot.data)

p <- ggplot(plot.data, aes(Weight2, whet)) + labs(y = "Probability of Extraposition", x = "\nNumber of Words") + geom_point(aes(size = n)) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + facet_wrap(~Author) + ylim(0,1)

ggsave(p, file = "exSbjWeightBinned.pdf", width = 8, height = 5)