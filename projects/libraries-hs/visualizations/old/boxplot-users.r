library('ggplot2')
library('ggthemes')

data <- read.csv(file='data/libraries-clean.csv', sep=',', head=TRUE)

plot <- ggplot(data, aes(factor(Region), Users.per.HundredK)) +
        theme_tufte() +
        geom_tufteboxplot() +
        theme(axis.title=element_blank()) +
        annotate('text', label = 'Users per 100k for the four \nregions of the United States.', x = 2, y = 70000, adj=0.1,  family='serif')

print(plot)

svg(filename = 'svg/boxplot-users.svg', width = 6, height = 4)
print(plot)
dev.off()

# stat_boxplot(geom='errorbar') +
# geom_boxplot(outlier.shape=21, fatten=2) +
