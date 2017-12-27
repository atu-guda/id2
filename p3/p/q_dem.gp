# q_dem test function

u(x)=(x-p_min)/p_dlt;
q_all(x) = q_00 + c_lin * u(x) + c_s1 * sin( pi * u(x) ) + c_s2 * sin( 2 * pi * u(x) ) + c_s20 * sin( 20 * pi * u(x) );
q_s20(x) = q_00 + c_lin * u(x) + c_s20 * sin( 20 * pi * u(x) );
q_lin(x) = q_00 + c_lin * u(x);

