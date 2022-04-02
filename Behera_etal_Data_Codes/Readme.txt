# Degeneracy and stability in neural circuits of neuromodulators

Degeneracy of a neural circuit is the ability of the neural circuit to produce the same output
despite being structurally different. Our model gives an insight into the possibility of 
degeneracy at the source level of the neural circuits, i.e. at the level of neuromodulators.

## Getting Started

These instructions will get you a copy of the source code up and running on your local machine for the purpose of reproducing the results outlined in our main manuscript and supplementary information.


### Prerequisites

MATLAB 2018b+ (not tested on versions prior to this)

### Description of the folders containing script files 


activity profiles_all models:  The folder contains the codes to plot the activity profiles of a particular model
                               as per the user input. It also computes the maximum percentage of deviations of 
                               the activity profiles of neuronal populations of a particular model, from their
                               experimental values. read the readme.txt file in the folder before simulating.
Codesa_Fig.3a:                 The folder contains the codes to generate the activity profiles as per the experimental outcomes.
                               The source code plots the figure 3a, as per the manuscript.

Codes_Fig5:                    The folder contains two subfolders.
                               a. all models: The folder contains the source codes to do the stability analysis for all the models as described
                               in the manuscript. It generates the eigenvalues of all the models and the figure 5b as shown in the manuscript
                               b. individual model: The folder contains the source codes to do the stability analysis of a particular model as 
                               described in the manuscript. The main source code produces the eigenvalues of a particular model. When used for
                               the model#1, it plots the figure 5a, as in the manuscript.
## Basic steps to reproduce simulation results
Step 1: open a particular folder as described above 
Step 2: open the corresponding readme.txt file
Step 3: run the main script file and follow the steps, as described in the readme.txt file.

## Directly reproducing the simulation results as per the manuscript
In order to directly reproduce a particular figure, without simulation, as described in the manuscript and the supplementary file,
please use the corresponding Source Data_Fig.xx.xlsx file, where xx is the figure name.

## Tables
Table model nos_condition.docx: The document has a table describing the model numbers, under the given condition.
Table translating the variables.docx: The document contains the table, enlisting the nomenclatures of various variables
                                      as described manuscript and their respective translations in the codes.


## Contributing

The code is not open for public contribution yet. This may change in the future.

## Authors

* **Chandan Kumar Behera** - (https://github.com/ckbehera/Isrc/tree/master/New%20folder)

Main contributors to this research project: Alok Joshi, DaHui Wang, Trevor Sharp, KongFatt Wong-Lin
