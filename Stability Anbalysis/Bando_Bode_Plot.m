function [amp_factors] = Bando_Bode_Plot(p,s)

omega_vals = -3:.01:1;
omega_vals = 10.^omega_vals;
amp_factors = Bando_Transfer_Function_Val(p,s,omega_vals);
amp_factors_dB = 20*log10(amp_factors);
log_omega_vals = log10(omega_vals);

figure()
hold on
plot(log_omega_vals,amp_factors_dB,'LineWidth',2)
plot([log_omega_vals(1) log_omega_vals(end)],[0,0],'k--','LineWidth',.5)
ylabel('Magnitude [dB]')
xlabel('Log_{10} Frequency (rad/s)')

end

