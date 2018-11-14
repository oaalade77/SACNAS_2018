rm(list = ls())

library(tidyverse)

#National Parks in California
ca <- read_csv("https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/ca.csv") 

#Acadia National Park
acadia <- read_csv("https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/acadia.csv")

#Southeast US National Parks
se <- read_csv("https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/se.csv")

#2016 Visitation for all Pacific West National Parks
visit_16 <- read_csv("https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/visit_16.csv")

#All Nationally designated sites in Massachusetts
mass <- read_csv("https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/mass.csv")

head(ca)

ggplot(data=ca) + 
  geom_point(aes(x=year, y = visitors, color = park_name)) + 
  labs( x = "Year",
        y = "visitation",
        title = "California National Park Visitation") +
  theme_bw() +
  theme(legend.title = element_blank())

ggplot(data = se) +
  geom_line(aes(x=year, y = visitors, color=state)) +
               labs(x = "Year",
                    y = "Visitation",
                    title = "SE States National Park") +
             theme_bw() +
             theme(legend.title = element_blank(),
             axis.text.x = element_text(angle = 0, hjust = 1, size = 11))  #hjust or vjust (justify) range between 0 and 1)
ggplot(data=se)+
  geom_point(aes(x=year, y=visitors, color = park_name))+
  facet_wrap(~state, scales = "fixed")

ggplot(data = se) + 
  geom_jitter(aes(x = park_name, y = visitors, color = park_name),
              width = 0.1,
              aplha = 0.1) + 
  coord_flip()+ 
  theme(legend.position ="none")

ggplot(data = se, aes(x = park_name, y = visitors)) + 
  geom_boxplot()+
  coord_flip() + 
  facet_wrap(~state, scales="fixed")

#****************************************
library(dplyr)
View(se)
se2<- se %>%
  group_by(year, park_name) %>%
  summarise(visitors = sum(visitors))
View(se2)




myplot <- ggplot(data = se, aes(x = year, y = visitors, color = park_name)) +
  geom_line()
myplot
ggsave("SE_Park_Visitation.png", myplot, width = 15, height = 10)

# Pipe Operators %>% 
gapminder
cat1 <- c("high", "low", "high", "high", "high", "low", "low", "low", "high", "low", "low")
cat2 <- c("1-young", "3-old", "2-middle-aged", "3-old", "2-middle-aged", "2-middle-aged", "1-young", "1-young", "3-old", "3-old", "1-young")
df <- as.data.frame(cbind(cat1, cat2))

library(plyr)
count1 <- count(df, vars=c("cat1", "cat2"))
count2 <- count(df, "cat2")
count1$totals <- count2$freq
count1$pct <- count1$freq / count1$totals

ggplot(data = count1, aes(x=cat2, y = pct, color = cat1)) +
 facet_wrap(~cat1)+
  geom_point()

ggplot(data = count1, aes(x = cat1, y = pct, color = cat2)) +
  geom_histogram()



head(visit_16)

acad_vis <- ggplot(data = acadia, aes(x = year, y = visitors)) + 
  geom_point() +
  geom_line() +
  geom_smooth(color = "red") +
  labs(title = "Acadia National Park Visitation",
       y = "Visitation",
       x = "Year") +
  theme_bw()

ggplotly(acad_vis)
