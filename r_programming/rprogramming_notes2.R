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
    # Lazy evaluation: arguments to functions are evaluated lazily, so they are evaluated only as needed
    f <- function (a,b) {
        print(a) # This is printed first
        print(b) # This generates an error but only after a is printed
    }
    f(45)

    # The ... argument indicate a variable number of arguments that are usually passed on to other functions.
    # It is often used when extending another function and you don't want to copy the entire argument list of the original function
    my_plot <- function(x, y, type = "l", ...) {
        plot(x, y, type = type, ...)
    }
    # Generics function use ... so that extra arguments can be passed to methods
    # The ... argument is also necessary when the number of arguments passed to the function cannot be known in advance.
    # An example of this is the paste function, that concatenates multiple strings.
    # Any argument after the ... must be named explicitly not even with partial matching

# Scoping Rules - Symbol Binding
    lm <- function (x) {
        x * x
    }
    lm
    # Which one is going to print? The predefined linear model function, or the just defined lm function?
    # R binds a value to a symbol (the function to lm). Each symbol has a different environment. You can access the environments using search()
    search()
    # R normally first look in the global environment if there is no match in the global environment, it will check the search list.
    # The global environment is the same as the user workspace.
    # When you load a package with the library() command, this gets put in the second position in the list provided by search()
    # R has separate namespaces for functions and non functions. So you can have the number "c" and the function "c". But they cannot be both present in the same environment.
    # Scoping rules: R uses lexical scoping or static scoping. An alternative would have been to use dynamic scoping.
    # a free variable is a variable not defined in a function but used by it. This variable has a symbol (its name) that could be defined in any environment.
    # R looks for that symbol in the function first, then in the environment in which the function is defined, then in the parent environment.
    # It continues searching up to the top-level environment. At that point starts searching down the search() list, until the empty environment is hit.
    # If it cannot find anything, then it throws an error.
    f <- function(x,y) {
        x^2 + y / z # z here would be the free variable
    }
    # Every environment has a parent environment and can have multiple children. The only environment without a parent environment is the empty environment.
    # A function and an environment = a closure, or function closure

# Scoping Rules - R Scoping Rules
    # Normally a function is defined in the global environment, so that the user variables are just found in the user's workspace
    # However, in R you can nest function, defining one inside another
    make.power <-function(n) {
        pow <- function(x){
            x^n
        }
    }
    cube <- make.power(3)
    square <- make.power(2)
    cube(3)
    square(2)
    cube
    # by calling the ls function you will know what is in there. It stands for list objects
    ls(environment(cube))
    get("n", environment(cube))
    # Lexical scoping (R) looks at the environment in which the function is defined. Dynamic scoping looks at the environment from which the function is called.
    # Lexical scoping is the reason why in the R programming language we have to keep stuff in memory to operate on them.

# Scoping Rules - Optimization Example
    a <- c(1:20)
    optim(make.power(a)) # alternatives are nlm() and optimize()

# Coding Standards
    # Write your code in a text editor and save it in a text file.
    # Indent your code
    # Limit the width of your code
    # Limit the length of your function
    # addittion - self describing naming

# Dates and times in R
    # R has a Date class
    as.Date("2016-02-28")
    # Times are representd with the POSIXct and POSIXlt classes
        # POSIXct are ust very large integer
        a <- as.POSIXct("2016-02-28 22:00:00 UTC")
        unclass(a)
        # POSIXlt are list that save some useful metadata (DOW etc.)
        b <- as.POSIXlt("2016-02-28 11:00:00 GMT")
        unclass(b)
    # Dates are stored internally as the number of days since 1970-01-01
    # Times are sotred internally as the number of seconds since 1970-01-01
    # You may have a weirdly formatted time. To standardize it, use strptime()
        datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
        strptime(datestring, "%B %d, %Y %H:%M")
        class(strptime(datestring, "%B %d, %Y %H:%M"))
# Swirl 8
    TRUE & c(TRUE, FALSE) # recycle left TRUE
    TRUE && c(TRUE, FALSE) # evaluate only first element vector
