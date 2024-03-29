library('ggplot2')
library('ggthemes')

data <- read.csv(file='../data/libraries-clean.csv', sep=',', head=TRUE)

plot <- ggplot(data, aes(x=Graduation.Rate, y=Users.per.HundredK)) +
        # geom_point(aes(size=Users.per.HundredK)) +
        geom_point() +
        geom_rangeframe() +
        geom_smooth(method='lm', color='black', se=FALSE, size=0.5) +
        theme_tufte() +
        # labs(
             #  title='State Diplomas and Public Libraries',
             #  subtitle='State by state, is there an association between the public high school graduation rate and the number of libraries per 100k people?',
            #  x='Public High School Graduation Rate',
            #  y='Books per 100k People'

            #  size='Users per 100k People',
            #  color='Region',
            #  alpha='TEST'
          #  )  +
         theme(axis.title.x = element_text(vjust=-0.5), axis.title.y = element_text(vjust=1.5)) +
         guides(alpha=FALSE)

# print(cor(data$Graduation.Rate, data$Users.per.HundredK))
print(plot)

# svg(filename = 'svg/scatterplot-all-regression.svg', width = 6, height = 4)
# print(plot)
# dev.off()
