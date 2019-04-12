#episode8 creating publication-quality graphics with ggplot2
#initiate ggplot2
library(ggplot2)
#data subsetting - reviewed middle rows and etc's
gapminder[1,1]
head(gapminder)
tail(gapminder)
gapminder[500:505, ]

#creating a ggplot function
#adding aesthetic plot properties for gdp vs lifeExp
#baseplot, foundation of the plot, dataset and the space
ggplot(gapminder, mapping=aes(x=year, y=lifeExp)) +
  geom_point() + geom_point(colour="green")

#aesthetic property of color
#modify code to color the points by continent column
#the difference between what I did below to above is that the continent
#variable is defining its own color, i.e. color by continent


ggplot(gapminder, mapping=aes(x=year, y=lifeExp, color=continent)) +
  geom_point()

#other kinds of plots with 
ggplot(gapminder, mapping=aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line()

#line plot for each continent instead of each country
ggplot(gapminder, mapping=aes(x=year, y=lifeExp, by=continent, color=continent)) +
  geom_line() + #scatterplot layer
  geom_point() #line plot

#trying different plots
ggplot(gapminder, mapping=aes(x=year, y=lifeExp, color=continent)) +
  geom_line() + #line layer
  geom_point() + #scatterplot
  theme_bw() #bw color of the entire plot, remember gray background
  
#rules for all the plots using the same plotted data
#adding color to all lines
ggplot(gapminder, mapping=aes(x=year, y=lifeExp, by=country)) +
  geom_point() + #scatterplot
  geom_line(col="blue") #line layer

#Transportation and Statistics
#overlay statistical models over data
#going to change scale of unites on x-axis
#going to use log 10 function to apply transformation to values of gdpPerCap column

ggplot(gapminder, mapping=aes(x=gdpPercap, y=lifeExp, color =continent)) +
  geom_point(alpha = .3) + #changed transparency of points to 50%
  scale_x_log10() 

#changing transperancy by continent
ggplot(gapminder, mapping=aes(x=gdpPercap, y=lifeExp, color =continent)) +
  geom_point (aes(alpha=continent)) + #changed transparency of points to 50%
  scale_x_log10()

#data trends
#aes aesthetic properties continued

ggplot(gapminder, mapping=aes(x=gdpPercap, y=lifeExp)) +
  geom_point() + 
  scale_x_log10() +
  geom_smooth(method="lm", color ="red", size=1.5) #geom smooth layer - linear model

#challenge 4a, modify color and size of points on the point layer
ggplot(gapminder, mapping=aes(x=gdpPercap, y=lifeExp)) +
  geom_point (aes(shape=continent),color ="blue", size=1) + 
  scale_x_log10() +
  geom_smooth(method="lm", color ="red", size=1.5)

#Multi-panel Figures
#use substr function to pull out part of character string
starts.with <-substr(gapminder$country, start=1, stop=1)

#operator %n% allows sus to make multiple comparisons
#should feel similar to the piping of bash git
#creating a new subset called az.countries
#countries that start with a and start with z
az.countries <- gapminder[starts.with %in% c("A", "Z"),]
View(az.countries)

#initiate ggplot
#adding line plot layer
#facet wrap took the above formula as its argument, denoted by ~
#this tells R to draw panel for each unique value
#in country column of gapminder dataset

ggplot(data=az.countries, aes(x=year, y=lifeExp, color=continent)) +
  geom_line()+
  facet_wrap( ~ country) #facet wrap
