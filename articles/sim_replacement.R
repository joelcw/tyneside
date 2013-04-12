
library(ggplot2)
library(reshape2)
library(plyr)


generate_new_speaker <- function(niter, generation, min = 0, max = 100){
  # This function generates a new learner.
  #"In" and "Ing" are the (mean) style values for each variant
  #token is whihc variant they just heard
  #style is which style "
  experience <- list(In    = vector(length = niter),
                     Ing   = vector(length = niter),
                     token = vector(length = niter),
                     style = vector(length = niter),
                     iter  = 1:niter,
                     generation = rep(generation, niter),
                     InP = vector(length = niter),
                     IngP = vector(length = niter)
  )
  #  experience[["Ing"]][1]   <- (max-min)/2
  #  experience[["In"]][1]    <- (max-min)/2
  
  #JCW: I am changing the above to be values generated from old_speaker
  
  
  currentobs <- generate_from_speaker(old_speaker)
  
  if(currentobs[["token"]] == "Ing"){
    while(currentobs[["token"]] == "Ing"){
      lastobs <- currentobs
      currentobs <- generate_from_speaker(old_speaker)
    }
    
    experience[["Ing"]][1]   <- lastobs[["style"]]
    experience[["In"]][1]    <- currentobs[["style"]]
    
    #debug
    print("Ing")
    print(lastobs[["style"]])
    print(currentobs[["style"]])
  }
  
  else {
    while(currentobs[["token"]] == "In"){
      lastobs <- currentobs
      currentobs <- generate_from_speaker(old_speaker)
    }
    
    experience[["Ing"]][1]   <- currentobs[["style"]]
    experience[["In"]][1]    <- lastobs[["style"]]
    
    #debug
    print("In")
    print(lastobs[["style"]])
    print(currentobs[["style"]])
  }
  experience[["token"]][1] <- NA
  experience[["style"]][1] <- NA
  
  #When the new speaker is generated, the overall probability of producing each
  #variant is updated in order to model the competing grammars/replacement
  #scenario. Note that this is only updated each generation, not each iteration.
  #A logistic function, evaluated wrt generation, is used to generate the new
  #probability for this generation. The slope of the logistic is calculated as
  #the nat log of the difference between the two variants' style expectation
  #values from the last generation (divided by 100 so that they are between 0
  #and 1). The reason for this is that the slope will approach 0 as the
  #difference between the two variants approaches 1; i.e. as the variants are
  #more specialised, the change will slow down. Note that the slope will be
  #negative, which means that the current scenario is with "in" being replaced
  #by "ing". The max func with .01 is so that the slope is not infinite when the
  #style values are identical. Slope is divided by 10 so that it is not too
  #steep.
  
  diff <- (old_speaker[["In"]]-old_speaker[["Ing"]])/100
  slope <- log(max(.01,abs(diff)))/10
  
  #The constant k is 0 below, so that the initial inp is 0.5. This is under a
  #scenario where the specialization begins in the middle of a change. 
  #generation starts at 0 rather than 1, so that the specialisation has an extra
  #generation to start
  
  inp <- exp(slope*(generation-1))/(1+exp(slope*(generation-1)))
  ingp <- 1-inp
  
  experience[["IngP"]] <- rep(ingp, niter)
  experience[["InP"]] <- rep(inp, niter)
  
  #debug
  print("slope inp ingp")
  print(slope)
  print(inp)
  print(ingp)
  
  return(experience)
}

update_speaker <- function(speaker, lambda, iter, token, style){
  # this function updates a learner with input
  #speaker is basically experience  
  other_token <- c(In = "Ing", Ing = "In")
  other <- other_token[token]
  
  #expectation is a style value    
  previous_expectation <- speaker[[token]][iter-1]
  
  #If its closer than 1 unit to the expectation than dist = 1
  dist    <- max(1, abs(style-previous_expectation))
  
  #weight is smaller at larger distances from the expectation
  weight  <- lambda * (1/(dist^2))
  
  #check this update with Joe  
  new_expectation <- (previous_expectation * (1-weight)) + (style * weight)
  
  speaker[[token]][iter]   <- new_expectation
  speaker[[other]][iter]   <- speaker[[other]][iter-1]
  speaker[["style"]][iter] <- style
  speaker[["token"]][iter] <- token
  
  return(speaker)
}

generate_from_speaker <- function(speaker, min = 0, max = 100, eps = 0.001){
  # this function generates a tokens from a mature speaker
  #Choose style to speak, which is an independent choice
  style <- runif(1, min, max)
  
  #Takes their last expectation for the style of each token
  In_expect  <- rev(speaker[["In"]])[1]
  Ing_expect <- rev(speaker[["Ing"]])[1]
  
  #eps is epsilon, the smallest value that something can take, as in clustering
  #algorithms
  In_dist  <- max(eps, abs(style - In_expect))
  Ing_dist <- max(eps, abs(style - Ing_expect))
  
  In_weight  <- 1/(In_dist^2)
  Ing_weight <- 1/(Ing_dist^2)
  
  In_prob  <- In_weight /(In_weight+Ing_weight)
  Ing_prob <- Ing_weight/(In_weight+Ing_weight)
  
  #For the competing grammars/replacement scenario, these probabilities must be
  #multipled by the overall prob of producing the given variant in that
  #generation
  
  In_combined <- In_prob*speaker[["InP"]][1]
  Ing_combined <- Ing_prob*speaker[["IngP"]][1]
  
  #this might be a silly way of doing this, but I assume that if neither In nor
  #Ing are selected on the basis of the probabilities above, then the speaker
  #has chosen something ineffable and must try again
  
  token <- sample(c("In","Ing"), size=1, prob=c(In_combined,Ing_combined))
  
  return(list(style = style, token = token))
}

#initializing old speaker. these will be the style values for generation 0.

#old_speaker should have SAME STYLE for in/ing, to model first generation after
#doublet is innovated
old_speaker <- list(In    = 50,
                    Ing   = 50,
                    token = NA,
                    style = NA,
                    InP = 0.5,
                    IngP = 0.5)

ngenerations <- 30
niter <- 1000
lambda <- 0.3

generations <- vector(length = ngenerations, mode = "list")


for(gen in 1:ngenerations){
  new_speaker <- generate_new_speaker(niter = niter, generation=gen)
  for(iter in 2:niter){
    obs <- generate_from_speaker(old_speaker)
    #obs is a token and its associated style    
    token <- obs[["token"]]
    style <- obs[["style"]]
    
    new_speaker <- update_speaker(new_speaker, lambda=lambda, iter=iter, token=token, style=style)
  }
  generations[[gen]] <- as.data.frame(new_speaker)
  old_speaker <- new_speaker
}


generations.df <- rbind.fill(generations)

generations.df.melt <- melt(generations.df, value.name = "Estimate", id.vars = c("token", "style", "iter", "generation", "InP", "IngP"), variable.name = "variant", na.rm = TRUE, measure.vars = c("In", "Ing"))

pdf("1000iterPerGen_replace.pdf")

ggplot(generations.df.melt, aes(x = iter, y = Estimate, color=variant, group=variant))+
  geom_step()+
  facet_wrap(~generation)+
  ylim(0,100)

#ggplot(generations.df, aes(iter, Ing))+
#  geom_step()+
#  facet_wrap(~generation)+
#  ylim(50,100)

ggplot(generations.df.melt, aes(generation, InP))+
  geom_line()+
  ylim(0,1)

dev.off()

ggplot(subset(generations.df, !is.na(style)), aes(style, fill = token))+
  stat_density(color = "black", position = "fill")+
  facet_wrap(~generation)

dev.off()


#Reinitializing old speaker for new run. These will be the style values for generation 0.

#old_speaker should have SAME STYLE for in/ing, to model first generation after
#doublet is innovated
old_speaker <- list(In    = 50,
                    Ing   = 50,
                    token = NA,
                    style = NA,
                    InP = 0.5,
                    IngP = 0.5)

ngenerations <- 30
niter <- 20000
lambda <- 0.3

generations <- vector(length = ngenerations, mode = "list")


for(gen in 1:ngenerations){
  new_speaker <- generate_new_speaker(niter = niter, generation=gen)
  for(iter in 2:niter){
    obs <- generate_from_speaker(old_speaker)
    #obs is a token and its associated style    
    token <- obs[["token"]]
    style <- obs[["style"]]
    
    new_speaker <- update_speaker(new_speaker, lambda=lambda, iter=iter, token=token, style=style)
  }
  generations[[gen]] <- as.data.frame(new_speaker)
  old_speaker <- new_speaker
}


generations.df <- rbind.fill(generations)

generations.df.melt <- melt(generations.df, value.name = "Estimate", id.vars = c("token", "style", "iter", "generation", "InP", "IngP"), variable.name = "variant", na.rm = TRUE, measure.vars = c("In", "Ing"))

pdf("20000iterPerGen_repl.pdf")

ggplot(generations.df.melt, aes(x = iter, y = Estimate, color=variant, group=variant))+
  geom_step()+
  facet_wrap(~generation)+
  ylim(0,100)

#ggplot(generations.df, aes(iter, Ing))+
#  geom_step()+
#  facet_wrap(~generation)+
#  ylim(50,100)

ggplot(subset(generations.df, !is.na(style)), aes(style, fill = token))+
  stat_density(color = "black", position = "fill")+
  facet_wrap(~generation)

ggplot(generations.df.melt, aes(generation, InP))+
  geom_line()+
  ylim(0,1)

dev.off()