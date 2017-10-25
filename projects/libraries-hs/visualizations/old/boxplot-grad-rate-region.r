library('ggplot2')
library('ggthemes')

data <- read.csv(file='data/libraries-clean.csv', sep=',', head=TRUE)

plot <- ggplot(data, aes(factor(Region), Graduation.Rate)) +
        theme_tufte() +
        geom_tufteboxplot() +
        theme(axis.title=element_blank()) +
        annotate('text', label = 'Graduation rates of the four \nregions of the United States.', x = 1, y = 73, adj=0.1,  family='serif')

print(plot)

# svg(filename = 'svg/boxplot-grad-rate-region.svg', width = 6, height = 4)
# print(plot)
# dev.off()
#
