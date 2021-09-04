library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

second <- NEI %>% 
  filter(fips == "24510") %>% 
  group_by(year) %>% 
  summarise(emissions = sum(Emissions))


png(filename = "plot2.png")
with(second, plot(year, emissions, 
                  main = "Total Emissions in Baltimore",
                  ylab = "Total emissions",
                  xlab = "Year"))
dev.off()