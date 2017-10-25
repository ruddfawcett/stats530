plot <- ggplot(data, aes(x=Graduation.Rate, y=resid(lm(Libraries.per.HundredK~Graduation.Rate)))) +
        geom_point() +
        geom_rangeframe() +
        geom_smooth(method='lm', color='black', se=FALSE, size=0.5) +
        theme_tufte() +
        labs(
             #  title='State Diplomas and Public Libraries',
             #  subtitle='State by state, is there an association between the public high school graduation rate and the number of libraries per 100k people?',
             x='Residuals',
             y='Graduation Rates'
           ) +
         theme(axis.title.x = element_text(vjust=-0.5), axis.title.y = element_text(vjust=1.5)) +
         guides(alpha=FALSE)

# print(cor(data$Graduation.Rate, data$Users.per.HundredK))
print(plot)
