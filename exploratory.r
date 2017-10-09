library('ggplot2')
library('ggthemes')

data <- read.csv(file='cleaned/lib-press.csv', sep=',', head=TRUE) #nRows=, nrows=5000
# data[order(-data$Population),]
# data <- head(data, 50)
# data$stroke_count <- as.numeric(as.character(data$stroke_count))

plot <- ggplot(data, aes(x=Press.Score, y=Libraries.per.Capita), alpha=0.6) +
        geom_point(shape=1) +
        geom_smooth(method=lm, se=FALSE)

  # geom_point(aes(x=Average.Class.Size, y=hsk_level), color = 'red', alpha=0.2) + +

print(plot)
