# PROJECT FORECASTING HUMIDITY USING R

# import dataset
data <- read.csv('DailyDelhiClimateTrain.csv')

# show the dataset
head(data)

# show the dataset
str(data)

# see missing value
sum(is.na(data))
colSums(is.na(data))

# change date data type
data$date <- as.Date(data$date)
head(data)

# check dataset
str(data)

# import library
library(forecast)

# define time series data
data.ts <- ts(data$humidity)
head(data.ts)
summary(data.ts)

# visualization 
plot(data.ts)

# log data ts
log.datats <- log(data.ts)

# define model auto.arima()
model <- auto.arima(log.datats, seasonal = TRUE)

# summary model
summary(model)

# forecast
predict <- forecast(model, h = 50)
head(predict)

# visualization 
plot(predict)

# evaluation
checkresiduals(model)
