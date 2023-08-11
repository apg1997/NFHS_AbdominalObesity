library(DiagrammeR)
# Combine node definitions with the rest of the Graphviz code
graphviz_code <- paste0("
  digraph flowchart {
  node [fontname = Helvetica, shape = rectangle, fixedsize = false, width = 1]
  1 [label = 'Total Sample in MR file \n (n = 724115)']
  2 [label = 'Women who are not Pregnant or Post-Partum \n (n=615302)']
  3 [label = 'Adult Sample without missing height and weight or BMI data \n (n=595140)']
  4 [label = 'Final Sample for women \n (n =594489)']

    m1 [label = 'Pregnant or Post-Partum Women \n (n = 10211)']
    m2 [label = 'women less than 18 years old \n (n = 72790)']
    m3 [label = 'Missing Height and Weight, or BMI \n (n =19553) ']
    m4 [label = 'Missing Waist Circumference \n (n=609)']
    m5 [label = 'Missing BMI data (n=651)']
  
  
    node [shape=none, width=0, height=0, label='']
    p1
    p2
    p3
    p4
    p5

    p1->2
    p3->3
    p5->4

    edge [dir=TB, arrowhead=none]
    1->p1
    2->p2->p3
    3->p4->p5
    
    
   edge [dir = LR ,arrowhead = normal] 
    {rank=same; p1 -> m1}
    {rank=same; p2 -> m2}
    {rank=same; p3 -> m3}
    {rank=same; p4 -> m4}
    {rank=same; p5 -> m5}
      
 
  }
")

grViz(graphviz_code)


