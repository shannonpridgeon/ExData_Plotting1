## Plot 3 for Project 1, Exploratory Data Analysis Coursera July 2014

dat <- read.table("power.txt",comment.char = "",skip = 1,
                  nrows = 70000,sep=";",na.strings = "?",fill = TRUE,
                  colClasses = c("character","character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"),
                  col.names = c("date","time","global active power",
                                "global reactive power","voltage","global intensity",
                                "sub metering 1","sub metering 2","sub metering 3"))
dat$datetime <- paste(dat$date, dat$time)  ##adds a 10th column
dat$datetime <- strptime(dat$datetime, "%d/%m/%Y %H:%M:%S") ##formats 10th column
subdat <- (dat[which(dat$date == "1/2/2007" | dat$date == "2/2/2007"), ,drop = FALSE])

plot(subdat$datetime,subdat$sub.metering.1, xlab = "", main = NULL, 
     ylab = "Energy sub metering",type = "l")
lines(subdat$datetime,subdat$sub.metering.2, col = "red")
lines(subdat$datetime,subdat$sub.metering.3, col = "blue")
legend("topright",lty = "solid",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
