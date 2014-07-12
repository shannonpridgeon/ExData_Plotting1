## Plot 2 for Project 1, Exploratory Data Analysis Coursera July 2014

dat <- read.table("power.txt",comment.char = "",skip = 1,
                  nrows = 70000,sep=";",na.strings = "?",fill = TRUE,
                  colClasses = c("character","character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"),
                  col.names = c("date","time","global active power",
                                "global reactive power","voltage","global intensity",
                                "sub metering 1","sub metering 2","sub metering 3"))
dat$datetime <- paste(dat$date, dat$time)  ##adds a 10th column
dat$datetime <- strptime(dat$datetime, "%d/%m/%Y %H:%M:%S")
subdat <- (dat[which(dat$date == "1/2/2007" | dat$date == "2/2/2007"), ,drop = FALSE])
plot(subdat$datetime,subdat$global.active.power, xlab = "", main = NULL, 
     ylab = "Global Active Power (kilowatts)",type = "l")
dev.copy(png, file = "plot2.png")
dev.off()
