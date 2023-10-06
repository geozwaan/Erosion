This repository provides the input files, restart files, ASPECT installation details and additional ASPECT plugins, FastScape installation details, log files, parameter overview files, Paraview state files and Python model postprocessing files, used for the manuscript

**Rift-inversion orogens are potential hotspots for natural H2 generation**

by

Zwaan, F., Brune, S., Glerum, A., Vasey, D. A., Naliboff, J. B., Manatschal, G., and Gaucher, E. C.

submitted to Nature Geoscience

Preprint link: XXXXXX

# Documentation

The numerical simulations presented in this paper were run with the geodynamics code ASPECT ([https://aspect.geodynamics.org/](https://aspect.geodynamics.org/)), coupled with FastScape ([https://fastscape.org/](https://fastscape.org/))for surface processes modelling. Paraview ([https://www.paraview.org/](https://www.paraview.org/)) was used for visualization and analysis of our models.

## ASPECT version

The ASPECT input files provided in this repository correspond to commit f747113 of the ASPECT branch [https://github.com/EstherHeck/aspect/tree/fastscape_update_again_erosional_base_level-undo2780-before-rebase-on13mai22-Kais-and-ZhiChens-Version/](https://github.com/EstherHeck/aspect/tree/fastscape_update_again_erosional_base_level-undo2780-before-rebase-on13mai22-Kais-and-ZhiChens-Version/) and can be found in the folder /ASPECT_source.

## Fastscape version

The Fastscape input files provided in this repository correspond to commit 8063c7c of the FastScape branch [https://github.com/EstherHeck/fastscapelib-fortran/commits/fastscape-with-stratigraphy-for-aspect/](https://github.com/EstherHeck/fastscapelib-fortran/commits/fastscape-with-stratigraphy-for-aspect/) and can be found in the folder /FastScape_source.


## Additional ASPECT plugins

For the initial model conditions, we used the ASPECT plugins in the folder /plugins. The file CMakeLists.txt can be used to install these plugins as shared libraries against your ASPECT installation.

## ASPECT input files, run files, and parameter files

The ASPECT input files and run files used to run and automatically restart each model until the designated model duration was reached can be found in the folders /prm_input_files and /run_files. The parameter files in folder /Parameter_files contain an extensive overview of all parameters used in each model, and record those parameters that deviate from the standard values.

## ASPECT log files

The ASPECT log files and parameter overviews files that log the progression of each individual model can be found in the folders /log_files

## ASPECT and FastScape Installation details

ASPECT was built using the underlying library ddeal.II 9.3.0 on the German HLRN cluster Lise. deal.II used:

- 32 bit indices and vectorization level 3 (512 bits)

- Trilinos 12.18.1

- p4est 2.2.0

See also the detailed.log file in folder /ASPECT_log for more details

**In order to install ASPECT with FastScape:**

- Create a build directory for fastscape and compile it with an added flag for creating a shared library.
	cmake -DBUILD_FASTSCAPELIB_SHARED=ON /path/to/fastscapemake
	make

- Compile ASPECT with a flag FASTSCAPE_DIR pointing to the fastscape build folder with the shared library
	cmake -DFASTSCAPE_DIR=/path/to/fastscape/build -DDEAL_II_DIR=/path/to/dealii -DCMAKE_BUILD_TYPE=Release /path/to/aspect
	make

## Postprocessing

Python files used for postprocessing (plotting of statistical data and rearrangement of topography data for visualization in Paraview) are found in /Python_model_postprocessing

## Paraview 

We used version 5.10 of Paraview for visualization and analysis of our models. The relevant Paraview states are provided in /Paraview_state_files
