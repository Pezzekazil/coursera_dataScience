library("swirl")

# Control Structure: Introduction
  # If, else: testing a condition
  # for: execute a loop a fixed number of times
  # while: execute a loop while a condition is true
  # repeat: execute an infinite loop
  # break: break the execution of a loop
  # next skip an iteration of a loop
  # return: exit a function

# Control Structures: if-else
  if (x > 3) {
    y <- 10
  } else if (x < 2) {
    y <- 5
  } else {
    y <- 0
  }
  
# Control Structures: for-loop
  for (i in 1:10) {
    print(i)
  }
  
  x <- c("a", "b", "c", "d")
  for (i in 1:4) {
    print(x[i])
  }
  # seq_along take the length of the parameter and generate a seqence from 1 to that number
  for (i in seq_along(x)) { 
    print (x[i])
  }
  for(letter in x) {
    print(letter)
  }
  # for loops can be nested. seq_len() is useful as well as nrow() and ncol().
  
# Control Structures: while-loop
  count <- 0
  while (count<10) {
    print(count)
    count <- count + 1
  }

# Control Structures: Repeat, Next, Break
  x0 <- 1
  tol <- 1e-8
  
  repeat{
    x1 <- computeEstimate() # this is not a real function
    if(abs(x1-x0) < tol) {
      break
    } else {
      x0 <- x1
    }
  }

  for (i in 1:100) {
    if (i <= 20) {
      ## skip the first 20 iteratioins
      next
    }
    ## do something here
  }
  
  # "return" signals that a function should exit and return a given value
  # control structures are good for more sophisticated programs, but for command line the *apply functions are better for iterating
  
# Your first R function
  add2 <- function(x,y) {
    x + y # the function returns whatever the last expression was
  }
  
  above10 <- function(x) {
    use <- x > 10
    x[use]
  }
  
  above <- function(x, n = 10) { # = 10 sets a default value for n, which you can overwrite
    use <- x > n
    x[use]
  }
  
  colummean <- function(y, removeNA = TRUE) {
    nc <- ncol(y)
    means <- numeric(nc)
    for(i in 1:nc) {
      means[i] <- mean(y[,i], na.rm = removeNA) # skips NAs from computation of mean
    }
    means
  }
  
# Functions (part 1)
  # Argument matching: if an argument has a long name, you can call a short version of that name and R will match it for you
  # R checks for exact match, partial match, and then positional match

# Functions (part 2)
  
  
# Swirl 8
TRUE & c(TRUE, FALSE) # recycle left TRUE
TRUE && c(TRUE, FALSE) # evaluate only first element vector
