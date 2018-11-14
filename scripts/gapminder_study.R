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

# Pipe Operators %>% 
gapminder %>% head(10)

gap_cambodia <- gapminder %>% filter(country == "Cambodia") %>% 
  select(-continent, -lifeExp)
gap_cambodia

#adding columns using mutate function 
gapminder %>% mutate(index=1:nrow(gapminder))

gapminder %>% 
  mutate(gdp=pop*gdpPercap)

gap_Egypt <- gapminder %>% 
  filter(country == "Egypt")

max(gap_Egypt$gdpPercap)

gapminder %>% 
  filter(country == "Egypt") %>% 
  mutate(gdp=pop*gdpPercap, maxgdp_Egypt = max(gdp))

gapminder %>% 
  filter(country == "Vietnam") %>% 
  mutate(gdp=pop*gdpPercap, maxgdp_Viet = max(gdp))

gapminder %>% 
  filter(country == "Egypt") %>% 
  mutate(gdp=pop*gdpPercap, maxgdp_Egypt = max(gdp))

gap_EG_VT <- gapminder %>% 
  filter(country %in% c("Vietnam", "Egypt"))%>% 
  mutate(gdp=pop*gdpPercap, maxgdp = max(gdp), mingdp=min(gdp))
View(gap_EG_VT)
