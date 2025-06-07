# library(R.utils)
# library(tidyverse)

model_data <- function() {

# ----------------------------- generate data ----------------------------------
data.original <- data.frame(
  
  variable = c(
    "age", 
    "sex_w_vs_m", 
    "region_urban_vs_rural", 
    "region_suburban_vs_rural", 
    "education", 
    "income", 
    "employment_yes_vs_no",
    "smoking_yes_vs_no", 
    "alcohol", 
    "hypertension_yes_vs_no", 
    "diabetes", 
    "BMI", 
    "physical_activity", 
    "cholesterol",
    "total_healthcare_costs", 
    "number_hospital_visits", 
    "number_outpatient_consultations"
  ),
  OR = c(
    1.25, 0.9, 1.19, 1.12, 0.81, 0.81, 0.62, 1.1,
    1.70, 1.92, 1.35, 1.32, 0.88, 1.02, 1.33,
    1.45, 1.30
  ),
  CI_lower = c(
    1.05, 0.72, 0.97, 0.95, 0.65, 0.56, 0.52, 0.92,
    1.50, 1.86, 1.16, 1.23, 0.80, 0.74, 1.11,
    1.33, 1.12
  ),
  CI_upper = c(
    1.33, 1.13, 1.29, 1.20, 0.92, 1.03, 0.75, 1.23,
    1.89, 2.02, 1.45, 1.44, 0.95, 1.13, 1.42,
    1.52, 1.54
  ),
  p_value = c(
    0.011, 0.18, 0.062, 0.062, 0.009, 0.073, 0.002, 0.19,
    0.001, 0.0001, 0.004, 0.013, 0.021, 0.81, 0.0003,
    0.00001, 0.0007
  )) 


# ------------------------ add plot specific variables -------------------------

data.original <-
  
  data.original |> 
  mutate(
    type = c(rep("Sociodemographic", 7),
             rep("Health Status", 10)),
    OR_CI = paste0(round(OR, 2), ' (', 
                   round(CI_lower, 2), '-', round(CI_upper, 2),
                   ')'),
    p_value_sign = ifelse(p_value < 0.05, TRUE, FALSE),
    p_value_cat = case_when(p_value < 0.001 ~ '< 0.001',
                            p_value < 0.05 ~ '< 0.05',
                            TRUE ~ as.character(round(p_value, 2))
    )
  )


# ----------------------------- order variables --------------------------------

data.ordered <- data.original |> 
  mutate(variable = factor(variable, 
                           levels = c("age", "sex_w_vs_m",
                                      "region_urban_vs_rural", 
                                      "region_suburban_vs_rural", 
                                      "education", 
                                      "income", 
                                      "employment_yes_vs_no",
                                      "physical_activity", 
                                      "smoking_yes_vs_no", 
                                      "alcohol", 
                                      "hypertension_yes_vs_no", 
                                      "diabetes", 
                                      "BMI", 
                                      "cholesterol",
                                      "number_outpatient_consultations",
                                      "number_hospital_visits", 
                                      "total_healthcare_costs"),
                           labels = c("Age", "Sex (w vs. m)",
                                      "Region (urban vs. rural)",
                                      "Region (suburban vs.rural",
                                      "Education Level",
                                      "Yearly Income (CHF)",
                                      "Employed (vs. unemployed)",
                                      "Physical Activity Level",
                                      "Smoking (vs. non-smoking)",
                                      "Alcohol Consume",
                                      "Hypertension (yes vs. no)",
                                      "Diabetes (yes vs. no)",
                                      "BMI (≥ 25 vs < 25)",
                                      "Cholesterol Level",
                                      "No. outpatient consultations",
                                      "No. hospital visits",
                                      "Total Healthcare Costs (CHF)")
  )
  )


# ----------------------------- add subtitles ----------------------------------

orig_levels <- levels(data.ordered$variable)
new_levels <- insert(orig_levels, ats = c(1, 8), 
                     values = c("**Sociodemographic**", "**Health Status**"))


data <- data.ordered |> 
  group_by(type) |> 
  group_modify(~ add_row(.x, .before = 0)) |> 
  ungroup() |> 
  mutate(variable = ifelse(is.na(variable), 
                           paste0("**",type, "**"), as.character(variable))) |>  
  mutate(variable = factor(variable, 
                           levels = new_levels,
                           labels = new_levels
  )
  )

# ----------------------------- return data ------------------------------------

 return(
   list(
    data.final = data,
    data.original = data.original,
    data.ordered = data.ordered
 )
 )
}


# Example usage
# data <- model_data()$data.final
