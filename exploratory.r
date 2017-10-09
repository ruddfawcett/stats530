library('ggplot2')
library('ggthemes')

data <- read.csv(file='scrapers/guns-wopo/gun-ownership-wopo.csv', sep=',', head=TRUE) #nRows=, nrows=5000
# data[order(-data$Population),]
# data <- head(data, 50)
# data$stroke_count <- as.numeric(as.character(data$stroke_count))

plot <- ggplot(data, aes(x=Guns.per.100.People, y=Homicides.by.Guns.per.100k.People, color='blue'), alpha=0.6) +
        geom_point(shape=1) +
        geom_smooth(method=lm, se=FALSE)

  # geom_point(aes(x=Average.Class.Size, y=hsk_level), color = 'red', alpha=0.2) + +

print(plot)
