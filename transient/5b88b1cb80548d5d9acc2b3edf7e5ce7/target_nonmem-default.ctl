$PROBLEM problem placeholder
; Currently the NONMEM target is being developed
; and it is not considered usable.

$INPUT
; No data file specified 


$DATA ; No data file specified 


$SUB ADVAN13 TOL=4 

$MODEL 

; Defining the compartment names
COMP=(TMP)                    ; # 1 



$PK
; Defining the system parameters
PNAME         = THETA(1)
 
; Defining the iiv variables
 
   

; Defining the static 
; secondary parmaeters
 

; Initial conditions
A_0(1) = 0.0          ; TMP 



$DES 

; creating the default internal time variable
SIMINT_TIME = TIME
; Mapping the amounts to meaningful names
TMP         =  A(1) 


; Defining secondary paraemters that can
; change with time


; Differential equations for each compartment
SIMINT_dTMP           = (0.0)


; Mapping thes named ODEs above back to the 
; appropriate DADT variables
DADT(1) = SIMINT_dTMP 


$ERROR
; The SIEB (Simulation Internal Error Block) prefix
; is added to variables that are used in both
; the DES and ERROR blocks

; creating the default internal time variable
SIEB_TIME = TIME

; Mapping the states to their names
SIEB_TMP         =  A(1) 


; Defining the dynamic
; secondary parameters


;mapping variance parameters to named values


$THETA
(0.0,         1.0,         INF         );  1 PNAME         hr 



$OMEGA BLOCK(0)


$SIGMA
; No variance parameters defined
; See: <VP> 


