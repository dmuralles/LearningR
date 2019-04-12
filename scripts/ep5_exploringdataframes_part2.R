#read gapminder data set
gapminder <- read.csv("data/gapminder_data.csv")
view(gapminder)
View(gapminder)
#this tells me what the structure of each column is
str(gapminder)

#summary of table - should align with what we already know, a check
#valuable stats
summary(gapminder)

min(gapminder$year)
max(gapminder$year)

#summary of gapminder, by country column
summary(gapminder$country)

#object Type 
#what is the object type in the year, country,etc columns?
typeof(gapminder$year)
typeof(gapminder$country)

#dimensions of data set (number of columns)
length(gapminder)

#thought experiment
A= c(3,2,1)
A
length (A)
A <- c(3,2,1)
# moving on

#dimensions
dim(gapminder)

#how do you preview the last few lines of gapminderf?
tail(gapminder, n=3)

#viewing the  lines in the middle of the data file, use brackets
gapminder[850:870,]
dim(gapminder[850:870,])

#Challenge 3
#a factor is a something that is listed, a non-numerical number or integral
#a list is a series of factors
#an integer - whole number
#a numeric has decimals...










str(gapminder)
