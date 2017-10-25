library('ggplot2')
library('ggthemes')

data <- read.csv(file='data/libraries-clean.csv', sep=',', head=TRUE)

plot <- ggplot(data, aes(factor(1), Users.per.HundredK)) +
        theme_tufte(ticks=FALSE) +
        geom_tufteboxplot(median.type = "line", whisker.type = 'line', hoffset = 0, width = 3) +
        coord_flip() +
        theme(axis.title=element_blank(),
              axis.text.y=element_blank(),
              axis.ticks.y=element_blank())

print(summary(data$Users.per.HundredK))

print(plot)

# geom_boxplot(outlier.shape='NA') +
# geom_point() +

# svg(filename = 'svg/boxplot-libraries.svg', width = 6, height = 4)
# print(plot)
# dev.off()

# https://cran.r-project.org/web/packages/ggthemes/vignettes/ggthemes.html

# stat_boxplot(geom='errorbar') +
# geom_boxplot(outlier.shape=21, fatten=2) +
