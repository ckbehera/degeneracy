#Description of the main script file
run model_stability.m file. This script file consists of the main source code for the stability analysis of a particular
                            model.

                           The code analyses the stability by showing the eigenvalues of a particular model
                           and plots the eigenvalues of phasic and tonic activities, as per the figure 5a.

#Other script files
eigen_values.m:   This script contains the matlab function which calculates the eigenvalues of a particular model
myfun.m:          This script contains the matlab function which calculates the Jacobian matrix inorder to find the 
                  eigenvalues.
connectdstbl.m:   This is the function containing the connectivitiy weights (Ws and Js)
                  of the network for all the models
connectdv2old.m:  This consists of the connectivity weights of the template, i.e. model #k

#Basic steps to reproduce simulation results
run model_stability.m file
step 1: presss 1 and 2 for type-I and type-II serotonin respectively
step 2: press 0 and 1 for aversive and reward stimulus respectively
step 3: enter name of the model from a to l to simulate 

outputs of the code: 
1. percentages of deviations for the activity profiles of the model
from the actual activity profiles, as per the experimental outcomes.
2. figure 1: actual activity profiles of the neuronal populations
   figure 2: activity profiles of the neuronal populations, within 
             the allowable limits [maximum allowable percentages of deviations:
                                   Dopamine: 10%
                                   Serotonin: 10%
                                   GABA DRN: 16%
                                   GABA VTA: 16%
                                   Glu:      10%]
   figure 3: percentage of deviations of the models activity profiles
             from the activity profiles as per the experiments
   figure 4: the maximum eigenvalues during tonic and phasic activity
3. eigenvalues of the model.


