# lappy
	# Loops are very powerful but not easy to manage when using the command line
	# this is why there are functions like lapply or sapply. We now focus on the lapply function
	x <- list(a=1:5, b=rnorm(10))
	lapply(x,mean)
  
	# The result of lapply is always going to be a list
	x <- 1:4
	lapply(x, runif, min = 0, max = 10)
	
	# Summarising, lapply() takes three parameters: 
	# The first one is the object to iterate on,
	# The second one is the name of the function to apply to each element of the object
	# The third (and after) one is any paramenter of the function we are applying, and we may or may not set these
	
	# lapply() and similar work very well with anonymus functions.
	# anonymus functions are functions without a name, used in a restricted scope (for instance, inside another function)
	x <- list(a=matrix(1:4,2,2), b=matrix(1:6,3,2))
  lapply(x, function(elt) elt[,1])
  # as you can see, here the function in question has no name, takes one parameter, and returns the first column of that parameter
  
  # sapply() is the same as lapply(), but it tries to simplify the result:
  # so, if the result would be a list with elements all of length 1, sapply will return a vector instead
  lapply(x, mean)
  sapply(x, mean)
  class(lapply(x, mean))
  class(sapply(x, mean))

# apply
  # The apply function takes four parameters: 
  # array (vector with dimensions e.g. matrix), dimension(s) to maintain, function, and function parameters.
  # The dimension to maintain works like a group by in SQL: will aaply the function over windows equal to the dimensions to maintain.
  x <- matrix(rnorm(20*10), 20, 10)
  # takes the mean of each column, and the matrix has 10 colums
  apply(x, 2, mean)
  # takes the mean of each row, and the matrix has 20 rows
  apply(x, 1, mean)
  
  # You can use functions that require parameters
  apply(x, 1, quantile, prob = c(0.25, 0.75))
  
  # You can use an array with more than two dimensions as well
  x <- array(rnorm(2*2*10), c(2,2,10))
  apply(x, c(1,2), mean)
  
  # Some of the uses of apply() are so common that there are specific functions
  # rowSums = apply(x, 1, sum)
  # rowMeans = apply(x, 1, mean)
  # columnSums = apply(x, 2, sum)
  # columnMeans = apply(x, 2, mean)
  
# mapply
  # With the other functions of the apply family you apply one function over the elements of one object.
  # With mapply(), you apply one function over the elements of multiple objects
  # mapply() takes the following parameters
  # FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE
  # where ... contains the arguments to apply over
  x <- list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
  y <- mapply(rep, 1:4, 4:1)
  # It is particularly useful when you have functions that do not allow vector input.
  
# tapply
  # The tapply function allows you to apply a function aggregating based on cathegories assigned by a vector
  # The parameters are X, INDEX, FUN = NULL, ..., simplify = TRUE
  x <- c(rnorm(100), runif(100), rnorm(100,1))
  f <- gl(3,100)
  tapply(x,f,mean)
  
# Split
  # The split() function is similar to the tapply. It splits an object according to a factor, but doesn't apply a function.
  # It takes two parameters: object and factor
  x <- c(rnorm(10), runif(10), rnorm(10,4))
  f <- gl(3,10)
  split(x,f)
  
  # split can also be used in conjunction with lapply() and sapply()
  s <- split(airquality, airquality$Month)
  lapply(s, function(x) colMeans(x[,c('Ozone', 'Solar.R', 'Wind')]))
  sapply(s, function(x) colMeans(x[,c('Ozone', 'Solar.R', 'Wind')], na.rm = TRUE))
  
  # In case we need to split according to multiple factors, then we can use interactions()
  x <- rnorm(10)
  f1 <- gl(2,5)
  f2 <- gl(5,2)
  interaction(f1,f2)
  
  # If we use split, we don't necessarily need the interaction function, we can write it like:
  str(split(x, list(f1,f2)))
  str(split(x, list(f1,f2), drop=TRUE))
  
# Debugging Tools: diagnosing the problem
# Debugging Tools: Basic Tools
  # The traceback function prints out the function call stack after an error occurs; does nothing if there's no error
  # The debug function allows you to step through execution of a function
  # The browser function suspends the execution of a function wherever it is called and puts the function in debug mode
  # The trace function allows you to insert debugging code into a function a specific places
  # The recover function allows you to modify the error behavor so that you can browse the function call stack
  
  
  
  
  
  
  
  