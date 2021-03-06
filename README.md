[![DOI](https://zenodo.org/badge/411613959.svg)](https://zenodo.org/badge/latestdoi/411613959)
# Supporting data and code for: A high diversity of mechanisms endows ALS-inhibiting herbicide resistance in the invasive common ragweed (*Ambrosia artemisiifolia* L.).
*This repository contains the R code to produce the maps of the resistance of* Ambrosia artemisiifolia *to ALS inhibitors monitoring in France. This study is part of Ingvild Loubet PhD.*

![alt text](https://am3pap005files.storage.live.com/y4mFbmM409M-6KGoIdbPAEHb29Zk9ZVY43jux5SYxDJIXjkEw-khE_FtObGN88rHoDDYD1kdj7_psn4uAnCvfa5-u0vlua_V4SC_rNARYNPnhJY2dG5w8SLATXP6e-OJBvMIseBphzO7d00xzOr-cKdP8omo93FluViO4d9pJAl8z_fLm6Mk8_OlRGUpuR8hcgi?width=1584&height=588&cropmode=none)


## Context
ALS inhibitors herbicides are prone to evolution of resistance against them. In the fight against this phenomenon, monitoring is a cornerstone of a global strategy. In this study, we have investigated the resistance of *Ambrosia artemisiifolia* against two ALS inhibitors herbicides using bio- and biomolecular- assays. Combining these tools, we have demonstrated the importance of non-target site resistance and the diversity of target site resistance mutations. 


## Datasets
In this section, you will find the list of the data sets used to produce the maps. The data files can be found in the "data" folder. For the data tables, the name of the different variables are listed and explained as well. There are 4 data sets used in this study.  

+ **data_carto_france.txt:** the first data set contains the data for all the populations analyzed. Each line correspond to one population. The following information for each population can be found in this table: 
  + *Code_ID*: population's ID, this is a unique string of character
  + *Latitude*: the latitude coordinate of the population in Degrees and decimal WGS84 format
  + *Longitude*: the longitude coordinate of the population in Degrees and decimal WGS84 format
  + *Arg574*, *Arg654*, *Gln197*, *Glu376*, *Ile578*, *Leu574*, *Ser197*, *Thr197*, *Thr205-1*, *Thr205-2* and *Val205*: Mutation identified in the partial ALS gene sequence. Each column stands for one mutation. The absence of the mutation is indicated by a *'0'* while the presence of the mutation is indicated by *'1'*
  + *SeqMeth*: The sequencing method used. Either *'NGS'* or *'Sanger'*
  + *SampRound*: The sampling strategy to which the population belongs to
  + *Imz*: results of the Imazamox bioassay. *'R'* stands for a resistance population, *'S'* stands for a sensitive population and *'untest'* indicate population that were tested with a Imazamox bioassay
  + *Tbn*: results of the Tribenuron bioassay. *'R'* stands for a resistance population, *'S'* stands for a sensitive population and *'untest'* indicate population that were tested with a Tribenuron bioassay

+ **data_carto_pheno.txt:** the second data set contains the results of the 43 populations investigated both using bioassays and ALS sequencing. The following information for each population can be found in this table:
  + *Code_ID*: population's ID, this is a unique string of character for each population. Each ID is listed twice in the table. One for the actual population and the other for the coordinates of the label
  + *Latitude*: the latitude coordinate of the population or of the tag of the population in Degrees and decimal WGS84 format
  + *Longitude*: the longitude coordinate of the population or of the tag of the population n Degrees and decimal WGS84 format
  + *SeqMeth*: The sequencing method used. Either *'NGS'* or *'Sanger'*
  + *SampRound*: *'origin'* for the line and coordinates related to the actual population and *'newLoc'* for the line and coordinates related to the tag of the population
  + *Imz*: Imazamox resistance status of the population. Either *'R'*, *'S'* or *'Fail'* for resistant, sensitive or failed bioassay, respectively
  + *Tbn*: Tribenuron resistance status of the population. Either *'R'*, *'S'* or *'Fail'* for resistant, sensitive or failed bioassay, respectively
  + *RS*: was there one or several mutation related to target site resistance detected in the ALS sequence. Either *'Nomut'* or *'Mut'*, if a mutation has been detected or not in the population, respectively

+ **DEP_SHP.RDATA:** the third data set contains geographical information to plot the french administrative layer 'departement'

+ **REG_SHP.RDATA:** the fourth data set contains geographical information to plot the french administrative layer 'regions'

These two geographical data files were obtained using the data from the [IGN website](http://professionnels.ign.fr/adminexpress). The version of the data used is the "Edition Novembre 2017".


## R scripts
In this section, you will find the list of the different scripts used in the article to produce the maps with a brief description of their purpose.

+ **AmbALSmo_load.R:** the script to load the different data sets, functions and packages that are necessary for producing the maps in the R environment. 
+ **AmbALSmo_mapGeno.R:** the script to produce Figure 1 map, the results of the high throughput sequencing monitoring. 
+ **AmbALSmo_mapPheno.R:** the script to produce Figure 3 map, the results of the bioassay monitoring. 
+ **AmbALSmo_mapSampling.R:** the script to produce Supplementary Figure 2 map. The map displays the location of all the populations investigated in this study. 
+ **AmbALSmo_addi_maps.R:** the script to produce additional maps that were not included in the final version of the manuscript. 


## Citation
You can cite the related study as follow: 
+ Loubet I., Caddoux L., Fontaine S., Michel S., Pernin F., Barr??s B., Le Corre V. and D??lye C.
[A high diversity of mechanisms endows ALS-inhibiting herbicide resistance in the invasive common ragweed (Ambrosia artemisiifolia L.). *Scientific Reports*, 11:19904, 2021. doi:10.1038/s41598-021-99306-9.](https://doi.org/10.1038/s41598-021-99306-9)

If you want to use (some of) the code found on this page or if you want to cite this repository:
+ Benoit Barr??s. [Supporting data and code for: A high diversity of mechanisms endows ALS-inhibiting herbicide resistance in the invasive common ragweed (Ambrosia artemisiifolia L.). Zenodo.](https://zenodo.org/badge/latestdoi/411613959)
