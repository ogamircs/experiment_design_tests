library(dplyr)

df = data.frame(matrix(rnorm(20), nrow=1000000),matrix(rnorm(20), nrow=1000000))
colnames(df) <- c("X1", "X2")

# Start the clock!
ptm <- proc.time()

df <- mutate(df, g = ifelse(X1<0, 0,1) )

# Stop the clock
proc.time() - ptm

df = data.frame(matrix(rnorm(20), nrow=1000000),matrix(rnorm(20), nrow=1000000))
colnames(df) <- c("X1", "X2")

myfunction <- function(c){
  if(as.numeric(c)<0){return(0)} else {return(1)}
}

# Start the clock!
ptm <- proc.time()

df <- mutate(df, g = as.numeric(myfunction(X1)) )

# Stop the clock
proc.time() - ptm
