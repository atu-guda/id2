#set terminal pngcairo enhanced mono notransparent font "PT Serif, 14" size 800,600
set terminal pngcairo enhanced color notransparent font "PT Serif, 16" size 800,600
set output "pq1.png"

set size 0.95,0.98
set grid lt rgb "#222222" lw 1 dashtype "_";
set border 15 lw 2;
set mxtics 5;
set mytics 5;

set key top right #; Right ; #width -12 ;
#set title "I({/Symbol t})";
set label 2 "{/:Italic*1.4 p}" at graph 1.01,0.02
set label 3 "{/:Italic*1.4 q}" at graph -0.07,1.03

# main curve
a3 = 0.07
a2 = -0.30
a1 = 0.5
a0 = 0.1

# pulse
p_p = 3.0
y_p = 0.5
w0 = 0.3

#q_gamma = 1.0;


f(x) = x * ( x * ( a3 * x  +  a2 )  +  a1 ) + a0;
dq(x) = 3 * a3 * x * x + 2 * a2 * x + a1;

p_min = 0.0;      p_max = 4.0;
q_min = f(p_min); q_max = f(p_max);
D_q = q_max - q_min;
a_q = D_q / (p_max - p_min);

# for arrow at min defivative
dlt_p = p_max / 20.0;
p_low_d = - a2 / ( 3 * a3 ); p_low_d_l = p_low_d - dlt_p; p_low_d_r = p_low_d + dlt_p;
q_low_d = f( p_low_d );      q_low_d_l = f( p_low_d_l );  q_low_d_r = f( p_low_d_r );
dq_low_d = dq( p_low_d );

p_o = 2.8; q_o = f(p_o);

s(p) = y_p * exp(-(p-p_p)*(p-p_p)/(w0*w0));

F(q,qg) = exp( - (q-q_o)**2 / qg**2 );


print "q_min = ", q_min,  "  q(", p_max, ") = ", q_max, " D_q = ", D_q;
print  "  q(", p_low_d, ") = ", q_low_d, " dq= ", dq_low_d;

set style line 1 lt rgb "black"   lw 2;
set style line 2 lt rgb "red"     lw 1 dashtype "-.-";
set style line 3 lt rgb "#00FF55" lw 1;
set style line 4 lt rgb "#555555" lw 2;
set style line 5 lt rgb "#993333" lw 2;
set style line 6 lt rgb "#772222" lw 2;

set object 1 circle center p_low_d,q_low_d   size 0.02 fc rgb "blue"    fillstyle solid;
set object 2 circle center p_max,q_max       size 0.03 fc rgb "green"   fillstyle solid;
set object 3 circle center p_o,q_o           size 0.03 fc rgb "red"     fillstyle solid;
set object 4 circle center p_o,q_min+a_q*p_o size 0.03 fc rgb "#993333" fillstyle solid;

set arrow 1 from p_low_d_l,q_low_d_l to p_low_d_r,q_low_d_r head lt rgb "blue" lw 3;

plot [0:p_max] [0:2] \
   f(x)           notitle w l ls 1, \
   dq(x)          notitle w l ls 3, \
   q_min + x*a_q  notitle w l ls 4, \
   F(f(x),0.2)    notitle w l ls 5, \
   F(f(x),0.1)    notitle w l ls 6;

#  f(x)+s(x)      notitle w l ls 2, \
