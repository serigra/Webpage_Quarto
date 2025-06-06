
model_plot <- function(data){
  
mainPlot <- # -----------------------------------------------------------------
  
  ggplot(data, aes(y = fct_rev(variable), x = OR, color = p_value_sign)) +
  geom_point(size=2, show.legend = F) +
  geom_errorbarh(aes(xmin=`CI_lower`, xmax=`CI_upper`), 
                 height = 0.0, size = 0.70) +
  geom_vline(aes(xintercept = 1), 
             color = 'grey80', lty = 2, size = 0.8) +
  scale_color_manual(values = c("#aaaaaa", "black")) +
  coord_cartesian(ylim = c(1, dim(data)[1]+1)) + 
  labs(x = 'OR (CI)', y = '') +
  theme_classic() +
  theme(legend.position = 'none',
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = ggtext::element_markdown(size = 13),
        axis.text.x = element_text(size = 11),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_line(color = '#F5F5F5'),
        panel.background = element_rect(fill = "#f8f8f6", color = NA),
        plot.background = element_rect(fill = "#f8f8f6", color = NA))


rightPlot <- # -----------------------------------------------------------------

ggplot(data, aes(y = fct_rev(variable))) +
  geom_text(aes(x = 0, label = OR_CI, color = p_value_sign), 
            size = 4, hjust = 0) +
  geom_richtext(aes(x = 0.5, 
                    label = ifelse(is.na(p_value_cat), NA, 
                                   paste0('**', p_value_cat, '**')), 
                    label.colour = NA, color = p_value_sign), 
                fill = NA, size = 4, hjust = 1) +
  annotate('text', x = 0.04, y = dim(data)[1]+1, 
           label = "OR (CI)", hjust = 0, fontface = "bold") +
  annotate('text', x = 0.5, y = dim(data)[1]+1, 
           label = "p-value", hjust = 1, fontface = "bold") +
  scale_color_manual(values = c("#aaaaaa", "black")) +
  coord_cartesian(ylim = c(1, dim(data)[1]+1), xlim = c(0, 0.51)) +
  theme_void() +
  theme(legend.position = 'none')


# ----------------------- combined plots & annotations -------------------------

mainPlot + rightPlot + plot_layout(widths = c(1.8,1.2)) +
  patchwork::plot_annotation(
    title = 'Model Estimates of Sociodemographic and Health Variables',
    subtitle = '',
    caption = 'Note: This model output is entirely hypothetical and was created solely for illustrative purposes. 
    It does not represent real data or imply any real-world conclusions.',
    theme = theme(plot.title = element_text(size = 17, face = "bold", hjust = 0),
                 plot.subtitle = element_text(size = 16, hjust = 0),
                 plot.caption = element_text(size = 10, hjust = 1, color = '#aaaaaa')) 
  )
}

# run
# model_plot(data = data)