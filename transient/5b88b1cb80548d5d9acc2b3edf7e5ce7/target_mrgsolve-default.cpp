$PARAM @annotated
PNAME                : 1.0        : hr



$CMT @annotated
TMP                  : -- 


$MAIN





$OMEGA @annotated @block




$ODE
double SIMINT_TIME  = SOLVERTIME;
 
//Defining the differential equations
dxdt_TMP             = (0.0);



$TABLE
SIMINT_TIME  = TIME;
// Initialzing model outputs
double TMP_OBS                 = 0.0; 
 
TMP_OBS                        = 0.0;


$CAPTURE TMP_OBS
