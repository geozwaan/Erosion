This repository provides the input files, jobscripts, ASPECT source code, installation details and additional plugins, FastScape source code and installation details, ASPECT output log files, parameter overview files, ParaView state files and Python postprocessing files, used for the simulations presented in the following peer-reviewed publication:

**Rift-inversion orogens are potential hotspots for natural H2 generation**

by

Zwaan, F., Brune, S., Glerum, A., Vasey, D. A., Naliboff, J. B., Manatschal, G., and Gaucher, E. C.

Published by Science Advances (2025). https://doi.org/10.1126/sciadv.adr3418

____________________________________________________________________________________________________________________________________________________________
Accompanying videos and analysis results used in this work can be found in the following GFZ data publication: 
**Results of detailed serpentinization and associated natural H2 potential in rift-inversion orogens, as simulated using numerical models**

by

Zwaan, F., Brune. S., Glerum, A. C., Vasey, D., Naliboff, J. B., Manatschal, G., and Gaucher, E. C.  

Published by GFZ Data Services (2025). https://doi.org/10.5880/GFZ.2.5.2025.001

# Documentation

The numerical simulations presented in this paper were run with the geodynamics code ASPECT ([https://aspect.geodynamics.org/](https://aspect.geodynamics.org/)), coupled with FastScape ([https://fastscape.org/](https://fastscape.org/)) for surface processes modelling. ParaView ([https://www.paraview.org/](https://www.paraview.org/)) was used for visualization and analysis of our models, as well as Python.

## ASPECT version

The ASPECT source code provided in this repository corresponds to commit f747113 of the ASPECT branch [https://github.com/EstherHeck/aspect/tree/fastscape_update_again_erosional_base_level-undo2780-before-rebase-on13mai22-Kais-and-ZhiChens-Version/](https://github.com/EstherHeck/aspect/tree/fastscape_update_again_erosional_base_level-undo2780-before-rebase-on13mai22-Kais-and-ZhiChens-Version/) and can be found in the folder /ASPECT_source. This branch is based on commit 84d40e7 of the ASPECT 2.4.0-pre development branch.

## FastScape version

The FastScape source code provided in this repository corresponds to commit 8063c7c of the FastScape branch [https://github.com/EstherHeck/fastscapelib-fortran/commits/fastscape-with-stratigraphy-for-aspect/](https://github.com/EstherHeck/fastscapelib-fortran/commits/fastscape-with-stratigraphy-for-aspect/) and can be found in the folder /FastScape_source. This branch is built on commit 18f2588 of [https://github.com/fastscape-lem/fastscapelib-fortran](https://github.com/fastscape-lem/fastscapelib-fortran).


## Additional ASPECT plugins

For the initial model conditions, we used the ASPECT plugins in the folder /plugins. The file CMakeLists.txt can be used to install these plugins as shared libraries against your ASPECT installation.

## ASPECT input files, run files, and parameter files

The ASPECT input files and run files used to run and automatically restart each model until the designated model duration was reached can be found in the folders /prm_input_files and /run_files. The parameter files in folder /Parameter_overviews contain an extensive overview of all parameters used in each simulation and record those parameters that deviate from the standard values as also specified in the input files.

## ASPECT log files

The ASPECT log files that log the progression of each individual simulation can be found in the folders /log_files

## ASPECT and FastScape Installation details

ASPECT was built using the underlying library deal.II 9.3.0 on the German HLRN cluster Lise. deal.II used:

- 32 bit indices and vectorization level 3 (512 bits)

- Trilinos 12.18.1

- p4est 2.2.0

See also the detailed.log file in folder /ASPECT_log for more details.

**In order to install ASPECT with FastScape:**

- Create a build directory for FastScape and compile it with an added flag for creating a shared library.

	cmake -DBUILD_FASTSCAPELIB_SHARED=ON /path/to/fastscapemake

	make

- Compile ASPECT with a flag FASTSCAPE_DIR pointing to the fastscape build folder with the shared library

	cmake -DFASTSCAPE_DIR=/path/to/fastscape/build -DDEAL_II_DIR=/path/to/dealii -DCMAKE_BUILD_TYPE=Release /path/to/aspect

	make

## Postprocessing

Python files used for postprocessing (plotting of statistical data and rearrangement of topography data for visualization in ParaView) are found in /Python_model_postprocessing.

## ParaView 

We used version 5.10 of ParaView for visualization and analysis of our models. The relevant ParaView states are provided in /ParaView_state_files.
