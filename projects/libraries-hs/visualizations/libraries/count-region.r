plot <- ggplot(data, aes(factor(Region), Libraries.per.HundredK)) +
        theme_tufte(ticks=FALSE) +
        geom_tufteboxplot(median.type = "line", whisker.type = 'line', hoffset = 0, width = 3) +
        # coord_flip() +
        theme(axis.title=element_blank())

suppressWarnings(print(plot))
