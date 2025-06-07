#library(tidyverse)
#library(gt)

model_table <- function(data) {
  
  data |>
  select(variable, OR, CI_lower, CI_upper, p_value) |>
  gt() |> 
  tab_header(
    title = md('**Model Estimates of <br> Sociodemographic and Health Variables**'),
    subtitle = 'Odds Ratios (OR), Confidence Intervals (CI), p-values') |> 
  tab_source_note(
    source_note = md("*Note*: This model output is entirely hypothetical and
                     was created solely for illustrative purposes. 
                     It does not represent real data or imply any real-world conclusions.")) |> 
  tab_options(table.width = pct(40),
              table.font.size = 12,
              heading.title.font.size = 16,
              heading.subtitle.font.size = 14,
              heading.padding = px(6),
              column_labels.padding = px(4),
              data_row.padding = px(3),
              column_labels.font.weight = "bold",
              column_labels.font.size = 14,
              table.background.color = "#f8f8f6")
  
}