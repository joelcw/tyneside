library(ggplot2)
library(plyr)
library(lme4)

####For English data
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/queriesandoutput/cprelExtrapos.ymeb.cod.fixed.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year", "Text")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

#####Note that it is crucial to make sure empty string Year is not included, because this deletes codes which correspond to clauses that are above the clause containing the relevant token. They were never coded for Year because they were not relevant. Note that in the "fixed" sets, the textid has been put into the year place, so it is necessary to subset again and droplevels again after converting Year to numeric.

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position != "z" & Year != "z" & Year != "0" & Year != "" & Weight != "z" & Year != "NA")


library(gdata)


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

#####THIS IS A COMMENT REPEATING A COMMENT ABOVE, BECAUSE OF THE NEED TO DROPLEVELS AGAIN: Note that it is crucial to make sure empty string Year is not included, because this deletes codes which correspond to clauses that are above the clause containing the relevant token. They were never coded for Year because they were not relevant. **Note that in the "fixed" sets, the textid has been put into the year place, so it is necessary to subset again and droplevels again after converting Year to numeric.**

ex.data.fixed <- subset(ex.data,Year != "NA")
ex.data.fixed <- droplevels(ex.data.fixed)

"finished converting to numeric"

####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

"English Model"

#ex.fit <- glm(Extraposed~Year*Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data)
#summary(ex.fit)
#anova(ex.fit, test = "Chisq")

#m <- glmer(remission ~ IL6 + CRP + CancerStage + LengthofStay + Experience + (1 | DID), data = hdp, family = binomial, control = glmerControl(optimizer = "bobyqa"), nAGQ = 10)

#ex.fit <- glmer(Extraposed~(1|Text)+Year*Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data)


#ex.fit <- glmer(Extraposed~(1|Text)*Year*Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data.fixed)
#ex.fit2 <- glmer(Extraposed~(1|Text)+Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data.fixed)
#summary(ex.fit)
#anova(ex.fit, test = "Chisq")
#anova(ex.fit2, ex.fit, test = "Chisq")

#Zing the numeric predictors so the mixed effects model doesnt barf so much:

ex.data.fixed$zYear <- scale(ex.data.fixed$Year, center=TRUE, scale=TRUE)
ex.data.fixed$zWeight <- scale(ex.data.fixed$Weight, center=TRUE, scale=TRUE)

#Note that any models more complex than the first one below did not converge.

ex.fit <- glmer(Extraposed~(1|Text)+zYear+Position+Clause+TextOrSpeech+zWeight+zYear*Position+zYear*Clause, family = binomial, data=ex.data.fixed)
ex.fit2 <- glmer(Extraposed~(1|Text)+Position+Clause+TextOrSpeech+zWeight, family = binomial, data=ex.data.fixed)
summary(ex.fit)
anova(ex.fit2, ex.fit, test = "Chisq")


####For Icelandic data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/queriesandoutput/cprelExtrapos.ice.cod.fixed.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year","Text","Genre","Textid")


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

#####THIS IS A COMMENT REPEATING A COMMENT ABOVE, BECAUSE OF THE NEED TO DROPLEVELS AGAIN: Note that it is crucial to make sure empty string Year is not included, because this deletes codes which correspond to clauses that are above the clause containing the relevant token. They were never coded for Year because they were not relevant. **Note that in the "fixed" sets, the textid has been put into the year place, so it is necessary to subset again and droplevels again after converting Year to numeric.**

ex.data.fixed <- subset(ex.data,Year != "NA")
ex.data.fixed <- droplevels(ex.data.fixed)

"finished converting to numeric"

####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

"Icelandic Model"

#ex.fit <- glm(Extraposed~Year*Position*Clause*TextOrSpeech*Weight*Genre, family = binomial, data=ex.data.fixed)
#summary(ex.fit)
#anova(ex.fit, test = "Chisq")



#Zing the numeric predictors so the mixed effects model doesnt barf so much:

ex.data.fixed$zYear <- scale(ex.data.fixed$Year, center=TRUE, scale=TRUE)
ex.data.fixed$zWeight <- scale(ex.data.fixed$Weight, center=TRUE, scale=TRUE)

#Note that any models more complex than the first one below did not converge.

ex.fit <- glmer(Extraposed~(1|Text)+zYear+Position+Clause+TextOrSpeech+zWeight+zYear*Position+zYear*Clause+zYear*zWeight, family = binomial, data=ex.data.fixed)
ex.fit2 <- glmer(Extraposed~(1|Text)+Position+Clause+TextOrSpeech+zWeight, family = binomial, data=ex.data.fixed)
ex.fit3 <- glmer(Extraposed~(1|Text)+zYear+Position+Clause+TextOrSpeech+zWeight+zYear*Position+zYear*Clause, family = binomial, data=ex.data.fixed)
summary(ex.fit)
anova(ex.fit, ex.fit2, test = "Chisq")
anova(ex.fit, ex.fit3, test = "Chisq")



####For Middle French data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/queriesandoutput/cprelExtrapos.fre.cod.fixed.ooo",header=F,sep=":")


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

ex.data.fixed <- subset(ex.data,Year != "NA")
ex.data.fixed <- droplevels(ex.data.fixed)

"finished converting to numeric"


####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

"French Model"

#ex.fit <- glm(Extraposed~Year*Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data.fixed)
#summary(ex.fit)
#anova(ex.fit, test = "Chisq")


#Zing the numeric predictors so the mixed effects model doesnt barf so much:

ex.data.fixed$zYear <- scale(ex.data.fixed$Year, center=TRUE, scale=TRUE)
ex.data.fixed$zWeight <- scale(ex.data.fixed$Weight, center=TRUE, scale=TRUE)

#Note that any models more complex than the first one below did not converge.

ex.fit <- glmer(Extraposed~(1|Text)+zYear+Position+Clause+TextOrSpeech+zWeight+zYear*Position+zYear*Clause+zYear*zWeight, family = binomial, data=ex.data.fixed)
ex.fit2 <- glmer(Extraposed~(1|Text)+Position+Clause+TextOrSpeech+zWeight, family = binomial, data=ex.data.fixed)
ex.fit3 <- glmer(Extraposed~(1|Text)+zYear+Position+Clause+TextOrSpeech+zWeight+zYear*Position+zYear*Clause, family = binomial, data=ex.data.fixed)
summary(ex.fit)
anova(ex.fit2, ex.fit, test = "Chisq")
anova(ex.fit3, ex.fit, test = "Chisq")


####For Portuguese data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/queriesandoutput/cprelExtrapos.port.cod.fixed.ooo",header=F,sep=":")


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

ex.data.fixed <- subset(ex.data,Year != "NA")
ex.data.fixed <- droplevels(ex.data.fixed)

"finished converting to numeric"


####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

"Portuguese Model"

#ex.fit <- glm(Extraposed~Year*Position*Clause*TextOrSpeech*Weight, family = binomial, data=ex.data.fixed)
#summary(ex.fit)
#anova(ex.fit, test = "Chisq")

#Zing the numeric predictors so the mixed effects model doesnt barf so much:

ex.data.fixed$zYear <- scale(ex.data.fixed$Year, center=TRUE, scale=TRUE)
ex.data.fixed$zWeight <- scale(ex.data.fixed$Weight, center=TRUE, scale=TRUE)

#Note that any models more complex than the first one below did not converge.

ex.fit <- glmer(Extraposed~(1|Text)+zYear+Position+Clause+TextOrSpeech+zWeight+zYear*Clause, family = binomial, data=ex.data.fixed)
ex.fit2 <- glmer(Extraposed~(1|Text)+Position+Clause+TextOrSpeech+zWeight, family = binomial, data=ex.data.fixed)
ex.fit3 <- glmer(Extraposed~(1|Text)+zYear+Position+Clause+TextOrSpeech+zWeight+zYear*Clause, family = binomial, data=ex.data.fixed)
summary(ex.fit)
anova(ex.fit2, ex.fit, test = "Chisq")
anova(ex.fit, ex.fit3, test = "Chisq")




#See if slope is same across langs
"All Languages"

library(ggplot2)
library(plyr)


####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("~/tyneside/extraposition/plotsandstats/allLangsEx.cod.fixed.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year","Text","Language")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Year != "z" & Year != "0" & Year != "" & Position != "z" & Weight != "z" & Language != "")


library(gdata)


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

ex.data.fixed <- subset(ex.data,Year != "NA")
ex.data.fixed <- droplevels(ex.data.fixed)

"finished converting to numeric"

nrow(ex.data.fixed)
#Note that I only consider subject position below
"Note that I only consider subject position below"
#ex.crossLing.fit <- glm(Extraposed~Year*Clause*TextOrSpeech*Weight*Language, family = binomial, data=ex.data.fixed)
#summary(ex.crossLing.fit)
#anova(ex.crossLing.fit, test = "Chisq")

#Zing the numeric predictors so the mixed effects model doesnt barf so much:

ex.data.fixed$zYear <- scale(ex.data.fixed$Year, center=TRUE, scale=TRUE)
ex.data.fixed$zWeight <- scale(ex.data.fixed$Weight, center=TRUE, scale=TRUE)


ex.crossLing.fit <- glmer(Extraposed~(1|Text)+zYear+Position+Clause+TextOrSpeech+zWeight+Language+Language*zWeight+Language*Position+Language*TextOrSpeech+zYear*Position+zYear*Clause+zYear*zWeight+Language*zYear, family = binomial, data=ex.data.fixed)
summary(ex.crossLing.fit)