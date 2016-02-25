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
  #seq_along take the length of the parameter and generate a seqence from 1 to that number
  for (i in seq_along(x)) { 
    print (x[i])
  }
  for(letter in x) {
    print(letter)
  }
  # for loops can be nested. seq_len() is useful as well as nrow() and ncol().
  
# Control Structures: while-loop
  


# Swirl 8
TRUE & c(TRUE, FALSE) # recycle left TRUE
TRUE && c(TRUE, FALSE) # evaluate only first element vector
