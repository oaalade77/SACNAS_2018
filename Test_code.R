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
  geom_point(aes(x=year, y = visitors, color=state)) +
               labs(x = "Year",
                    y = "Visitation",
                    title = "SE States National Park") +
             theme_bw() +
             theme(legend.title = element_blank(),
             axis.text.x = element_text(angle = 45, hjust = 1, size = 14))
ggplot(data=se)+
  geom_point(aes(x=year, y=visitors, color = park_name))+
  facet_wrap(~state, scales = "fixed")

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
