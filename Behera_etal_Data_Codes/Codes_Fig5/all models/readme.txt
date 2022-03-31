#Description of the main script file
stability.m:      This script contains the main source code for the stability analysis. Once run it
                  generates the eigenvalues of all the models.
#Other script files
connectdstbl.m:   This is the function containing the connectivitiy weights (Ws and Js)
                  of the network, for all the models
eigen_values.m:   This script contains the matlab function which calculates the eigenvalues of a particular model
myfun.m:          This script contains the matlab function which calculates the Jacobian matrix inorder to find the 
                  eigenvalues.

Basic steps to reproduce simulation results
                  run stability.m file. 

Output:
                  The code generates the eigenvalues of all the models and plots the
                  maximum tonic and phasic eigenvalues, as per Fig.5b of the manuscript.

