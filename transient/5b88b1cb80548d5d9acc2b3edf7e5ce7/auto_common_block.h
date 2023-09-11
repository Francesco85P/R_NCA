/* Internal Variables */
double SIMINT_TIME = 0.0;
/* Initializing parameters */
double PNAME       = 0.0; 



/* Initializing derivatives  */
double SIMINT_dTMP  = 0.0; 



/* Mapping states to their common names */
double TMP          = 0.0;



/* Defining internal values */
SIMINT_TIME = ssGetT(S);



/* 
 * Mapping C inputs to variable names and 
 * defining secondary parameters  
 */


/* Defining parameters */
PNAME       = u[0]; 



/* Mapping states to their common names */
TMP          = x[0];
