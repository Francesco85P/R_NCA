#
# How do we include time-varying inputs? 
#


# p[0]   to p[p-1]     represents the system parameters    (p=> number of parameters)
# p[p]   to p[p+r-1]   represents the rate inputs          (r=> number of infusion rate inputs) 
# p[p+r] to p[p+r+v-1] represents the timevarying inputs   (v=> number of time varying inputs) 


function system_DYDT!(SIMINT_du, SIMINT_u, SIMINT_p, SIMINT_TIME)
# System Parameters 
PNAME        = SIMINT_p[1]

# Mapping states in SIMINT_u to their named values
TMP          = SIMINT_u[1]


# Defining the differential equations
SIMINT_dTMP  = (0.0)


# Mapping back to du variables
SIMINT_du[1] = SIMINT_dTMP 


return(SIMINT_du)
end 
