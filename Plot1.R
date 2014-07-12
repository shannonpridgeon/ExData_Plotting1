## making four R plots for Project 1
## Exploratory Data Analysis, Course #3 in Coursera
## Plot #1

dat <- read.table("power.txt",comment.char = "",skip = 1,
                  nrows = 70000,sep=";",na.strings = "?",fill = TRUE,
                  colClasses = c("character","character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"),
                  col.names = c("date","time","global active power",
                               "global reactive power","voltage","global intensity",
                               "sub metering 1","sub metering 2","sub metering 3"))
subdat <- (dat[which(dat$date == "1/2/2007" | dat$date == "2/2/2007"), ,drop = FALSE])
hist(subdat$global.active.power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
