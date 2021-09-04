library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

third <- NEI %>% 
  filter(fips == "24510") %>% 
  group_by(year, type) %>% 
  summarise(emissions = sum(Emissions))


third %>% 
  ggplot(aes(year, emissions, color = type)) +
  geom_line(size = 2) +
  labs(x = "Year", y = "Total emissions", title = "Emissions in Baltimore by type", color = "Type") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("plot3.png")