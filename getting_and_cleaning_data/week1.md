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
