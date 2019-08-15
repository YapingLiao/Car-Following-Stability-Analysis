function [lambda_2] = string_stability(p,v,s)

b=p(1);a=p(2);vm=p(3);d0=p(4);

V_prime(s) = vm/(1+tanh(2))*(1-tanh(s/d0-2)).^2;

f_s = -a*V_prime(2);
f_v = -a;
f_dV = s*(1/b);


% f_s = ((Bando_FTL_Accel(p,v,v,s+.01)-(Bando_FTL_Accel(p,v,v,s)))./.01);
% f_v = ((Bando_FTL_Accel(p,v+.01,v,s)-(Bando_FTL_Accel(p,v,v,s)))./.01);
% f_dV = ((Bando_FTL_Accel(p,v,v+.01,s)-(Bando_FTL_Accel(p,v,v,s)))./.01);


lambda_2 = (f_s./(f_v.^3)).*((f_v.^2)./2 - f_dV.*f_v-f_s);


end

