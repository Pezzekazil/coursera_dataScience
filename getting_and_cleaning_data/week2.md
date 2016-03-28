# Week 2  
## Reading from MySQL  

## Reading from HDF5  

* Used for storing large data sets  
* Heirarchical data format: data is stored in groups  
* groups contain zero or more data sets and metadata  
  * Have a group header with group name and list of attributes  
  * Have a group symbol table with a list of objects in group  
* datasets multidimensional array of data elements with metadata  
  * Have a header with name, datatype, dataspace, and storage layaut  
  * Have a data array with the data  

To lead the R HDF5 package we can use the following commands:  

```
  source("http://bioconductor.org/biocLite.R")
  biocLite("rhdf5")
  library(rhdf5)
  created <- h5createFile("example.h5")
  created
```  

You can then create groups within the file using the following commands:  

```
  created <- h5createGroup("example.h5","foo")
  created <- h5createGroup("example.h5", "baa")
  created <- h5createGroup("example.h5", "foo/foobaa")
  h5ls("example.h5") #This is the same as ls in UNIX
```  
Furthermore, we can write to an HDF5 file with the following commands:  

```
  A <- matrix(1:10,nr=5,nc=2)
  h5write(A, "example.h5", "foo/A")
  B <- array(seq(0.1,2.0, by=0.1), dim=c(5,2,2))
  attr(B, "scale") <- "liter"
  h5write(B, "example.h5", "foo/foobaa/B")
  h5ls("example.h5)
```  

With the same command you can also write a data.frame into an HDF5 file. In order to retrieve that information, you can use the following command:  

```
  readA <- hd5read("example.h5", "foo/A")
  readB <- hd5read("example.h5", "foo/A")
  readA
```   

Finally, we can write and read in chunks by specifying the index parameter:  

```
  h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3,1))
```  

## Reading data from the web  

Webscraping: Programatically wxtracting data from the HTML code of websites.  
The first thing you need to do to scrape data from internet is to collect the HTML code of a webpage. The fellowing code will do exactly that:  

```
  con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
  htmlCode <- readLines(con)
  close(con)
  htmlCode
```  

To read the output of this operation you can use the XML package as seen in previous lectures with the htmlTreeParse(url, useInternalNodes=T) function. An alternative to the XML package is the httr package. Example code follows:  

```
  library(httr); html2 <- GET(url)
  content2 <- content(html2, as="text")
  parsedHtml <- htmlParse(content2, asText=TRUE)
  xpathSApply(parsedHtml, "//title", xmlValue)
```  

If a website requires authentification, it is possible to use the httr package again:  

```
  pg2 <- GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user", "passwd"))
  pg2
```  

However, if you use the parameter handle in the GET request, you can authenticate only once and save this parameters:  

```
  google <- handle("http://google.com")
  pg1 <- GET(handle=google, path="/")
  pg2 <- GET(handle=google, path="search")
```  

## Reading From APIs  
API stands for "Application programming interface". Here an exmple with the Twitter API is provided. This requires an OAuth2.0 authentification. The code is below:  

```
  myapp <- oauth_app("twitter", key="myConsumerKeyHere", secret="myConsumerSecretHere")
  sig <- sign_oauth1.0(myapp, token="myTokenHere", token_secret="myTokenSecretHere")
  homeTL <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
```  

The URL used in the example above is defined in the developer space of the twitter website. For different APIs there are different URLs.  

## Reading from other sources  
* file() - opens a connection to a text file  
* url() - opens a connection to a url  
* gzfile() - opens a connection to a .gz file  
* bzfile() - opens a connection to a .bz file  
