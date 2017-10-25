plot <- ggplot(data, aes(x=Graduation.Rate, y=Users.per.HundredK)) +
        geom_point() +
        geom_rangeframe() +
        geom_smooth(method='lm', color='black', se=FALSE, size=0.5) +
        theme_tufte() +
        labs(
             #  title='State Diplomas and Public Libraries',
             #  subtitle='State by state, is there an association between the public high school graduation rate and the number of libraries per 100k people?',
             x='Graduation Rates',
             y='Library Users'
           )  +
         theme(axis.title.x = element_text(vjust=-0.5),
               axis.title.y = element_text(vjust=1.5),
               axis.ticks=element_blank()) +
         guides(alpha=FALSE)

fit <- lm(data$Graduation.Rate ~ data$Users.per.HundredK)
correlation <- cor(data$Graduation.Rate, data$Users.per.HundredK)
regression_data <- data.frame(formatC(correlation, format='f', digits=4),
                              formatC(correlation^2, format='f', digits=4),
                              formatC(fit$coefficients[[1]], format='f', digits=4),
                              fit$coefficients[[2]])
colnames(regression_data) <- c('r', 'coeff. determination', 'slope', 'y-intercept')

# regression_data <- summary.lm()

print(plot)
