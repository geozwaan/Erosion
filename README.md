This repository provides the input file, ASPECT installation details and additional ASPECT plugins used for the manuscript

Rift-inversion orogens are potential hotspots for natural H2 generation

by

Zwaan, F., Brune, S., Glerum, A., Vasey, D., Naliboff, J., Manatschal, G., and Gaucher, E. C.

submitted to Nature Geoscience

Preprint link: XXXXXX

# Documentation

The numerical simulations presented in this paper were run with the geodynamics code ASPECT ([https://aspect.geodynamics.org/](url)).

## ASPECT version

The ASPECT input files provided in this repository correspond to **commit a1f0aa5** of the ASPECT branch

[https://github.com/EstherHeck/aspect/tree/fastscape_update_again](url)

This branch is built on **commit 84d40e7** of the ASPECT main version, which can be found at [https://github.com/geodynamics/aspect](url). A copy of **a1f0aa5** can be found in the folder /src.

## Additional ASPECT plugins

For the initial model conditions, we used the ASPECT plugins in the folder /plugins. The file CMakeLists.txt can be used to install these plugins as shared libraries against your ASPECT installation.

## ASPECT input file

The ASPECT input file can be found in the folder /prms.

## Installation details

ASPECT was built using the underlying library ddeal.II 9.3.0 on the German HLRN cluster Lise. deal.II used:

- 32 bit indices and vectorization level 3 (512 bits)

- Trilinos 12.18.1**

- p4est 2.2.0



