library('ggplot2')
library('ggthemes')

data <- read.csv(file='data/libraries-clean.csv', sep=',', head=TRUE)

plot <- ggplot(data, aes(x=Graduation.Rate, y=Libraries.per.HundredK)) +
        geom_smooth(method='lm', color='black', se=FALSE, size=0.5) +
        geom_point(size=0.5) +
        geom_rangeframe() +
        theme_tufte() +
        labs(
            #  title='State Diplomas and Public Libraries',
            #  subtitle='State by state, is there an association between the public high school graduation rate and the number of libraries per 100k people?',
             x='Public High School Graduation Rate',
             y='Librares per 100k People',
             color='Region',
             alpha='TEST') +
        facet_wrap(~ Region, scales='free') +
        theme(axis.title.x = element_text(vjust=-0.5), axis.title.y = element_text(vjust=1.5)) +
        guides(alpha=FALSE)

print(plot)

svg(filename = 'svg/scatterplot-region-regression.svg', width = 6, height = 4)
print(plot)
dev.off()
