analyze_obesity_data <- function(data, NFHSdesign) {
  
  # Theme
  theme_gtsummary_journal("lancet")
  
  # Prevalence
  prevalence <- tbl_svysummary(NFHSdesign, 
                               include = c(obese_wtcircum,obese_bmi),
                               digits = list(all_categorical() ~ c(0,1))) %>%
    add_ci(style_fun = everything() ~ purrr::partial(style_number, scale = 100, digits = 1))
  
  # Prevalence WC
  prevalence_wc <- tbl_svysummary(NFHSdesign, by = obese_wtcircum,
                                  include = c(age_category, residence, education, religion, wealth, caste, meat),
                                  statistic = list(all_categorical() ~ "{p}% ({n})"),
                                  missing_text = "NA",
                                  percent = "row") %>%
    add_ci(pattern = "{stat} [{ci}]", method = religion ~ "svyprop.beta") %>%
    add_overall(last = TRUE, statistic = ~"{n}")

  # Prevalence BMI
  prevalence_bmi <- tbl_svysummary(NFHSdesign, by = obese_bmi,
                                   include = c(age_category, residence, education, religion, wealth, caste, meat),
                                   statistic = list(all_categorical() ~ "{p}% ({n})"),
                                   missing_text = "NA",
                                   percent = "row") %>%
    add_ci(pattern = "{stat} [{ci}]", method = religion ~ "svyprop.beta") %>%
    add_overall(last = TRUE, statistic = ~"{n}")

  
  model_adj_wc <- svyglm(obese_wtcircum ~ age_category + residence + education + religion + wealth + caste + meat,
                         design = NFHSdesign, data = data, family = quasibinomial())

  model_adj_wc_est <- model_adj_wc %>%
    tbl_regression(exponentiate = TRUE)
  
  
  results <- list(
    prevalence = prevalence,
    prevalence_wc = prevalence_wc,
    prevalence_bmi = prevalence_bmi,
    model_adj_wc_est = model_adj_wc_est
  )
  
  return(results)
}

streamline_save <- function(data, design, prefix, output_folder = "Output", output_filename) {
  # 1. Get results
  results <- analyze_obesity_data(data, design)
  
  # 2. Rename results
  names(results) <- paste0(prefix, names(results))
  
  # 3. Assign results to global environment
  for(name in names(results)) {
    assign(name, results[[name]], envir = .GlobalEnv)
  }
  
  # 4. Save the results
  if (!dir.exists(output_folder)) {
    dir.create(output_folder)
  }
  save(list = names(results), file = file.path(output_folder, output_filename))
}

# Usage:
streamline_save(men, NFHS5_design, prefix = "men_", output_filename = "men_output2.Rdata")

# State and District Estimation: wrap similar code blocks

analyze_obesity_data2 <- function(data, NFHSdesign) {
  
  # Regression
  model_uv_wc <- data %>%
    dplyr::select(obese_wtcircum, age_category, residence, education, religion, wealth, caste, meat) %>%
    tbl_uvregression(method = svyglm,
                     y = obese_wtcircum,
                     method.args = list(design = NFHSdesign, family = quasibinomial()),
                     exponentiate = TRUE,
                     pvalue_fun = ~style_pvalue(.x, digits = 2))
  
  results <- list(
    model_uv_wc = model_uv_wc
  )
  
  return(results)
}
results <- analyze_obesity_data2(men, NFHS5_design)

