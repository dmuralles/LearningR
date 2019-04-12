## Learning dplyr

rm(list=ls())
install.packages("tidyverse")

library(dplyr) #when you load dplyr
#objects are masked
library(ggplot2)

gapminder <-read.csv("data/gapminder_data.csv")
str(gapminder)

#we can trim our dataset by selecting specific columns
year_country_gdp <- gapminder %>% select(year,country,gdpPercap) #this is the tidyverse version of a pipe
str(year_country_gdp)

#we can select specific rows as well with filter function
year_country_gdp_euro <-gapminder %>% 
  filter(continent=="Europe") %>% #note double equals
  select(year,country,gdpPercap)
str(year_country_gdp_euro)

#notice the country factor w/142 levels, factors keep their identity

#using dplyr for grouping variables
gdp_by_continent <- gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdp = mean(gdpPercap))
gdp_by_continent

#challenge 2 - calculate the average life expectancy per country.
lifeExp_by_country <- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp = mean(lifeExp))
lifeExp_by_country
tail (lifeExp_by_country)
head(lifeExp_by_country)

#select is for columns, filters is for rows

#what would be better is max - this is step one.
lifeExp_by_country$mean_lifeExp
max(lifeExp_by_country$mean_lifeExp)

#this gives us a number only but no column association
lifeExp_by_country %>% 
  filter(mean_lifeExp == max(mean_lifeExp))
#the == equals it is exactly equal to
lifeExp_by_country %>% 
  filter(mean_lifeExp == min(mean_lifeExp))

#to include both results in the same table use the vertical bar |
lifeExp_by_country %>% 
  filter(mean_lifeExp == max(mean_lifeExp) | 
           mean_lifeExp == min(mean_lifeExp))

#integrating ggplot and dplyr
gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp =mean(lifeExp)) %>% 
  ggplot(aes(x=country, y=mean_lifeExp)) + geom_boxplot()

#can do other stuff with it too