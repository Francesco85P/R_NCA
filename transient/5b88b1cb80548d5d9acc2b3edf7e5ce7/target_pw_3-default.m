
% PottersWheel model definition file
% This file is constructed as a Matlab function.
% The returned variable "m" contains all required information of the model.
% For more information visit www.potterswheel.de

function m = target_pw()

m             = pwGetEmptyModel();

% General information:
% ID fields require no blanks and only A-Za-z_0-9. 
% Use [] in order to get default values for a field.
% You can use an arbitrary number of strings in arrays like {'string1','string2', ...}.

%% Meta information

m.name        = 'target_pw3';
m.description = 'Autogenerated PottersWheel Model Target';
m.authors     = {};
m.dates       = {''};
m.modelFormat = 3.0;


%% X: Dynamic variables
% m = pwAddX(m, ID, startValue, type, minValue, maxValue, unit, compartment, name, description, typeOfStartValue)
% ID: Unique name of the player, e.g. 'ProtA'
% startValue: the initial concentration (default 0)
% type: 'global', 'local' (default), 'fix' (startValue will be fitted globally or locally or is fixed)
% minValue and maxValue specify the minimum and maximum of the startValue during fitting
% unit: not yet used
% compartment: compartment of the player. Default: first given compartment
% typeOfStartValue: 'amount' or 'concentration' (default)
% Not listed players which occur in the reactions get the default settings

m = pwAddX(m,     'TMP'         ,     0, 'fix',    [], [],   [], 'Central');


%% ODE
% m = pwAddODE(m, leftHandSide, rightHandSide)

m = pwAddODE(m,  'TMP'         ,     '+(0.0) '   );


%% C: Compartments
% m = pwAddC(m, ID, size,  outside, spatialDimensions, name, unit, constant)

m = pwAddC(m,     'Central');

%% K: Dynamical parameters
% m = pwAddK(m, ID, value, type, minValue, maxValue, unit, name, description)
% type: 'global', 'local', 'fix' (during fitting)
% value: value of the parameter
% minValue and maxValue specify the extreme values for fitting
% E.g. m = pwAddK(m, 'Stat_act', 1.2, 'global', 0, 100);

m = pwAddK(m,     'PNAME'       ,        1.0       ,  'fix', eps,   Inf);


%% A: 

% m = pwAddA(m, lhs, rhs, [], [], type)



%% U - Driving inputs
% m = pwAddU(m, *ID, *uType, *uTimes, *uValues, compartment, name, description, u2Values, alternativeIDs, designerProps, classname, referenceXID, unit, uFormula)
% Some entities like the ligand concentration can be controlled externally.
% Here you can specify the default dependency on time of these players.
% When loading an experiment, the default dependency is usually overwritten.
% Example:
% A step input starting at t=-100 at level 0, jumping at t=0 to 5 and decreasing
% at t=10 to level 2:
% m = pwAddU(m, 'L', 'steps', [-100 0 10], [0 5 2], 'cell');



%% Y - Observables
% m = pwAddY(m, *ID, *rhs, errorModelRhs, noiseType, unit, name, description, alternativeIDs, designerProps, classname)
% ID:          ID of the observable
% rhs:         right-hand side of the observation, i.e. a function of all dynamic variables X, dynamic parameters K, and observation parameters S
% errorModel:  formula to calculate the standard deviation depending on measurements y
% noiseType:   'Gaussian' (other noise types will be implemented later)
% Example with Gaussian noise with a standard deviation of 10 % relative to y plus 5 % absolute (relative to max(y) over all y):
% m = pwAddY(m, 'totalStat_obs', 'scale_totalStat_obs * (Stat + pStat + 2 * pStatDimer)', '0.10 * y + 0.05 * max(y)', 'Gaussian');

m = pwAddY(m,   'TMP_OBS',  '0.0');


