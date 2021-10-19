[![DOI](https://zenodo.org/badge/411613959.svg)](https://zenodo.org/badge/latestdoi/411613959)
# Supporting data and code for: A high diversity of mechanisms endows ALS-inhibiting herbicide resistance in the invasive common ragweed (*Ambrosia artemisiifolia* L.).
*This repository contains the R code to produce the maps of the resistance of* Ambrosia artemisiifolia *to ALS inhibitors monitoring in France. This study is part of Ingvild Loubet PhD.*

![alt text](https://am3pap005files.storage.live.com/y4mFbmM409M-6KGoIdbPAEHb29Zk9ZVY43jux5SYxDJIXjkEw-khE_FtObGN88rHoDDYD1kdj7_psn4uAnCvfa5-u0vlua_V4SC_rNARYNPnhJY2dG5w8SLATXP6e-OJBvMIseBphzO7d00xzOr-cKdP8omo93FluViO4d9pJAl8z_fLm6Mk8_OlRGUpuR8hcgi?width=1584&height=588&cropmode=none)


## Context
 


## Datasets
In this section, you will find the list of the data sets used to produce the maps. The data files can be found in the "data" folder. For the data tables, the name of the different variables are listed and explained as well. There are 6 data sets used in this study.  

+ **data_carto_france.txt:** the first data set contains the data for all the indivudals analyzed. Each line correspond to one individuals and the following information for each individuals can be found in this table: 
  + *Code_ID*: population's ID, this is a unique string of character
  + *Latitude*: the latitude coordinate of the population in Degrees and decimal WGS84 format
  + *Longitude*: the latitude coordinate of the population in Degrees and decimal WGS84 format
  + *Arg574*, *Arg654*, *Gln197*, *Glu376*, *Ile578*, *Leu574*, *Ser197*, *Thr197*, *Thr205-1*, *Thr205-2* and *Val205*: Mutation identified in the partial ALS gene sequence. Each column stands for one mutation. The absence of the mutation is indicated by a *'0'* while the presence of the mutation is indicated by *'1'*
  + *SeqMeth*: The sequencing method used. Either *'NGS'* or *'Sanger'*
  + *SampRound*: The sampling strategy to which the population belongs to
  + *Imz*: results of the Imazamox bioassay. *'R'* stands for a resistance population, *'S'* stands for a sensitive population and *'untest'* indicate population that were tested with a Imazamox bioassay
  + *Tbn*: results of the Tribenuron bioassay. *'R'* stands for a resistance population, *'S'* stands for a sensitive population and *'untest'* indicate population that were tested with a Tribenuron bioassay


## R scripts
In this section, you will find the list of the different scripts used in the article to produce the maps with a brief description of their purpose.

+ **AmbALSmo_load.R:** the script to load the different data sets, functions and packages that are necessary for producing the maps in the R environment. 
+ **AmbALSmo_mapGeno.R:** the script to produce Figure 1 map, the results of the high throughput sequencing monitoring. 
+ **AmbALSmo_mapPheno.R:** the script to produce Figure 3 map, the results of the bioassay monitoring. 
+ **AmbALSmo_mapSampling.R:** the script to produce Supplementary Figure 2 map. The map displays the location of all the populations investigated in this study. 
+ **AmbALSmo_addi_maps.R:** the script to produce additionnal maps that were not included in the final version of the manuscript. 


## Citation
You can cite the related study as follow: 
+ Ingvild Loubet, Laëtitia Caddoux, Séverine Fontaine, Séverine Michel, Fanny Pernin, Benoit Barrès, Valérie Le Corre, Christophe Délye
[A high diversity of mechanisms endows ALS-inhibiting herbicide resistance in the invasive common ragweed (Ambrosia artemisiifolia L.). *Scientific Reports*, 11:19904, 2021. doi.org/10.1038/s41598-021-99306-9.](https://doi.org/10.1038/s41598-021-99306-9)

If you want to use (some of) the code found on this page or if you want to cite this repository:
+ Benoit Barrès. bbarres/AmbroALSmonito: [Supporting data and code for: A high diversity of mechanisms endows ALS-inhibiting herbicide resistance in the invasive common ragweed (Ambrosia artemisiifolia L.). Zenodo; 2021.](https://zenodo.org/badge/latestdoi/411613959)
