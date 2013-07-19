library(ggplot2)
library(plyr)

####For English data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("../queriesandoutput/cprelExtrapos.ymeb.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position != "z" & Year != "z" & Year != "0" & Year != "" & Weight != "z")


library(gdata)


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

"finished converting to numeric"

####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

"English Model"

ex.fit <- glm(Extraposed~Year*Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")



####For Icelandic data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("../queriesandoutput/cprelExtrapos.ice.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position != "z" & Year != "z" & Year != "0" & Year != "" & Weight != "z")


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

"finished converting to numeric"

####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

"Icelandic Model"

ex.fit <- glm(Extraposed~Year*Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")



####For Middle French data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("../queriesandoutput/cprelExtrapos.fre.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year","Text")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position != "z" & Year != "z" & Year != "0" & Year != "" & Weight != "z")


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

"finished converting to numeric"


####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

"French Model"

ex.fit <- glm(Extraposed~Year*Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")