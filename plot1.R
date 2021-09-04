library(tidyverse)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              "getdata_dataset.zip",
              method="curl")

unzip("getdata_dataset.zip") 


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# First assignment
first <- NEI %>% 
  group_by(year) %>% 
  summarise(emissions = sum(Emissions))


png(filename = "plot1.png")
with(first, plot(year, emissions, 
                 main = "Total Emissions in the United States",
                 ylab = "Total emissions",
                 xlab = "Year"))
dev.off()