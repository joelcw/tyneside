library(ggplot2)
library(plyr)

####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("../queriesandoutput/cprelExtrapos.pceec.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech","Weight","Year","ASex","RSex","Author")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position != "z" & Year != "z" & Year != "0" & ASex != "z" & RSex != "z" & Author != "z" & Weight != "z")


library(gdata)


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers.

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

"finished converting to numeric"

####Fit a logistic regression with ex as a binary outcome, output a summary of the model, and output a model comparison to models without various factors. Leaves out Author.

ex.fit <- glm(Extraposed~Year*Position*Clause*TextOrSpeech*Weight*ASex*RSex, family = binomial, data=ex.data)
summary(ex.fit)
anova(ex.fit, test = "Chisq")

####Mixed effects logistic; check with joe about how author affects all this stuff

library(lme4)

ex.fit2 <- lmer(Extraposed ~ Year + Position + Clause + TextOrSpeech + Weight + ASex + RSex + Author + (1 + Weight|Author), data = ex.data, family = binomial)
summary(ex.fit2)

ex.fit3 <- lmer(Extraposed ~ Year + Position + Clause + TextOrSpeech + Weight + ASex + RSex + Author + (1 + Weight|Author) + Year*Extraposed, data = ex.data, family = binomial)

summary(ex.fit3)

anova(ex.fit3,ex.fit2)

####Plot the logistic model of the data with ggplot2, creating a plot object.

###Subsetting Author to only ones with 100 or more tokens

ex.data <- subset(ex.data,Author == "ARABELLA_STUART" | Author == "BRIAN_DUPPA" | Author == "DOROTHY_OSBORNE/TEMPLE" | Author == "HENRY_OXINDEN_BARHAM_" | Author == "JOHN_CHAMBERLAIN" | Author == "JOHN_HOLLES_SR" | Author == "JOHN_JONES" | Author == "NATHANIEL_BACON_I" | Author == "MARGARET_PASTON_N.MAUTBY_" | Author == "ROBERT_DUDLEY" | Author == "SAMUEL_PEPYS" | Author == "THOMAS_CROMWELL" | Author == "THOMAS_MORE" | Author == "THOMAS_WENTWORTH" | Author == "WILLIAM_PETTY_1")