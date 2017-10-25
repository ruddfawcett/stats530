library('ggplot2')
library('ggthemes')

data <- read.csv(file='data/raw/nyc-rolling-sales.csv', sep=',', head=TRUE, nrows=500) #nRows=, nrows=5000
# data[order(-data$Population),]
# data <- head(data, 50)
data$SALE.PRICE <- as.numeric(as.character(data$SALE.PRICE))

plot <- ggplot(data, aes(x=SALE.PRICE, y=GROSS.SQUARE.FEET, color=BOROUGH), alpha=0.6) +
        geom_point(shape=1) +
        geom_smooth(method=lm, se=FALSE)

  # geom_point(aes(x=Average.Class.Size, y=hsk_level), color = 'red', alpha=0.2) + +

print(plot)
