# this is a vector
a <- c(1:23)
b <- list(1:23, 'Pippo')
c <- matrix(1:15,5,3)
# declares an empty vector
d <- vector()
e <- attributes(c)
cbind(c(1:10),c(11:20))
rbind(c(1:10), c(11:20))
f <- vector("numeric", length=10)
class (f) # returns the class of an object
as.numeric() # 64 bits, aka 8 bytes
as.logical(f)
as.character(f)
as.integer(f)
as.complex(f)

# factors: are used for categorical variables
g <- factor(c('yes','no', 'yes', 'maybe'))
table(g)
unclass(g)

# Missing Values
h <- c(NaN, NA, 2)
is.na(h)
is.nan(h)

# Data Frames: normally created through read.table() and read.csv(), they are a collection of vectors
# They have row names. If not specified these are numbers. To see them, access the attribute row.names
i <- data.frame('col1' = c(1:10), 'col2' = c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'l'))
nrow(i)
ncol(i)

# Names: each object (vector,list,matrix,dataframes) have names
names(i)
row.names(i)
names(i) <- c('foo1', 'foo2')
dimnames(c) # only valid for matrix

# Reading tabular data
read.table('filepath'
           , header = TRUE
           , sep = ','
           , colClasses = c('numeric', 'character', 'numeric', 'complex')
           , nrows = 20
           , skip = 2) # will store the data in RAM
# colClasses is super important because it makes read.table much faster
read.csv() # is a read.table with separator = ',' and headers = TRUE by default
readLines() # reads lines from a text file
source() # Reads R code contained into a file and executes it. It is the inverse of dump()
dget() # Reads R code from a file. It is the inverse of dput()
load() # reads the binary from a saved workspace
unserialize() # reads single binary objects into R

# Reading large tables
test <- read.table('somefile', nrows = 100)
classes <- sapply(test, class) # it is the respective of map in R. Will apply the function class to the test object
dataset1 <- read.table('somefile',
                       colClasses = classes)

# Textual data formats - in line with unix philosophy, but not space efficient
write.table()
writeLines()
# dump and dput contain metadata. 
# 1 it tells what the class of the different colums are 
# 2 the resulting textual format is edit-able and in case of curruption, potentially recoverable
dump() # multiple objects at the time
dput() # one object at the time
save()
serialize()

#Interfaces to the outside world
file() # connection to file. Often called by another function (read.table())
gzfile() # connection to file compressed with gzip
bzfile() # connection to file compressed with bzip2
url() # connection to webpage. It returns normally the HTML code in the webpage
close(connectionName) # closes a connection

# subset basics
# a single [ returns an object of the same class of the object subset
# a double [[ is used to subset a list or a dataframe. It returns a single object not necessarily of the same class of the object subst
# a $ sign is used to subset a list or a dataframe using a name. Works similarly to the double [[
l <- c("a", "b", "c", "d", "e", "f", "a")
l[1]
l[2]
l[2:3]
l[l>"a" & l < "e"]
u <- l > "a" & l < "e"
u
l[u]

# subsetting lists
m = list(foo = 1:4, bar = 0.6, baz = "a")
name <- "bar"
m[1]
m[[1]]
class(m[1])
class(m[[1]])
m$bar
m["bar"]
m[["bar"]]
class(m$bar)
class(m["bar"])
class(m[["bar"]])
m[c(1,3)]
m[[name]]
m[[1]][[3]]
m[[c(1,3)]]

# Subsetting Matrix
n <- matrix(1:6,2,3)
n
n[1,2]
n[2,1]
n[2,1, drop = FALSE] # returns a matrix because doesn't drop one dimension
n[1,]
n[1, , drop = FALSE]

# Partial Matching
o <- list(pippo = 1:5)
o$p # matches pippo with the first letter only
o[["p"]] # Returns null: double brackets does not support partial matching like this
o[["p", exact = FALSE]]

# Removing missing values
p <- c(1,2,NA,4,NA,5)
bad <- is.na(p)
p[!bad]
q <- c("a", NA, "b", "c", NA, "d")
r <- complete.cases(p,q) # if we want multiple obects to be complete simultaneusly
# complete.cases can be used with a data.frame as a parameter and will immediately get only rows with complete cases
p[r]
q[r]

# Vectorized Operations
s <- c(1:3)
t <- c(10:12)
s+t

# Extras from Swirl 1
sqrt() # computes the square root of the argument
getwd() # returns the current working directory

# Extras from Swirl 2
ls() # lists all the obects saved in the workspace
list.files() # lists the files in a folder. By default lists working directory files
dir() # lists the files in a folder. By default lists working directory files
dir.create() # creates a directory in the current working directory
setwd() # set the working directory
file.exists() # Returns boolean for file existing
file.info() # gives info about the file size, date of creation and modification
file.rename() # renames a file into something else
file.remove() # removes a file
file.copy() # creates a copy of a file
file.path() # builds a file path from a set of strings. This will be system independent, so they know which kind of /|\ to use.
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE) # creates directories up to the most nested one
unlink() # removes a directory. Has this name because of historical UNIX history

# Extraas from Swirl 3
1:20 # gives to us a sequence from 1 to 20
15:1 # gives us a reverse ordered sequence
seq(1,20) # is the same as 1:20
seq(1,10, by=0.5) # now the step is set to 0.5
my_seq <- seq(5,10, length = 30)
seq(along.with = my_seq) # creates a sequence starting from 1 long as much as my_seq
seq_along(my_seq) # same as above
rep(0, times=40) # creates a vector with 40 zeros
rep(c(0,1,2), times = 10) # creates a vector with 10 times the sequence 0,1,2
rep(c(0,1,2), each = 10)

# Extras from Swirl 4
paste(c("a", "b", "c"), collapse = " ") # returns all the elements of the vector with a space in between them. Class() = Char
paste("Hello", "World!", sep = " ") # in case you don't want to use a vector (?)

# Extras from Swirl 5
sample(c(1,2,3,4,5), 2) # takes a sample of size 2 from the vector in the argument
Inf # in R this represents infinity

# Extras from Swirl 6
x[-2] # returns all the elements of x except the second one
identical(x,y) # returns TRUE if the arguments are identical

# Extras from Swirl 7
attributes() # Shows all the attributes of an object