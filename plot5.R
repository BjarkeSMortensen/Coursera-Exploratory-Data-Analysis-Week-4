library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI %>% 
  filter(type == "ON-ROAD"  & fips == "24510") %>% 
  group_by(year) %>% 
  summarise(emissions = sum(Emissions)) %>% 
  ggplot(aes(year, emissions)) +
  geom_line() +
  labs(x = "Year", y = "Total emissions", title = "Vechicle emissions in Baltimore", color = "Type") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("plot5.png")