#include <R.h>

static double parms[1];

#define PNAME        parms[0]




/* initializing the parameters and forcing functions  */
void initparams(void (* odeparms)(int *, double *))
{
    int N=1;
    odeparms(&N, parms);
}



/* Derivatives and outputs  */
void derivs (int *neq, 
             double *t, 
             double *y, 
             double *ydot,
             double *yout, 
             int *ip)
{

if (ip[0] <1) error("nout should be at least 1");

/* Start Initializing variables 
*/
double SIMINT_TIME = 0.0;

/* States and ODEs */
double TMP          = 0.0;
double SIMINT_dTMP  = 0.0;
/* Outputs*/
double TMP_OBS      = 0.0;
double SIMINT_TS_time = 0.0;
double SIMINT_TS_sys_time = 0.0;

/* Done Initializing variables */

/* System time and time scales*/
SIMINT_TIME = *t; 
SIMINT_TS_time    = SIMINT_TIME;
SIMINT_TS_sys_time = SIMINT_TIME*1.0;




/* Mapping states to named variables */
TMP          = y[0];




/* Defining the ODEs*/
SIMINT_dTMP          = (0.0);


/* Mapping back to ydot variables */
ydot[0] = SIMINT_dTMP;


/* Defining the outputs*/
TMP_OBS      = 0.0;


/* Mapping back to yout variables */
/* States */
/* Model Outputs */
yout[0] = TMP_OBS;
/* System Parameters */
yout[1] = PNAME;
/* Covariates */
/* Time Scales */
yout[2] = SIMINT_TS_time;
yout[3] = SIMINT_TS_sys_time;

}
