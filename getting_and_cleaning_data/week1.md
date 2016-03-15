#Week 1
##Obtaining Data Motivation
This course covers the basic ideas behind getting data ready for analysis.  
1. Finding and extracting raw data  
2. Tidy data principles  
3. Practical implementation through R  
We wish to have data in a tabular format, where one row corresponds to one observation.  
However, normally data comes in the form of text files, json, or maybe it is already structured but in multiple DBRMS.  

##Raw and processed data
Data are values of qualitative or quantitative variables, belonging to a set of items.  

1. Raw data  
  * Original source of data  
  * Hard to use for data analysis  
  * Data analysis includes processing  
  * Raw data may only need to be processed once  
2. Processed data  
  * Data that is ready for analysis  
  * Processing can include merging, subsetting, transforming  
  * There may be standards for processing  
  * All steps should be recorded  

##Components of tidy data
You should have:  
1. Row data  
2. Tidy data set  
3. A code book describing each variable and its values in the tidy data set (metadata)  
4. An explicit and exact recipe you used to go from 1 -> 2,3  

Data is raw (for you)  when:  
1. You didn't run any software on the data  
2. You didn't manipulate any number in the data  
3. You did not remove any data from the data set  
4. You did not summarize the data in any way  

Tidy data normally have:  
1. Each variable you measure should be in one column  
2. Each different observation of that variable should be in a different row  
3. There should be a table for each kind of variable  
4. If you have multimple tables, they should include a column in the table that allows them to be linked  

The code book contains:  
1. information about the variables  
2. Information about the summary choices you made  
3. Information about the experimental study design you used  
4. Should contain a study design that has a through description of how you collected the data  
5. Shoulc have a section called "code book" that describes each variable and its units  

Noramlly we want:  
1. A script in a programming language like R or Python  
2. The input for the script is the raw data  
3. The output is the processed, tidy data  
4. There are no parameters to the script  

##Downloading files
This lecture is about how to download files with R  
You can use absolute and relative paths when getting or setting a working directory.  
In order to make the script independent from location, you can use the commands:  
1. `file.exist()`, which can check for directories existance as well  
2. `dir.create()`  
To download files we will use `download.file(url, destfile, method="curl")`.  
`list.files()` lists the files in a specific path.  
`date()` returns the data right now, and it is useful to keep track of the version of the file you downloaded.  

##Reading local Files
To perform this we use `read.table()`, but remember that this reads data into RAM, so large datasets may represent a challenge.
An alternative is to use read.csv, which sets `sep=",", header=TRUE`.  
An important parameter is `na.strings`, which explains to R which value in our dataset represent an NA.
Another important parameter is `quotes`, which allow you to specify which kind of quotation marks are quotation marks, " or '.  

##Reading Excel files  
There is a library called xlsx which provide functions like `read.xlsx()` and `read.xlsx2()`. It also has a function called `write.xlsx()`.  
An alternative is the XLConnect package. It is a little bit faster and easier to read files with.  

##Reading XML  
Widely used in internet application. It is the basis for most web scraping.  
It has two components:  
1. Markup - labels that give the text structure  
2. Content - the actual text of the document  

There are different elements of the markup part:  
1. Tags correspond to general labels  
  * Start tags `<section>`  
  * End tags `</section>`  
  * Empty tags `<line-break />  
2. Elements are specific examples of tags: e.g. `<greeting> Hello, world</greeting>`  
3. Attributes are components of the label:  
  * `<img src="jeff.jpg" alt="instructor"/>`  
  * `<step number="3"> Connect A to B. </step>`  

To interact with an XML file we can load the XML package. The most important function is `xmlTreeParse(url, useInternal=TRUE)` which allows us to import the XML code from an URL.The useInternal parameter recursively provides the nested data.  
Another useful function is `xmlRoot(xmlTreeParse())` which takes the metadata about the whole document and import it.
Then we can use `xmlName(xmlRoot())` to print out the name of the tag. `names(xmlRoot)` provides all the tag of the elements inside the root element.  

You can access elements of the root node in the same way in which you access lists in R (e.g. rootNode[[1]] or rootNode[[1]][[1]]).  
You can also use `xmlSApply(xmlObject, xmlValue)` which will go through the whole xmlObject recursively and extract the informations within it.  
There is a whole markup language called XPath that allows you to access XML objects easily. This can be passed as an argument to the `xpathSApply(rootNode), "//theNameOfATag", xmlValue)` function, and this will print all the content within the tags with the specified name.  

```r
	fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
	doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
	scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
	teams <- xpathSApply(doc,"//li[@class='team-name'], xmlValue)
	scores
	teams
```

##Reading JSON  
Json files are delimited by curly brakets and contain key:value pairs, separated by a colon. To access a Json file we use the jsonlite package. It has a function `fromJSON()` which imports json objects from files and allow to access the different key value pairs easily.  
You also have a `toJSON(data.frame, pretty=TRUE)` function, which allows to convert data fframes into json files.

##The data.table package  
Inherits from data.frame but it is written in C so it is much faster.  
The syntax for creation is similar however there are other differences.  
The `tables()` funtion shows all the data.table that are in memory.  
The subsetting syntax is the same as the data.frame. However, when you want to subset columns it is different: `DT[,c(2,3)]` does not return the second and third column, but a char vector with 2 and 3. What data.table is doing is trying to summariza the data based on the input after the comma (i.e. `c(2,3)`). We can pass functions in that part to obtain summarization of the data (e.g. `DT[,list(mean(x), sum(z))]` will print the mean of the variable x in the data.table DT and the sum of the variable z in the data.table DT.  
It is also possible to add new columns to the data.table with `DT[,newColumnName:=some-calculation]` (e.g. `DT[,w:=z^2]`).  
Furthermore, you can use expressions to perform multiple operations at the same time.  
1. `{print(10); 5}` is an expressio which returns the last element (i.e. 5)  
2. `k = {print(10); 5}` will print 10.  
3. `k` will print 5.  
4. `DT[,m:= {tmp <- (x+z); log2(tmp+5)}]` will add a new column to the data.table DT equal to the logarithm in base 2 of (x+z+5).
5. Another example is `DT[, a:=x>0]`, which adds a boolean column to the data.table ST
6. Finally, you can use similar functionalities of the `plyr()` function. For instance, `DT[,b:=mean(x+w), by=a] adds the column b to the data.table DT containing the mean of the variable (x+w) partitioned by a. It is similar to the windowed functions of SQL.  
7. `DT[, .N, by =x]` will provide a count of number of appearances of the different instances of the variable x.

It is possible to set the keys of a data.table. They are like SQL indexes and make any operation using that column for grouping, subsetting or joining much faster. To do so we use `setkey(DT,x)`.  
To join two data.tables, we set the key being equal to the variable we want to join on, and then we use the function `merge(DT1, DT2)`.  
To read a file in memory it is good to use `fread(file)`, since it is much faster than `read.table()`.  


