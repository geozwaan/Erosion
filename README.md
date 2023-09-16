This repository provides the input files, restart files, ASPECT installation details and additional ASPECT plugins, FastScape installation details, log files, parameter overview files, Paraview state files and Python model postprocessing files, used for the manuscript

**Rift-inversion orogens are potential hotspots for natural H2 generation**

by

Zwaan, F., Brune, S., Glerum, A., Vasey, D. A., Naliboff, J. B., Manatschal, G., and Gaucher, E. C.

submitted to Nature Geoscience

Preprint link: XXXXXX

# Documentation

The numerical simulations presented in this paper were run with the geodynamics code ASPECT ([https://aspect.geodynamics.org/](url)), coupled with FastScape for surface processes modelling (https://fastscape.org/). Paraview (https://www.paraview.org/) was used for visualization and analysis of our models.

## ASPECT version

The ASPECT input files provided in this repository correspond to **commit a1f0aa5** of the ASPECT branch

[https://github.com/EstherHeck/aspect/tree/fastscape_update_again](url)

This branch is built on **commit 84d40e7** of the ASPECT main version, which can be found at [https://github.com/geodynamics/aspect](url). A link to **a1f0aa5** can be found in the folder /ASPECT

## Additional ASPECT plugins

For the initial model conditions, we used the ASPECT plugins in the folder /plugins. The file CMakeLists.txt can be used to install these plugins as shared libraries against your ASPECT installation.

## ASPECT input file

The ASPECT input files can be found in the folder /prm_input_files

## ASPECT log and parameter overview files

The ASPECT log files and parameter overviews files of each individual model can be found in the folders /log_files and /Parameter_overviews

## ASPECT Installation details

ASPECT was built using the underlying library ddeal.II 9.3.0 on the German HLRN cluster Lise. deal.II used:

- 32 bit indices and vectorization level 3 (512 bits)

- Trilinos 12.18.1**

- p4est 2.2.0

## FastScape version

We used FastScape version XXXX

## FastScape intallation details

XXXX

## ASPECT-Fastscape coupling

XXXX

## Paraview 

We used version 10.0 of Paraview version for visualization and analysis of our models. The relevant Paraview states are provided in /Paraview_state_files
