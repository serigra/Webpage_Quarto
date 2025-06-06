

empty_plot <- function(type = "MainPlot", color = 'black'){
  
  ggplot() +
    theme(
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      panel.grid = element_blank()
    ) + 
    annotate("text", x = 0.5, y = 0.5, label = type, size = 6, color = color) 
  
}
