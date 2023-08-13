suppressMessages(if (!require("pacman")) install.packages("pacman"))
pacman::p_load(tidyverse,rio,here,gtsummary)

# Currently, the Rdata output for analysis of complete women (9GB) and men (2GB) data are too large to handle efficiently.

# Issues are 1. saving original datasets as well: women_original and men_original, 2. large table objects
# saving only essential objects now
# gtsummary::tbl_buther will reduce the size of tbl_x objects

########
# Men
########

load(here("Output","men_output_smallest.Rdata"))

save(list = setdiff(ls(pattern = "^men_"), "men_original"), file = here("Output", "men_output_smaller.Rdata"))

# Identify tbl_x objects
objs_to_butcher <- ls()[sapply(ls(), function(obj_name) {
  obj <- get(obj_name)
  any(c("tbl_regression", "tbl_uvregression", "tbl_svysummary") %in% class(obj))
})]

# Apply tbl_butcher to those objects and assign back to the same name
for(obj_name in objs_to_butcher) {
  assign(obj_name, tbl_butcher(get(obj_name)))
}

save(list = setdiff(ls(pattern = "^men_"), c("men_original","men_model_adj_wc")), file = here("Output", "men_output_smallest.Rdata"))

#######################################

rm(list = ls())

# 
# 
# pacman::p_load(tidyverse,rio,here,gtsummary)
# load(here("Output","men_output.Rdata"))
# 
# all_objects <- ls(envir = .GlobalEnv)
# 
# sizes_in_MB <- sapply(all_objects, function(obj_name) {
#   object.size(get(obj_name, envir = .GlobalEnv)) / (1024^3)
# })
# 
# print(sizes_in_MB)
# 
# z <- men_model_uv_wc %>% tbl_butcher()

########
# Women
########

load(here("Output","women_output.Rdata"))

save(list = setdiff(ls(pattern = "^women_"), "women_original"), file = here("Output", "women_output_smaller.Rdata"))

# Identify tbl_x objects
objs_to_butcher <- ls()[sapply(ls(), function(obj_name) {
  obj <- get(obj_name)
  any(c("tbl_regression", "tbl_uvregression", "tbl_svysummary") %in% class(obj))
})]

# Apply tbl_butcher to those objects and assign back to the same name
for(obj_name in objs_to_butcher) {
  assign(obj_name, tbl_butcher(get(obj_name)))
}

save(list = setdiff(ls(pattern = "^women_"), "women_original"), file = here("Output", "women_output_smallest.Rdata"))

