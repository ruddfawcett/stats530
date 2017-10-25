library('ggplot2')
library('ggthemes')

data <- read.csv(file='../data/libraries-clean.csv', sep=',', head=TRUE)

plot <- ggplot(data, aes(x = Users.per.HundredK)) +
        theme_tufte(base_size=14, ticks=F) +
        geom_histogram(binwidth=10000, fill='black', color='black') +
        theme_tufte() +
        theme(axis.title.x = element_text(vjust=-0.5), axis.title.y = element_text(vjust=1.5)) +
        annotate('text', label = 'Libraries per 100k for the four \nregions of the United States.', x = 20, y = 10, adj=0.1,  family='serif')

print(plot)
#
# svg(filename = 'svg/histogram-libraries-normality.r', width = 6, height = 4)
# print(plot)
# dev.off()
