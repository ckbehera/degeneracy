#Description of the main sript file
template.m:          This is the main script file that contains the source code. 
The code generates the activity profiles as per the experimental outcomes
for a particular condition :serotonin type
                            reward/punishment outcomes
The activity profiles of this code are considered as the template, as in Fig.3a 
of the manuscript 

#Other script files
connectdv2old.m file: This contains the matlab function depicting the connection strengths between different 
neuronal populations

#Basic steps to reproduce simulation results
run template.m file
step 1: presss 1 and 2 for type-I and type-II serotonin respectively
step 2: press 0 and 1 for aversive and reward stimulus respectively

Output:
Plots a figure showing the activity profiles of all the neuronal populations
under the user input conditions, as per the actual experimental outcomes.


