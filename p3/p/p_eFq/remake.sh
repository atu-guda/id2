#!/bin/bash

for t in q_dem_01_task_*.gp ; do
  t1="${t%.gp}"
  task="${t1#q_dem_*_task_}"
  echo "$t" "$task"
  gnuplot -c q_p_eFq.gp "$task"
done

