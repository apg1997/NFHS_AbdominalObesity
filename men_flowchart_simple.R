library(DiagrammeR)
# Combine node definitions with the rest of the Graphviz code
graphviz_code <- paste0("
  digraph flowchart {
  node [fontname = Helvetica, shape = rectangle, fixedsize = false, width = 1]
  1 [label = 'Total Sample in MR file \n (n = 101839)']
  2 [label = 'Adult Sample without missing height and weight or BMI data \n (n=86439)']
  3 [label = 'Final Sample for Men \n (n =86347)']


  m1 [label = 'Men less than 18 years old \n (n = 10211)']
  m2 [label = 'Missing Height and Weight, or BMI \n (n =5145) ']
  m3 [label = 'Missing Waist Circumference \n (n=44)']
  m4 [label = 'Missing BMI data (n=92)']
    node [shape=none, width=0, height=0, label='']
    p1
    p2
    p3
   # p2 -> m3
   # p2 -> m4
   
   p2 -> 2 
   
    p4->3
 
    edge [dir=TB, arrowhead=none]
    
    1 ->p1 -> p2
    2 -> p3 -> p4

    edge [dir = LR ,arrowhead = normal]
  {rank=same; p1 -> m1}
  {rank=same; p2 -> m2}
  {rank=same; p3 -> m3}
  {rank=same; p4 -> m4}
  }
")

grViz(graphviz_code)

