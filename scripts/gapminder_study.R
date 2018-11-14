rm(list = ls())
library(tidyverse)

gapminder <- readr::read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv')
View(gapminder)

head(gapminder, 20) # show the first 20 rows
tail(gapminder, 20) # bottom 20 records

str(gapminder)
names(gapminder)
dim(gapminder)
ncol(gapminder)
nrow(gapminder)

#install.packages("skimr")
library(skimr)
skim(gapminder)

gapminder$lifeExp # very long! hard to make sense of...

head(gapminder$lifeExp) # can do the same tests we tried before
str(gapminder$lifeExp) # it is a single numeric vector
summary(gapminder$lifeExp) # same information, formatted slightly differently

#Subsetting Rows
filter(gapminder, lifeExp < 29)
filter(gapminder, country == "Mexico")
filter(gapminder, country %in% c("Mexico","Peru"))
filter(gapminder, country == "Mexico", year==2002)
#Mean Life Exptancy in Sweden
x <- filter(gapminder, country == "Sweden")
mean(x$lifeExp)

#Subsetting Columns 
select(gapminder, year, lifeExp)
select(gapminder, -continent, -lifeExp)

gap_cambodia <- filter(gapminder, country =="Cambodia")
gap_cambodia2 <- select(gap_cambodia, -continent, -lifeExp)
