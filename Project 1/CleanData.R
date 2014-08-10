fullData <- read.csv2("C:/R/household_power_consumption.txt", stringsAsFactors = F, header = T, sep = ";", na.strings = "?")
powerData <- fullData[grepl("^[1-2]/2/2007", fullData$Date),]
powerData$Date_time <- strptime(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")
powerData[,c(3:9)] <- apply(powerData[,c(3:9)], 2, function(x) as.numeric(x))
saveRDS(powerData, file = "powerData.rds")