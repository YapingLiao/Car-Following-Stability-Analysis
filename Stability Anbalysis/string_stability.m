function [lambda_2,isStringStable] = string_stability(p,s)

b=p(1);a=p(2);vm=p(3);d0=p(4);

V_prime = @(s) vm/(1+tanh(2))*(1-tanh(s/d0-2).^2);

f_s = a*V_prime(s);
f_v = -a;
f_dV = b*(s.^-2);

%Wilson Ward Criteria:

% lambda_2 = (f_s./(f_v.^3)).*((f_v.^2)./2 - f_dV.*f_v-f_s);
% 
% isStringStable = (lambda_2 < 0);

%Monteil Criteria:

f_1 = f_v;f_2=f_s;f_3=f_dV;
lambda_2 = f_1.^2 - 2*f_1.*f_3-2*f_2;

isStringStable = (lambda_2 > 0); 


end
