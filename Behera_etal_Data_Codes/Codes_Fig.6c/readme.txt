#Description of the script file
allmodels_drugs.m: This script consists of the main source code to test the drug effect on a particular model.

                    The code shows the effect of a particular magnitude of drugs.
                    The code plots the activity profiles of a particular model
                    as per the user inputs. It also computes the maximum percentage 
                    of deviations of the activity profiles of neuronal populations
                    of a particular model, from their experimental values.
#Other script files
template.m:         This script consists of the souce code for the neural cirucit model
                    of model #k, the outputs of which are considered as the template, as described in the manuscript
connectdstbl2.m:    This is the function containing the connectivitiy weights (Ws and Js)
                    of the network for all the models
connectdv2old.m:    This consists of the connectivity weights of the template, i.e. model #k


#Basic steps to reproduce simulation results
run allmodels_drugs.m file
step 1: presss 1 and 2 for type-I and type-II serotonin respectively
step 2: press 0 and 1 for aversive and reward stimulus respectively
step 3: enter name of the model from a to l to simulate 
step 4: enter the magnitude of drug to be administered

Outputs of the main source code 
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

