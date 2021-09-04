library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- SCC %>% 
  filter(str_detect(Short.Name, regex(c("Coal | coal")))) %>% 
  select(SCC) %>% 
  pull()


fourth <- NEI %>% 
  filter(SCC  %in% coal) %>% 
  group_by(year) %>% 
  summarise(emissions = sum(Emissions))


png(filename = "plot4.png")
with(fourth, plot(year, emissions, 
                  main = "Total Coal Emissions in the United States",
                  ylab = "Total emissions",
                  xlab = "Year"))
dev.off()