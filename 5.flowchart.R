suppressMessages(if (!require("pacman")) install.packages("pacman"))
pacman::p_load(DiagrammeR, grid, here, DiagrammeRsvg, rsvg)

# Importing the data and retaining only row_counts dataframes
load(here("Output","men_output.Rdata"));load(here("Output","women_output.Rdata"))
rm(list = setdiff(ls(), grep("row_counts", ls(), value = TRUE)))

#################
# Men flowchart #
#################

# Create a named list for men's counts and assign values
men <- list()
men$total_sample <- men_row_counts$Rows[men_row_counts$Step == "Initial number of rows"]
men$age_18_54 <- men_row_counts$Rows[men_row_counts$Step == "Step 1 - Excluding men less than 18 years"]
men$included <- men_row_counts$Rows[men_row_counts$Step == "Step 9 - Filtering NA in BMI"]
men$less_18 <- -men_row_counts$Difference[men_row_counts$Step == "Step 1 - Excluding men less than 18 years"]
men$missing_wc <- -men_row_counts$Difference[men_row_counts$Step == "Step 5 - Filtering NA in waist circumference"]
men$missing_bmi <- -sum(men_row_counts$Difference[men_row_counts$Step %in% c("Step 6 - Filtering where (height and weight) or BMI is not available", "Step 9 - Filtering NA in BMI")])

men_dot_code <- sprintf(
  "digraph flowchart {
  # node definitions with substituted label text
  node [fontname = Helvetica, shape = rectangle, fixedsize = false, width = 1]
  1 [label = 'Total Men sample: %s']
  2 [label = 'Men between 18 - 54 years: %s']
  3 [label = 'Men included in analysis: %s']

  m1 [label = 'Men less than 18 years: %s']
  m2 [label = 'Missing waist circumference: %s']
  m3 [label = 'Missing BMI: %s']

  node [shape=none, width=0, height=0, label='']
  p1 -> 2; p3 -> 3
  {rank=same; p1 -> m1}
  {rank=same; p2 -> m2}
  {rank=same; p3 -> m3}

  edge [dir=none, arrowhead=none]
  1 -> p1; 2 -> p2; p2 -> p3
}", 
  men$total_sample, men$age_18_54, men$included, 
  men$less_18, men$missing_wc, men$missing_bmi
)

grViz(men_dot_code) %>% 
  export_svg() %>% 
  charToRaw() %>%
  rsvg::rsvg_pdf(here("Output", "flowchart_men.pdf"))

###################
# Women flowchart #
###################
# Create a named list for women's counts
women <- list()
women$total_sample <- women_row_counts$Rows[women_row_counts$Step == "Initial number of rows"]
women$age_18_54_no_pregnant <- women_row_counts$Rows[women_row_counts$Step == "Step 2 - Excluding women less than 18 years"]
women$included <- women_row_counts$Rows[women_row_counts$Step == "Step 10 - Filtering NA in BMI"]
women$pregnant_or_recent_birth_less_18 <- -sum(women_row_counts$Difference[women_row_counts$Step %in% c("Step 1 - Excluding pregnant or recently given birth women", "Step 2 - Excluding women less than 18 years")])
women$missing_wc <- -women_row_counts$Difference[women_row_counts$Step == "Step 6 - Filtering NA in waist circumference"]
women$missing_bmi <- -sum(women_row_counts$Difference[women_row_counts$Step %in% c("Step 7 - Filtering where (height and weight) or BMI is not available", "Step 10 - Filtering NA in BMI")])

women_dot_code <- sprintf(
  "digraph flowchart {
  # node definitions with substituted label text
  node [fontname = Helvetica, shape = rectangle, fixedsize = false, width = 1]
  1 [label = 'Total Women sample: %s']
  2 [label = 'Women above 18 years not pregnant or recently given birth: %s']
  3 [label = 'Women included in analysis: %s']

  m1 [label = 'Pregnant or recently given birth, or less than 18 years: %s']
  m2 [label = 'Missing waist circumference: %s']
  m3 [label = 'Missing BMI: %s']

  node [shape=none, width=0, height=0, label='']
  p1 -> 2; p3 -> 3
  {rank=same; p1 -> m1}
  {rank=same; p2 -> m2}
  {rank=same; p3 -> m3}

  edge [dir=none, arrowhead=none]
  1 -> p1; 2 -> p2; p2 -> p3
}", 
  women$total_sample, women$age_18_54_no_pregnant, women$included, 
  women$pregnant_or_recent_birth_less_18, women$missing_wc, women$missing_bmi
)

grViz(women_dot_code) %>% 
  export_svg() %>% 
  charToRaw() %>%
  rsvg::rsvg_pdf(here("Output", "flowchart_women.pdf"))

