function [SIMINT_t, SIMINT_x, y] = auto_sim(S, SIMINT_output_times, SIMINT_initialstate)
% % DO NOT EDITED THIS FILE
% %
% % This function was automatically generated by 
% % build_system.pl       
% %
% % It is called internally by run_simulation_generic.m

% Running simulation
SIMINT_runsim_string  = sprintf('[SIMINT_t, SIMINT_x] = %s(@auto_odes, SIMINT_output_times, SIMINT_initialstate,[],S);', S.default_simopts.Solver);

eval(SIMINT_runsim_string);

%
% Mapping outputs
%
for SIMINT_TIMEIDX=1:length(SIMINT_t)
SIMINT_TIME = SIMINT_t(SIMINT_TIMEIDX);
% Pulling out the states for the current time
x = interp1(SIMINT_t, SIMINT_x, SIMINT_TIME);
% pulling out the inputs at the current simulation time
u = interp1(S.blocks.all_inputs(:,1), S.blocks.all_inputs, SIMINT_TIME);
% The first column is the interpolated time,
% so we remove that one.
u = u(1,2:end);
% Defining parameters 
PNAME       = u(1); 



%  Mapping states to their common names 
TMP          = x(1);
 y(SIMINT_TIMEIDX,1) = 0.0;
end
