plot <- ggplot(data, aes(factor(1), Graduation.Rate)) +
        theme_tufte(ticks=FALSE) +
        geom_tufteboxplot(median.type = "line", whisker.type = 'line', hoffset = 0, width = 3) +
        coord_flip() +
        theme(axis.title=element_blank(),
              axis.text.y=element_blank(),
              axis.ticks.y=element_blank())

print(plot)
