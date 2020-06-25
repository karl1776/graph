## ----load-data-----------------------------------------------------------

# Remember it is good coding technique to add additional libraries to the top of
# your script 
library(lubridate) # for working with dates
library(ggplot2)  # for creating graphs
library(scales)   # to access breaks/formatting functions
library(gridExtra) # for arranging plots
library(grid)   # for arrangeing plots
library(dplyr)  # for subsetting by season

# set working directory to ensure R can find the file we wish to import
# setwd("working-dir-path-here")

# daily HARV met data, 2009-2011
harMetDaily.09.11 <- read.csv(
  file="C:/Users/12083/Documents/orbis/NEON-DS-Met-Time-Series/HARV/FisherTower-Met/Met_HARV_Daily_2009_2011.csv",
  stringsAsFactors = FALSE
)

# convert date to Date  class
harMetDaily.09.11$date <- as.Date(harMetDaily.09.11$date)


## ----plot-chat-----------------------------------------------------------

chatdaily <- ggplot(harMetDaily.09.11, aes(date, chat)) +
  geom_point() +
  ggtitle("Daily Library Transactions") +
  xlab("Date") + ylab("Transactions") +
  scale_x_date(labels=date_format ("%m-%y"))+
  theme(plot.title = element_text(lineheight=.8, face="bold",
                                  size = 20)) +
  theme(text = element_text(size=18))

chatdaily

