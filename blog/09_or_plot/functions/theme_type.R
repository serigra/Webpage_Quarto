#library(ggplot2)

theme_type <- function(theme_type = 'normal'){

  if (!theme_type %in% c("normal", "grau")) {
    stop("'theme_type' must be either 'normal' or 'grau'")
  }
  
  if(theme_type == 'normal'){
    
  theme <- 
    
    theme_classic() +
    theme(panel.background = element_rect(fill = "#f8f8f6", color = NA),
          plot.background = element_rect(fill = "#f8f8f6", color = NA),
          legend.position = 'none',
          axis.line.x = element_line(),
          axis.ticks.x = element_line(),
          axis.text.x = element_text(),
          axis.title.x = element_text(),
          axis.line.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.text.y = ggtext::element_markdown(),
          panel.grid.minor.y = element_blank(),
          panel.grid.major.y = element_line(color = '#F5F5F5'))
  } 
  
  if(theme_type == 'grau'){
    
  theme <- 
      theme_classic() +
      theme(panel.background = element_rect(fill = "#f8f8f6", color = NA),
            plot.background = element_rect(fill = "#f8f8f6", color = NA),
            legend.position = 'none',
            axis.line.x = element_line(color = 'grey80'),
            axis.ticks.x = element_line(color = "grey80"),
            axis.text.x = element_text(color = "grey80"),
            axis.title.x = element_text(color = "grey80"),
            axis.line.y = element_blank(),
            axis.ticks.y = element_blank(),
            axis.text.y = ggtext::element_markdown(color = 'grey80'),
            panel.grid.minor.y = element_blank(),
            panel.grid.major.y = element_line(color = '#F5F5F5'))
    
  }
  
  return(theme)
  
}
