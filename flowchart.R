library(DiagrammeR)
library(grid)
# # 
# grViz("digraph flowchart {
#   # node definitions with substituted label text
#   node [fontname = Helvetica, shape = rectangle, fixedsize = false, width = 1]
#   1 [label = 'Box 1']
#   2 [label = 'Box 2']
#   3 [label = 'Box 3']
# 
#   m1 [label = 'm1']
#   m2 [label = 'm2 \\100']
#   m3 [label = 'm3']
# 
#   node [shape=none, width=0, height=0, label='']
#   p1 -> 2; p3 -> 3
#   {rank=same; p1 -> m1}
#   {rank=same; p2 -> m2}
#   {rank=same; p3 -> m3}
# 
#   edge [dir=none, arrowhead=none]
#   1 -> p1; 2 -> p2; p2 -> p3
# }")
# 
# 
# 
# # Assuming men_row_counts contains the "Step" and "Rows" columns
# Convert Rows to a character string
men_row_counts$RowsFormatted <- paste0("(n=", men_row_counts$Rows, ")")

# Initialize an empty string to store the node definitions
node_defs <- ""

# Generate node definitions using a loop
for (i in 1:nrow(men_row_counts)) {
  step <- men_row_counts$Step[i]
  rows <- men_row_counts$RowsFormatted[i]
  diff <- abs(men_row_counts$Difference[i])
  node_defs <- paste0(node_defs, i, " [label = '", step, "\\n", rows,"']\n")
}

# Initialize an empty string to store the analogous step definitions
analogous_step_defs <- ""

# Generate analogous step definitions using a loop
for (i in 1:(nrow(men_row_counts)-1)) {
  analogous_step_defs <- paste0(analogous_step_defs, "m", i, " [label = '", men_row_counts$Difference[i], "']\n")
}

# Combine node definitions with the rest of the Graphviz code
graphviz_code <- paste0("
  digraph flowchart {
    node [fontname = Helvetica, shape = rectangle, fixedsize = false, width = 1]

    ", node_defs, "
    

    ", analogous_step_defs, "


    node [shape=none, width=0, height=0, label='']
    p1 -> 2; p2 -> 3; p3 -> 4; p4 -> 5; p5 -> 6; p6 -> 7; p7 -> 8; p8 -> 9 ; p9 -> 10; p10 -> 11 
  {rank=same; p1 -> m1}
  {rank=same; p2 -> m2}
  {rank=same; p3 -> m3}
  {rank=same; p4 -> m4}
  {rank=same; p5 -> m5}
  {rank=same; p6 -> m6}
  {rank=same; p7 -> m7}
  {rank=same; p8 -> m8}
  {rank=same; p9 -> m9}
  {rank=same; p10 -> m10}

    edge [dir=none, arrowhead=none]
    1 -> p1; 2 -> p2; 3 -> p3; 4 -> p4; 5 -> p5; 6 -> p6; 7 -> p7; 8 -> p8; 9 -> p9 ; 10 -> p10; 
  }
")

# Render the graph
grViz(graphviz_code)

