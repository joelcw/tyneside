library(ggplot2)
library(plyr)

####For English data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/queriesandoutput/cprelExtrapos.ymeb.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

#####Note that it is crucial to make sure empty string Year is not included, because this deletes codes which correspond to clauses above the clause containing the relevant token. They were never coded for Year because they were not relevant.

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position == "sbj" & Year != "z" & Year != "0" & Year != "" & Weight != "z")


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

ex.fit <- glm(Extraposed~Year*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")



####For Icelandic data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/queriesandoutput/cprelExtrapos.ice.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year","Text","Genre")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position == "sbj" & Year != "z" & Year != "0" & Year != "" & Weight != "z")


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

ex.fit <- glm(Extraposed~Year*Clause*TextOrSpeech*Weight*Genre, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")



####For Middle French data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/queriesandoutput/cprelExtrapos.fre.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year","Text")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position == "sbj" & Year != "z" & Year != "0" & Year != "" & Weight != "z")


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

ex.fit <- glm(Extraposed~Year*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")



####For Portuguese data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/queriesandoutput/cprelExtrapos.port.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position == "sbj" & Year != "z" & Year != "0" & Year != "" & Weight != "z")


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

"finished converting to numeric"


####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

"Portuguese Model"

ex.fit <- glm(Extraposed~Year*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")

#See if slope is same across langs

"All Languages"

library(ggplot2)
library(plyr)


####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/plotsandstats/allLangsEx.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year","Language")


####Throw out all the codes that refer to tokens that are irrelevant for the study.
#####Note that it is crucial to make sure empty string Year and empty string Language are not included, because this deletes codes which correspond to clauses above the clause containing the relevant token. (Language gets appended by a script later, and will get appended in the Year place, creating empty string in the last field of those codes, so excluding empty strings in the last field will likewise exclude these codes.) If you see "NAs introduced by coercion" for Year in French and Portuguese, then you've failed to exclude codes that you should exclude.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Year != "z" & Year != "0" & Year != "" & Position == "sbj" & Weight != "z" & Language != "" & Language != "Portuguese" & Language != "French")


library(gdata)


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

"finished converting to numeric"

nrow(ex.data)
#Note that I only consider subject position below.
"Note that I only consider subject position below"
ex.crossLing.fit <- glm(Extraposed~Year*Clause*TextOrSpeech*Weight*Language, family = binomial, data=ex.data)
summary(ex.crossLing.fit)
anova(ex.crossLing.fit, test = "Chisq")