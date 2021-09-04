library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI %>% 
  filter((fips == "24510" |  fips == "06037") & type == "ON-ROAD")  %>% 
  group_by(year, fips) %>% 
  summarise(emissions = sum(Emissions)) %>% 
  mutate(fips = case_when(fips == "06037" ~ "Los Angeles",
                          fips == "24510" ~ "Baltimore City")) %>% 
  ggplot(aes(year, emissions)) + 
  geom_line() +
  facet_wrap(vars(fips)) +
  labs(title = "Comparision between emissions from motor vehicle in Baltimore City and Los Angeles County")+
  theme(plot.title = element_text(hjust = 0.5))
  

ggsave("plot6.png")
