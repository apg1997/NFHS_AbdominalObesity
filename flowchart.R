library(DiagrammeR)

grViz("digraph flowchart {
  # node definitions with substituted label text
  node [fontname = Helvetica, shape = rectangle, fixedsize = false, width = 1] 
  1 [label = 'Box 1']
  2 [label = 'Box 2']
  3 [label = 'Box 3']

  m1 [label = 'm1']
  m2 [label = 'm2 \\100']
  m3 [label = 'm3']
  
  node [shape=none, width=0, height=0, label='']
  p1 -> 2; p3 -> 3
  {rank=same; p1 -> m1}
  {rank=same; p2 -> m2}
  {rank=same; p3 -> m3}
  
  edge [dir=none, arrowhead=none]
  1 -> p1; 2 -> p2; p2 -> p3
}")


