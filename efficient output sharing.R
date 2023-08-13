suppressMessages(if (!require("pacman")) install.packages("pacman"))
pacman::p_load(tidyverse,rio,here,gtsummary)

# Currently, the Rdata output for analysis of complete women (9GB) and men (2GB) data are too large to handle efficiently.

# Issues are 1. saving original datasets as well: women_original and men_original, 2. large table objects
# saving only essential objects now
# gtsummary::tbl_buther will reduce the size of tbl_x objects

########
# Men
########

load(here("Output","men_output.Rdata"))

# Identify tbl_x objects
objs_to_butcher <- ls()[sapply(ls(), function(obj_name) {
  obj <- get(obj_name)
  any(c("tbl_regression", "tbl_uvregression", "tbl_svysummary") %in% class(obj))
})]

# Apply tbl_butcher to those objects and assign back to the same name
for(obj_name in objs_to_butcher) {
  assign(obj_name, tbl_butcher(get(obj_name)))
}

# Get the list of objects based on your criteria
viz_objects <- setdiff(ls(pattern = "^men_"), c("men_original", "men_model_adj_wc"))

# Apply as_data_frame() to these objects and overwrite them
for (obj_name in viz_objects) {
  assign(obj_name, as_data_frame(get(obj_name)))
}

save(list = setdiff(ls(pattern = "^men_"), c("men_original","men_model_adj_wc")), file = here("Output", "men_output_viz.Rdata"))

#######################################
rm(list = ls())

########
# Women
########

load(here("Output","women_output.Rdata"))

# Identify tbl_x objects
objs_to_butcher <- ls()[sapply(ls(), function(obj_name) {
  obj <- get(obj_name)
  any(c("tbl_regression", "tbl_uvregression", "tbl_svysummary") %in% class(obj))
})]

# Apply tbl_butcher to those objects and assign back to the same name
for(obj_name in objs_to_butcher) {
  assign(obj_name, tbl_butcher(get(obj_name)))
}

# Get the list of objects based on your criteria
viz_objects <- setdiff(ls(pattern = "^women_"), c("women_original", "women_model_adj_wc"))

# Apply as_data_frame() to these objects and overwrite them
for (obj_name in viz_objects) {
  assign(obj_name, as_data_frame(get(obj_name)))
}

save(list = setdiff(ls(pattern = "^women_"), c("women_original","women_model_adj_wc")), file = here("Output", "women_output_viz.Rdata"))