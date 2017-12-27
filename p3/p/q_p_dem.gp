#set terminal pngcairo enhanced mono notransparent font "PT Serif, 14" size 800,600
set terminal pngcairo enhanced color notransparent font "PT Serif, 16" size 800,600
set output "q_p_dem.png"

set size 0.95,0.98
set grid lt rgb "#222222" lw 1 dashtype "_";
set border 15 lw 2;
set mxtics 5;
set mytics 5;

set key top right #; Right ; #width -12 ;
#set title "I({/Symbol t})";
set label 2 "{/:Italic*1.4 p}" at graph 1.01,0.02
set label 3 "{/:Italic*1.4 q}" at graph -0.07,1.03



p_min = 20.0;  p_max = 60.0;
p_dlt = p_max - p_min;
p_l   = 30.0; p_c = 40.0; p_r = 50.0; p_ox = 41;

load "q_dem_2060_all.gp"
load "q_dem.gp";

print "q_dlt= ", p_dlt;
print "p_l= ", p_l, "  p_c= ", p_c, "  p_r= ", p_r, "  p_ox= ", p_ox;
q_l = q_all( p_l );
q_c = q_all( p_c );
q_r = q_all( p_r );
q_ox= q_all( p_ox );
print "q_l= ", q_l, "  q_c= ", q_c, "  q_r= ", q_r, "  q_ox= ", q_ox;
# print  "  q(", p_low_d, ") = ", q_low_d, " dq= ", dq_low_d;

set style line 1 lt rgb "black"   lw 2;
set style line 2 lt rgb "red"     lw 1;
set style line 3 lt rgb "black"   lw 1 dashtype "-";
set style line 4 lt rgb "#55FF55" lw 2;
# set style line 5 lt rgb "#993333" lw 2;
# set style line 6 lt rgb "#772222" lw 2;
#
# set object 1 circle center p_low_d,q_low_d   size 0.02 fc rgb "blue"    fillstyle solid;
# set object 2 circle center p_max,q_max       size 0.03 fc rgb "green"   fillstyle solid;
# set object 3 circle center p_o,q_o           size 0.03 fc rgb "red"     fillstyle solid;
# set object 4 circle center p_o,q_min+a_q*p_o size 0.03 fc rgb "#993333" fillstyle solid;
#
# set arrow 1 from p_low_d_l,q_low_d_l to p_low_d_r,q_low_d_r head lt rgb "blue" lw 3;
set arrow 10 from p_l,1.9 to p_l,8.0 nohead lt rgb "blue"  lw 2;
set arrow 11 from p_c,1.9 to p_c,8.0 nohead lt rgb "green" lw 2;
set arrow 12 from p_r,1.9 to p_r,8.0 nohead lt rgb "red"   lw 2;

set label 10 "{/:Italic*1.2 p_l}" at first p_l,1.9
set label 11 "{/:Italic*1.2 p_c}" at first p_c,1.9
set label 12 "{/:Italic*1.2 p_r}" at first p_r,1.9

plot [p_min:p_max] [2:8] \
   q_all(x)   title "a" w l ls 1, \
   q_s20(x)   title "b" w l ls 2, \
   q_lin(x)   title "c" w l ls 3;

