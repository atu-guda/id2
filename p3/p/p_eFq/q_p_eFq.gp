set terminal pngcairo enhanced color notransparent font "PT Serif, 16" size 800,600

set size 0.95,0.98
set grid lt rgb "#222222" lw 1 dashtype "_";
set border 15 lw 2;
set mxtics 5;
set mytics 5;
set tmargin at screen 0.88 ;

set style line 1 lt rgb "black"   lw 2;
set style line 2 lt rgb "red"     lw 1;
set style line 3 lt rgb "black"   lw 1 dashtype "-";
set style line 4 lt rgb "#55FF55" lw 2;
set style line 5 lt rgb "#555555" lw 1 dashtype "-.-";
set style line 6 lt rgb "#772222" lw 1;

set key top right #; Right ; #width -12 ;
#set title "I({/Symbol t})";
set label 2 "{/:Italic*1.4 p}" at graph 1.01,0.02
set label 3 "{/:Italic*1.4 q,F}" at graph -0.07,1.03

task = "good"

print "ARGC= ", ARGC;
if( ARGC > 0 ) {
  print "ARG1= " . ARG1;
  task = ARG1;
}
print "task= ", task;

taskfile = "q_dem_01_task_" . task . ".gp";
# load "q_dem_01_flat.gp"
load taskfile
q_gamma = 0.2;
load "q_dem.gp";

set output "q_p_eFq_" . task . ".png"

print "p_l= ", p_l, "  p_c= ", p_c, "  p_r= ", p_r, "  p_o= ", p_o;
print "p_dlt= ", p_dlt;
q_l = q_all( p_l );
q_c = q_all( p_c );
q_r = q_all( p_r );
q_o = q_all( p_o );
print "q_l= ", q_l, "  q_c= ", q_c, "  q_r= ", q_r, "  q_o= ", q_o;
# print  "  q(", p_low_d, ") = ", q_low_d, " dq= ", dq_low_d;
F(x)=exp( -((q_o - q_all(x))/(q_gamma))**2 );
F_l = F(p_l); F_c = F(p_c); F_r = F(p_r);

pr_l = p_l - p_c; pr_c = 0; pr_r = p_r - p_c;
Fr_l = F_l - F_c; Fr_c = 0; Fr_r = F_r - F_c;
print "F_l= ", F_l, "  F_c= ", F_c, "  F_r= ", F_r;
print "Fr_l= ", Fr_l, "  Fr_c= ", Fr_c, "  Fr_r= ", Fr_r;

den = pr_l * pr_l * pr_r - pr_l * pr_r * pr_r;
# if( abs(den))
a1 =   ( Fr_r * pr_l * pr_l - Fr_l * pr_r * pr_r ) / den;
a2 = - ( Fr_r * pr_l - Fr_l * pr_r ) / den;
if( a2 < 0 ) {
  pr_e = - a1 / ( 2 * a2 );
} else {
  if( F_r > F_l ) {
    pr_e = pr_r;
  } else {
    pr_e = pr_l;
  }
}
p_e = p_c + pr_e;
print "a1= ", a1, " a2= ", a2, " pr_e= ", pr_e, " p_e= ", p_e;

Fa(x)= F_c + a1 * (x-p_c) + a2 * (x-p_c)**2;


set label 4 "{/*0.8 q_{dem}=q_{00}+c_{lin}p + c_{s1} sin({/Symbol p}p) + c_{s1} sin(2{/Symbol p}p) +  c_{s20} sin(20{/Symbol p}p) (" . task . ")" at graph 0.02,1.14
str5 = sprintf("{/*0.8 q_{00}= %.3f c_{lin}= %.3f c_{s1}= %.3f c_{s2}= %.3f c_{s20}= %.3f q_{/Symbol g}= %.2f", q_00, c_lin, c_s1, c_s2, c_s20, q_gamma );
set label 5 str5  at graph 0.02,1.10
str6 = sprintf("{/*0.8 p_o= %.3f p_l= %.3f p_c= %.3f p_r= %.3f p_e= %.3f q_o= %.3f q_l= %.3f q_c= %.3f q_r= %.3f ", p_o, p_l, p_c, p_r, p_e, q_o, q_l, q_c, q_r );
set label 6 str6  at graph 0.02,1.06

#
set object 1 circle center p_l,F_l size 0.005 fc rgb "blue"  fillstyle solid;
set object 2 circle center p_c,F_c size 0.005 fc rgb "green" fillstyle solid;
set object 3 circle center p_r,F_r size 0.005 fc rgb "red"   fillstyle solid;
#
# set arrow 1 from p_low_d_l,q_low_d_l to p_low_d_r,q_low_d_r head lt rgb "blue" lw 3;
set arrow 10 from first p_l, graph -0.05 to first p_l, graph 1.0 nohead lt rgb "blue"  lw 2;
set arrow 11 from first p_c, graph -0.05 to first p_c, graph 1.0 nohead lt rgb "green" lw 2;
set arrow 12 from first p_r, graph -0.05 to first p_r, graph 1.0 nohead lt rgb "red"   lw 2;
set arrow 13 from first p_o, graph -0.05 to first p_o, graph 1.0 nohead ls 5;
set arrow 14 from first p_e, graph -0.08 to first p_e, graph 1.0 nohead ls 6;

set label 10 "{/:Italic*1.2 p_l}" at first p_l, graph -0.02
set label 11 "{/:Italic*1.2 p_c}" at first p_c, graph -0.02
set label 12 "{/:Italic*1.2 p_r}" at first p_r, graph -0.02
set label 13 "{/:Italic*1.2 p_o}" at first p_o, graph -0.02
set label 14 "{/:Italic*1.2 p_e}" at first p_e, graph -0.09

plot [p_min:p_max] [q_min:q_max] \
   q_all(x)   title "q(p)"   w l ls 1, \
   q_o+0*x    title "q_o"    w l ls 5, \
   F(x)       title "F(p)"   w l ls 6, \
   Fa(x)      title "F_{ap}" w l ls 3;

