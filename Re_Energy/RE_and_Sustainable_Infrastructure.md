# Renewable Energy and Sustainable Infrastructure
PRISMS Team  
November, 2017  



## Data Description
http://open.canada.ca/data/en/dataset/7e50d70e-f462-48ea-97f5-6c0bc48cfd14 

## Load Library

```r
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(knitr)
library(kableExtra)
```

## Import Datasets

```r
RE_Capacity <- read_csv("Data/Renewable_energy_Capacity.csv")
RE_Generation <- read_csv("Data/Renewable_energy_Generation.csv")
RE_Dictionary <- read_csv("Data/RE_Dictionary.csv")
```

## Tidy Datasets

```r
RE_Capacity <- RE_Capacity %>%
  rename(Data_Capacity = Data) %>%
  unite(RSV, Region, Source, Year)

RE_Generation <- RE_Generation %>%
  rename(Data_Generation = Data) %>%
  unite(RSV, Region, Source, Year)

RE_Full <- full_join(RE_Capacity, RE_Generation, by = "RSV") %>%
  separate(RSV, into = c("Region", "Source", "Year"), sep = "_") %>%
  rename(Capacity_MW = Data_Capacity) %>%
  rename(Generation_GWh = Data_Generation) %>%
  select(-Unit.x, -Unit.y)
```

## Renewable Energy Dataset

```r
kable(RE_Full, "html") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) %>%
  scroll_box(width = "100%", height = "400px")
```

<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:400px; overflow-x: scroll; width:100%; "><table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<thead><tr>
<th style="text-align:left;"> Region </th>
   <th style="text-align:left;"> Source </th>
   <th style="text-align:left;"> Year </th>
   <th style="text-align:right;"> Capacity_MW </th>
   <th style="text-align:right;"> Generation_GWh </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 3254.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 3254.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 3254.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 2739.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 2163.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 858.920 </td>
   <td style="text-align:right;"> 3848.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 860.190 </td>
   <td style="text-align:right;"> 4165.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 860.190 </td>
   <td style="text-align:right;"> 4289.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 885.590 </td>
   <td style="text-align:right;"> 4121.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 885.590 </td>
   <td style="text-align:right;"> 3964.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 885.590 </td>
   <td style="text-align:right;"> 3711.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 271.000 </td>
   <td style="text-align:right;"> 1725.16800 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 313.100 </td>
   <td style="text-align:right;"> 1855.16900 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 313.100 </td>
   <td style="text-align:right;"> 1870.36200 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 313.100 </td>
   <td style="text-align:right;"> 1917.38800 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 323.200 </td>
   <td style="text-align:right;"> 1861.50000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 340.200 </td>
   <td style="text-align:right;"> 1908.77700 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 358.697 </td>
   <td style="text-align:right;"> 1972.19000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 413.797 </td>
   <td style="text-align:right;"> 2089.11769 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 416.646 </td>
   <td style="text-align:right;"> 2250.10000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 438.300 </td>
   <td style="text-align:right;"> 2065.20000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 428.000 </td>
   <td style="text-align:right;"> 2148.50000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1.600 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1.600 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 27.43320 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 32.47250 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 26.87160 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 38.12960 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 38.67690 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 41.86550 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 44.67350 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 22.000 </td>
   <td style="text-align:right;"> 44.94140 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 209.000 </td>
   <td style="text-align:right;"> 1251.61400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 176.000 </td>
   <td style="text-align:right;"> 1251.61400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 176.000 </td>
   <td style="text-align:right;"> 1251.61400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 148.000 </td>
   <td style="text-align:right;"> 2668.61600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 207.000 </td>
   <td style="text-align:right;"> 1159.35980 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 207.000 </td>
   <td style="text-align:right;"> 1322.06600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 207.000 </td>
   <td style="text-align:right;"> 1206.44820 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 207.000 </td>
   <td style="text-align:right;"> 1242.51950 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 207.000 </td>
   <td style="text-align:right;"> 1701.64950 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 592.000 </td>
   <td style="text-align:right;"> 2962.21380 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 574.000 </td>
   <td style="text-align:right;"> 3898.58370 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 278.160 </td>
   <td style="text-align:right;"> 646.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 278.160 </td>
   <td style="text-align:right;"> 646.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 278.160 </td>
   <td style="text-align:right;"> 646.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 229.660 </td>
   <td style="text-align:right;"> 439.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 229.660 </td>
   <td style="text-align:right;"> 550.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 229.660 </td>
   <td style="text-align:right;"> 844.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 239.640 </td>
   <td style="text-align:right;"> 1089.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 239.640 </td>
   <td style="text-align:right;"> 1233.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 239.640 </td>
   <td style="text-align:right;"> 1614.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 239.640 </td>
   <td style="text-align:right;"> 1724.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 244.840 </td>
   <td style="text-align:right;"> 2053.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 653.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 653.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 653.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 672.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 664.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 577.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 565.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 574.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 550.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 606.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 606.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 68.620 </td>
   <td style="text-align:right;"> 317.80150 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 66.120 </td>
   <td style="text-align:right;"> 317.80150 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 66.120 </td>
   <td style="text-align:right;"> 317.80150 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 66.120 </td>
   <td style="text-align:right;"> 322.10350 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 66.120 </td>
   <td style="text-align:right;"> 244.82110 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 66.120 </td>
   <td style="text-align:right;"> 378.40910 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 66.120 </td>
   <td style="text-align:right;"> 362.73330 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 66.120 </td>
   <td style="text-align:right;"> 386.65500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 66.120 </td>
   <td style="text-align:right;"> 330.86410 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 112.560 </td>
   <td style="text-align:right;"> 648.05560 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 112.560 </td>
   <td style="text-align:right;"> 640.82950 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 5.45800 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 4.81600 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 5.07700 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 5.11900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 4.99800 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 4.89100 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 6.56677 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 4.36073 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1788.000 </td>
   <td style="text-align:right;"> 7875.01670 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1794.600 </td>
   <td style="text-align:right;"> 8010.05700 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1794.600 </td>
   <td style="text-align:right;"> 8019.64910 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1718.100 </td>
   <td style="text-align:right;"> 8801.69510 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1787.200 </td>
   <td style="text-align:right;"> 6647.49690 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1852.200 </td>
   <td style="text-align:right;"> 8883.32910 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1881.947 </td>
   <td style="text-align:right;"> 9365.49050 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1937.047 </td>
   <td style="text-align:right;"> 9857.96709 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1965.296 </td>
   <td style="text-align:right;"> 10614.37010 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 2419.990 </td>
   <td style="text-align:right;"> 12020.70967 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2396.890 </td>
   <td style="text-align:right;"> 13107.21533 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 5839.600 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 5863.600 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 5917.900 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 5918.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 5971.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 5735.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 5631.800 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 5690.327 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 6258.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 6258.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 6266.800 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1818.380 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1800.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1800.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1822.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1822.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1826.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1826.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1826.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1756.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1651.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1651.380 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 97.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 6437.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 6329.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 6339.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 6077.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 6077.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 4487.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 4275.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 3296.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2291.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 153.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 541.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 541.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 541.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 541.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 541.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 490.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 490.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 490.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 490.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 490.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 490.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1288.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 16021.620 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 15919.240 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 15983.540 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 15743.940 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 15796.940 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 13923.940 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 13608.440 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 12687.967 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 12180.940 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 9937.640 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 9793.820 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 12847.490 </td>
   <td style="text-align:right;"> 60327.01600 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 12613.697 </td>
   <td style="text-align:right;"> 54247.22800 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 12660.898 </td>
   <td style="text-align:right;"> 64287.01400 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 12733.048 </td>
   <td style="text-align:right;"> 58699.09000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 12858.248 </td>
   <td style="text-align:right;"> 56462.24800 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 13201.771 </td>
   <td style="text-align:right;"> 54151.85500 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 13672.762 </td>
   <td style="text-align:right;"> 61037.38200 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 13672.762 </td>
   <td style="text-align:right;"> 65140.91100 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 13686.852 </td>
   <td style="text-align:right;"> 59223.45400 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 14206.752 </td>
   <td style="text-align:right;"> 57572.87300 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 15029.000 </td>
   <td style="text-align:right;"> 57374.36100 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 869.000 </td>
   <td style="text-align:right;"> 2316.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 874.350 </td>
   <td style="text-align:right;"> 1966.38000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 874.350 </td>
   <td style="text-align:right;"> 2113.03000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 874.350 </td>
   <td style="text-align:right;"> 2149.92000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 874.350 </td>
   <td style="text-align:right;"> 1695.30000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 874.350 </td>
   <td style="text-align:right;"> 1620.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 879.000 </td>
   <td style="text-align:right;"> 2035.62327 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 894.000 </td>
   <td style="text-align:right;"> 2318.68000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 894.000 </td>
   <td style="text-align:right;"> 2027.80000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 894.000 </td>
   <td style="text-align:right;"> 1861.10000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 894.000 </td>
   <td style="text-align:right;"> 1709.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 854.000 </td>
   <td style="text-align:right;"> 4572.91000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 853.000 </td>
   <td style="text-align:right;"> 4031.93800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 853.000 </td>
   <td style="text-align:right;"> 4392.98500 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 853.000 </td>
   <td style="text-align:right;"> 4029.86900 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 853.000 </td>
   <td style="text-align:right;"> 2961.92400 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 853.000 </td>
   <td style="text-align:right;"> 3866.04800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 853.000 </td>
   <td style="text-align:right;"> 4641.15300 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 853.000 </td>
   <td style="text-align:right;"> 4240.37800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 863.000 </td>
   <td style="text-align:right;"> 4448.81100 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 864.000 </td>
   <td style="text-align:right;"> 4706.09000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 889.000 </td>
   <td style="text-align:right;"> 3425.61200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 5037.790 </td>
   <td style="text-align:right;"> 36439.65500 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 5037.790 </td>
   <td style="text-align:right;"> 33650.53800 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 5037.790 </td>
   <td style="text-align:right;"> 33513.21700 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 5037.790 </td>
   <td style="text-align:right;"> 34588.46400 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 5037.790 </td>
   <td style="text-align:right;"> 33549.05400 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 5037.790 </td>
   <td style="text-align:right;"> 33268.92200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 5037.790 </td>
   <td style="text-align:right;"> 34206.29000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 5037.790 </td>
   <td style="text-align:right;"> 32185.43600 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 5238.790 </td>
   <td style="text-align:right;"> 35337.16500 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 5238.790 </td>
   <td style="text-align:right;"> 34494.87400 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 5238.790 </td>
   <td style="text-align:right;"> 34694.20110 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 8504.760 </td>
   <td style="text-align:right;"> 35479.84100 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 8410.080 </td>
   <td style="text-align:right;"> 36032.18100 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 8410.080 </td>
   <td style="text-align:right;"> 34315.28800 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 8416.080 </td>
   <td style="text-align:right;"> 39615.42800 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 8424.080 </td>
   <td style="text-align:right;"> 39684.50600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 8463.080 </td>
   <td style="text-align:right;"> 32555.29300 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 8524.080 </td>
   <td style="text-align:right;"> 34907.28600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 8524.080 </td>
   <td style="text-align:right;"> 33887.13600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 8565.080 </td>
   <td style="text-align:right;"> 37936.08800 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 8972.000 </td>
   <td style="text-align:right;"> 39199.46400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 8768.000 </td>
   <td style="text-align:right;"> 37300.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 36473.477 </td>
   <td style="text-align:right;"> 173356.23500 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 36685.549 </td>
   <td style="text-align:right;"> 172591.11700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 37439.617 </td>
   <td style="text-align:right;"> 181099.75700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 38264.765 </td>
   <td style="text-align:right;"> 187891.24500 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 38414.050 </td>
   <td style="text-align:right;"> 189422.84200 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 38426.460 </td>
   <td style="text-align:right;"> 177410.35900 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 38183.753 </td>
   <td style="text-align:right;"> 189691.86700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 39216.800 </td>
   <td style="text-align:right;"> 191971.73000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 38433.353 </td>
   <td style="text-align:right;"> 202530.14400 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 40034.257 </td>
   <td style="text-align:right;"> 197207.36700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 40211.970 </td>
   <td style="text-align:right;"> 197667.96900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 948.950 </td>
   <td style="text-align:right;"> 3875.33200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 948.950 </td>
   <td style="text-align:right;"> 3730.62500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 948.950 </td>
   <td style="text-align:right;"> 2802.98100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 948.950 </td>
   <td style="text-align:right;"> 3543.11300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 948.950 </td>
   <td style="text-align:right;"> 2971.62600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 948.950 </td>
   <td style="text-align:right;"> 3325.35000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 956.800 </td>
   <td style="text-align:right;"> 3841.28800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 956.800 </td>
   <td style="text-align:right;"> 2857.28000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 956.800 </td>
   <td style="text-align:right;"> 3400.31200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 956.800 </td>
   <td style="text-align:right;"> 2963.11400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 956.800 </td>
   <td style="text-align:right;"> 2727.82400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 403.750 </td>
   <td style="text-align:right;"> 1075.36800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 403.750 </td>
   <td style="text-align:right;"> 1019.42000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 403.750 </td>
   <td style="text-align:right;"> 922.06300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 403.750 </td>
   <td style="text-align:right;"> 1095.09500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 403.750 </td>
   <td style="text-align:right;"> 1072.66600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 373.750 </td>
   <td style="text-align:right;"> 1006.74600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 375.580 </td>
   <td style="text-align:right;"> 1110.99200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 375.580 </td>
   <td style="text-align:right;"> 849.98100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 375.580 </td>
   <td style="text-align:right;"> 1003.98700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 375.580 </td>
   <td style="text-align:right;"> 1128.68600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 375.580 </td>
   <td style="text-align:right;"> 1003.30400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 6780.060 </td>
   <td style="text-align:right;"> 40498.23800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 6775.450 </td>
   <td style="text-align:right;"> 41709.86600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 6776.800 </td>
   <td style="text-align:right;"> 40048.49100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 6776.800 </td>
   <td style="text-align:right;"> 41790.38800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 6781.050 </td>
   <td style="text-align:right;"> 36728.17500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 6781.050 </td>
   <td style="text-align:right;"> 40278.70600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 6788.700 </td>
   <td style="text-align:right;"> 40016.89500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 6783.060 </td>
   <td style="text-align:right;"> 42186.46100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 6788.700 </td>
   <td style="text-align:right;"> 41424.41400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 6766.420 </td>
   <td style="text-align:right;"> 39047.82600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 6766.420 </td>
   <td style="text-align:right;"> 40332.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 65.000 </td>
   <td style="text-align:right;"> 259.10700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 41.700 </td>
   <td style="text-align:right;"> 251.86600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 43.000 </td>
   <td style="text-align:right;"> 250.24600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 246.57500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 253.95200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 253.95200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 260.34500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 252.69900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 262.68300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 233.91600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 252.74878 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 76.700 </td>
   <td style="text-align:right;"> 320.44300 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 76.700 </td>
   <td style="text-align:right;"> 334.60800 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 77.900 </td>
   <td style="text-align:right;"> 330.63200 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 77.900 </td>
   <td style="text-align:right;"> 348.29300 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 77.900 </td>
   <td style="text-align:right;"> 379.05600 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 77.900 </td>
   <td style="text-align:right;"> 380.43100 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 94.500 </td>
   <td style="text-align:right;"> 388.06600 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 94.500 </td>
   <td style="text-align:right;"> 430.19400 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 94.500 </td>
   <td style="text-align:right;"> 424.99000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 94.500 </td>
   <td style="text-align:right;"> 410.66800 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 94.500 </td>
   <td style="text-align:right;"> 421.88400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 72860.977 </td>
   <td style="text-align:right;"> 358520.14500 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 72721.016 </td>
   <td style="text-align:right;"> 349565.76700 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 73526.135 </td>
   <td style="text-align:right;"> 364075.70400 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 74442.133 </td>
   <td style="text-align:right;"> 373997.48000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 74728.868 </td>
   <td style="text-align:right;"> 365181.34900 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 75093.801 </td>
   <td style="text-align:right;"> 348117.66200 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 75421.665 </td>
   <td style="text-align:right;"> 372137.18730 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 76464.072 </td>
   <td style="text-align:right;"> 376320.88600 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 75952.355 </td>
   <td style="text-align:right;"> 388019.84800 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 78458.799 </td>
   <td style="text-align:right;"> 378825.97800 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 79279.760 </td>
   <td style="text-align:right;"> 376908.90390 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1320.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1425.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1425.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 4770.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 4324.500 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 4425.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 4823.400 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 5138.600 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 5217.500 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 5251.454 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 5682.755 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 5811.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 6160.630 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 7214.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1053.450 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1053.450 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1053.450 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1053.450 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1146.450 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1393.950 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1393.950 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1394.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1328.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1480.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1709.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 368.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2813.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 2907.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 2905.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 4344.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 4010.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 7122.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 7106.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 7499.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 7537.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 7038.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 7650.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 31.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 591.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 340.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 340.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 340.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 340.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 350.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 350.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 350.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 350.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 350.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 350.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 350.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 430.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 430.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 430.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 430.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 430.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 430.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 482.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 482.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 482.010 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 482.010 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 482.010 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 103.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 35.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 35.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 27.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 27.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 60.920 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 27.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 27.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 27.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 27.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 27.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 27.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 4.400 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 11263.800 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 11577.100 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 11668.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 13505.200 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 13623.120 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 17027.800 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 17097.954 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 17922.105 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 18022.560 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 18024.990 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 19923.760 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 11450.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 11990.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 11990.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 11990.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 11990.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 11990.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 11990.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 11990.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 13640.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 13568.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 13568.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 675.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 675.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 675.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 675.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 675.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 675.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 675.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 680.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 680.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 680.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 680.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 680.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 680.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 680.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 680.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 705.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 705.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 705.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 12805.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 13345.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 13345.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 13345.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 13345.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 13345.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 13345.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 12670.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 14345.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 14273.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 14273.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 51.960 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 51.960 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 51.960 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 51.960 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 51.960 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 36.460 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 82.460 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 36.460 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 82.460 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 82.460 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 82.460 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 7.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1.170 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1.170 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1.170 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 5.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 5.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 5.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 16.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1.170 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 32.380 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 32.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 32.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 32.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 32.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 32.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 32.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 32.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 32.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 10.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 12.120 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2130.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 2125.685 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 2125.850 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 2126.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 2126.870 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 2128.170 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 2156.305 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 2156.305 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2156.305 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 2291.750 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2291.750 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1595.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1544.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1665.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1633.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1633.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1502.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1007.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1007.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 538.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 253.120 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1594.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1594.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1594.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1594.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1582.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1582.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1582.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1582.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1582.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1582.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1582.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 222.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 222.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 159.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 159.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 159.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 159.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 159.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 162.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 162.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 159.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 759.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 759.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 759.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 759.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 789.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 789.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 786.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 786.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 760.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 868.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 868.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 114.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 74.923 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 79.980 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 84.398 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 99.798 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 99.798 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 99.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 99.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 103.560 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 77.760 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 94.070 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 24.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 6753.580 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 6658.808 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 6785.030 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 6760.728 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 6794.398 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 6651.728 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 6227.805 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 5169.805 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 6207.625 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 5945.270 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 5651.990 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 2.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 6.400 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 6.400 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 3.500 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 3.500 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.400 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.400 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 16.750 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 20.480 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 25.770 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 32.720 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 94.570 </td>
   <td style="text-align:right;"> 5.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 281.130 </td>
   <td style="text-align:right;"> 123.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 419.400 </td>
   <td style="text-align:right;"> 398.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 645.300 </td>
   <td style="text-align:right;"> 842.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1018.700 </td>
   <td style="text-align:right;"> 1173.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1509.400 </td>
   <td style="text-align:right;"> 1816.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2119.000 </td>
   <td style="text-align:right;"> 3001.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.400 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.400 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.200 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.200 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.600 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.600 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.400 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.400 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.300 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.300 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.033 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.033 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 16.750 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 20.480 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 25.770 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 32.720 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 94.570 </td>
   <td style="text-align:right;"> 5.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 281.130 </td>
   <td style="text-align:right;"> 123.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 419.400 </td>
   <td style="text-align:right;"> 398.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 645.300 </td>
   <td style="text-align:right;"> 842.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1018.700 </td>
   <td style="text-align:right;"> 1173.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1524.503 </td>
   <td style="text-align:right;"> 1816.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2134.103 </td>
   <td style="text-align:right;"> 3001.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 15030.370 </td>
   <td style="text-align:right;"> 67773.67000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 14901.577 </td>
   <td style="text-align:right;"> 61597.58100 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 14948.778 </td>
   <td style="text-align:right;"> 71829.97700 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 15020.928 </td>
   <td style="text-align:right;"> 66072.06600 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 15248.128 </td>
   <td style="text-align:right;"> 65056.65100 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 15624.151 </td>
   <td style="text-align:right;"> 64223.73700 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 16286.612 </td>
   <td style="text-align:right;"> 69257.26100 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 16240.412 </td>
   <td style="text-align:right;"> 73584.44200 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 16467.902 </td>
   <td style="text-align:right;"> 67851.10000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 17090.602 </td>
   <td style="text-align:right;"> 67007.86200 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 17912.850 </td>
   <td style="text-align:right;"> 66564.66100 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 12007.950 </td>
   <td style="text-align:right;"> 68435.29740 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 11768.900 </td>
   <td style="text-align:right;"> 71777.67115 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 12062.900 </td>
   <td style="text-align:right;"> 72535.65900 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 12461.500 </td>
   <td style="text-align:right;"> 71649.51000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 12905.800 </td>
   <td style="text-align:right;"> 72171.10000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 12897.700 </td>
   <td style="text-align:right;"> 73568.50206 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 12993.101 </td>
   <td style="text-align:right;"> 73053.83951 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 13776.029 </td>
   <td style="text-align:right;"> 75076.50595 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 14475.296 </td>
   <td style="text-align:right;"> 78052.80000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 15198.480 </td>
   <td style="text-align:right;"> 82822.70000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 16279.350 </td>
   <td style="text-align:right;"> 81540.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 3742.800 </td>
   <td style="text-align:right;"> 19910.15600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 3878.800 </td>
   <td style="text-align:right;"> 19655.92800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 3878.800 </td>
   <td style="text-align:right;"> 20614.96100 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 3903.630 </td>
   <td style="text-align:right;"> 21766.54600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 3996.630 </td>
   <td style="text-align:right;"> 20768.42200 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 4249.130 </td>
   <td style="text-align:right;"> 20408.41400 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 4274.630 </td>
   <td style="text-align:right;"> 21195.35800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 4269.680 </td>
   <td style="text-align:right;"> 21251.77800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 4148.680 </td>
   <td style="text-align:right;"> 23181.93800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 4212.780 </td>
   <td style="text-align:right;"> 22204.13800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 4476.650 </td>
   <td style="text-align:right;"> 23598.61200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 5577.910 </td>
   <td style="text-align:right;"> 37076.84220 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 5661.480 </td>
   <td style="text-align:right;"> 34511.53750 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 5661.480 </td>
   <td style="text-align:right;"> 34429.37360 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 5661.480 </td>
   <td style="text-align:right;"> 35561.75060 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 5661.480 </td>
   <td style="text-align:right;"> 34185.32600 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 5661.480 </td>
   <td style="text-align:right;"> 33786.56400 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 5799.480 </td>
   <td style="text-align:right;"> 35140.02800 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 5815.980 </td>
   <td style="text-align:right;"> 33242.26190 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 6016.980 </td>
   <td style="text-align:right;"> 36388.56050 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 5995.380 </td>
   <td style="text-align:right;"> 35564.42750 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 5997.500 </td>
   <td style="text-align:right;"> 35757.47086 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 31575.210 </td>
   <td style="text-align:right;"> 159335.36500 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 32372.245 </td>
   <td style="text-align:right;"> 158623.92600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 32462.700 </td>
   <td style="text-align:right;"> 158892.95200 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 33916.100 </td>
   <td style="text-align:right;"> 166197.66400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 34097.520 </td>
   <td style="text-align:right;"> 148045.98980 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 36125.380 </td>
   <td style="text-align:right;"> 151115.38200 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 36647.785 </td>
   <td style="text-align:right;"> 155088.44020 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 36370.685 </td>
   <td style="text-align:right;"> 154729.94650 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 37906.085 </td>
   <td style="text-align:right;"> 162377.78250 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 37614.150 </td>
   <td style="text-align:right;"> 163914.35180 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 39344.750 </td>
   <td style="text-align:right;"> 159999.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 39259.687 </td>
   <td style="text-align:right;"> 180472.44300 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 40090.759 </td>
   <td style="text-align:right;"> 180460.96000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 41065.827 </td>
   <td style="text-align:right;"> 192010.11900 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 41920.475 </td>
   <td style="text-align:right;"> 193731.65200 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 42202.760 </td>
   <td style="text-align:right;"> 196305.70400 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 42088.170 </td>
   <td style="text-align:right;"> 184541.25700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 41619.443 </td>
   <td style="text-align:right;"> 196500.40900 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 41401.490 </td>
   <td style="text-align:right;"> 200557.99600 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 42675.043 </td>
   <td style="text-align:right;"> 209171.79800 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 44268.347 </td>
   <td style="text-align:right;"> 205687.92500 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 44563.380 </td>
   <td style="text-align:right;"> 208910.96900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 4231.250 </td>
   <td style="text-align:right;"> 21332.95400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 4231.250 </td>
   <td style="text-align:right;"> 18467.12000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 4231.250 </td>
   <td style="text-align:right;"> 17268.83500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 4327.250 </td>
   <td style="text-align:right;"> 14591.46900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 4424.250 </td>
   <td style="text-align:right;"> 13458.85700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 4373.250 </td>
   <td style="text-align:right;"> 11415.74500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 4480.100 </td>
   <td style="text-align:right;"> 11801.69400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 4480.100 </td>
   <td style="text-align:right;"> 10288.03900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 4505.100 </td>
   <td style="text-align:right;"> 15070.04200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 4505.300 </td>
   <td style="text-align:right;"> 16469.70300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 4505.300 </td>
   <td style="text-align:right;"> 14378.39984 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2447.370 </td>
   <td style="text-align:right;"> 12540.38150 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 2447.270 </td>
   <td style="text-align:right;"> 11539.28650 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 2452.470 </td>
   <td style="text-align:right;"> 12676.91950 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 2453.370 </td>
   <td style="text-align:right;"> 12314.77650 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 2453.070 </td>
   <td style="text-align:right;"> 11706.90010 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 2502.370 </td>
   <td style="text-align:right;"> 12067.11610 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 2650.600 </td>
   <td style="text-align:right;"> 11587.98630 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 2754.200 </td>
   <td style="text-align:right;"> 11078.88500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2760.180 </td>
   <td style="text-align:right;"> 10754.88910 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 2809.220 </td>
   <td style="text-align:right;"> 11032.58260 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2925.020 </td>
   <td style="text-align:right;"> 11028.20875 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 173.000 </td>
   <td style="text-align:right;"> 46.41700 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 173.000 </td>
   <td style="text-align:right;"> 43.77700 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 232.000 </td>
   <td style="text-align:right;"> 44.73200 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 232.000 </td>
   <td style="text-align:right;"> 149.98900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 311.000 </td>
   <td style="text-align:right;"> 357.06400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 324.000 </td>
   <td style="text-align:right;"> 466.47800 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 324.000 </td>
   <td style="text-align:right;"> 497.60400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 324.000 </td>
   <td style="text-align:right;"> 487.13000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 336.000 </td>
   <td style="text-align:right;"> 512.07600 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 366.400 </td>
   <td style="text-align:right;"> 606.99077 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 363.400 </td>
   <td style="text-align:right;"> 596.19313 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 7642.060 </td>
   <td style="text-align:right;"> 42136.35100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 7637.450 </td>
   <td style="text-align:right;"> 42768.07100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 7638.800 </td>
   <td style="text-align:right;"> 41583.31300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 7638.800 </td>
   <td style="text-align:right;"> 43206.68500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 7727.050 </td>
   <td style="text-align:right;"> 38168.66000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 7727.050 </td>
   <td style="text-align:right;"> 41742.83500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 7731.700 </td>
   <td style="text-align:right;"> 41604.01600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 7726.060 </td>
   <td style="text-align:right;"> 43702.50600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 7705.700 </td>
   <td style="text-align:right;"> 43077.13900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 7791.455 </td>
   <td style="text-align:right;"> 41053.96800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 7791.455 </td>
   <td style="text-align:right;"> 42313.74296 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 214.000 </td>
   <td style="text-align:right;"> 693.25030 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 151.623 </td>
   <td style="text-align:right;"> 686.00930 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 150.180 </td>
   <td style="text-align:right;"> 684.38930 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 167.298 </td>
   <td style="text-align:right;"> 739.46740 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 216.418 </td>
   <td style="text-align:right;"> 642.20450 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 182.698 </td>
   <td style="text-align:right;"> 555.12230 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 182.640 </td>
   <td style="text-align:right;"> 452.58010 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 191.840 </td>
   <td style="text-align:right;"> 447.39710 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 195.660 </td>
   <td style="text-align:right;"> 575.81830 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 170.160 </td>
   <td style="text-align:right;"> 729.14140 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 186.470 </td>
   <td style="text-align:right;"> 717.59178 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 110.040 </td>
   <td style="text-align:right;"> 342.85900 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 110.840 </td>
   <td style="text-align:right;"> 358.45200 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 112.040 </td>
   <td style="text-align:right;"> 354.28700 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 112.040 </td>
   <td style="text-align:right;"> 372.17800 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 112.040 </td>
   <td style="text-align:right;"> 401.66000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 112.270 </td>
   <td style="text-align:right;"> 405.39700 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 128.870 </td>
   <td style="text-align:right;"> 424.93400 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 128.870 </td>
   <td style="text-align:right;"> 454.55900 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 128.870 </td>
   <td style="text-align:right;"> 448.28100 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 128.903 </td>
   <td style="text-align:right;"> 433.35200 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 124.303 </td>
   <td style="text-align:right;"> 447.88400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 141.64500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 144.70900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 148.88100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 182.19900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 161.92500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 161.92500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 98.30800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 98.30700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> 98.30700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 54.315 </td>
   <td style="text-align:right;"> 157.59800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 54.315 </td>
   <td style="text-align:right;"> 187.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 122065.927 </td>
   <td style="text-align:right;"> 610237.63140 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 123479.474 </td>
   <td style="text-align:right;"> 600635.02850 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 124951.505 </td>
   <td style="text-align:right;"> 623074.39840 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 127869.151 </td>
   <td style="text-align:right;"> 626535.95250 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 129410.426 </td>
   <td style="text-align:right;"> 601430.46340 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 131921.929 </td>
   <td style="text-align:right;"> 594458.47450 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 133173.241 </td>
   <td style="text-align:right;"> 616702.45810 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 133533.626 </td>
   <td style="text-align:right;"> 624999.75350 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 137375.776 </td>
   <td style="text-align:right;"> 647560.53140 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 140205.492 </td>
   <td style="text-align:right;"> 647684.74010 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 144524.743 </td>
   <td style="text-align:right;"> 646039.73330 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 3254.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 3254.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 3254.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 810.920 </td>
   <td style="text-align:right;"> 2739.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 912.920 </td>
   <td style="text-align:right;"> 2197.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 960.920 </td>
   <td style="text-align:right;"> 3970.70000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1106.190 </td>
   <td style="text-align:right;"> 4649.90000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1106.190 </td>
   <td style="text-align:right;"> 4797.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1273.590 </td>
   <td style="text-align:right;"> 4980.80000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1376.390 </td>
   <td style="text-align:right;"> 5035.20000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1376.390 </td>
   <td style="text-align:right;"> 4917.30000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 522.000 </td>
   <td style="text-align:right;"> 2466.16800 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 699.300 </td>
   <td style="text-align:right;"> 2776.53500 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 838.300 </td>
   <td style="text-align:right;"> 3300.62900 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 838.300 </td>
   <td style="text-align:right;"> 3390.29000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 914.400 </td>
   <td style="text-align:right;"> 3419.40000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1063.400 </td>
   <td style="text-align:right;"> 3537.39800 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1223.697 </td>
   <td style="text-align:right;"> 4344.19000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1501.797 </td>
   <td style="text-align:right;"> 4690.11769 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1504.646 </td>
   <td style="text-align:right;"> 5308.10000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1878.700 </td>
   <td style="text-align:right;"> 5584.20000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1897.400 </td>
   <td style="text-align:right;"> 6237.50000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 15.800 </td>
   <td style="text-align:right;"> 91.91600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 573.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 620.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 574.39100 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 578.58200 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 506.58700 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 196.680 </td>
   <td style="text-align:right;"> 682.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 196.680 </td>
   <td style="text-align:right;"> 655.33600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 196.680 </td>
   <td style="text-align:right;"> 646.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 201.780 </td>
   <td style="text-align:right;"> 636.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 226.100 </td>
   <td style="text-align:right;"> 684.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 42.000 </td>
   <td style="text-align:right;"> 80.85320 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 125.950 </td>
   <td style="text-align:right;"> 357.58750 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 125.950 </td>
   <td style="text-align:right;"> 351.98660 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 125.950 </td>
   <td style="text-align:right;"> 449.98160 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 125.950 </td>
   <td style="text-align:right;"> 364.51200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 125.950 </td>
   <td style="text-align:right;"> 343.19600 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 263.950 </td>
   <td style="text-align:right;"> 746.90200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 280.450 </td>
   <td style="text-align:right;"> 915.42390 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 280.450 </td>
   <td style="text-align:right;"> 909.67150 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 280.850 </td>
   <td style="text-align:right;"> 955.99250 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 280.850 </td>
   <td style="text-align:right;"> 905.26976 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 240.450 </td>
   <td style="text-align:right;"> 1277.27200 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 610.480 </td>
   <td style="text-align:right;"> 1396.79300 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 692.770 </td>
   <td style="text-align:right;"> 1745.33200 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 962.720 </td>
   <td style="text-align:right;"> 4068.61600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1469.570 </td>
   <td style="text-align:right;"> 3464.35980 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1935.130 </td>
   <td style="text-align:right;"> 4245.06600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 2596.400 </td>
   <td style="text-align:right;"> 5504.44820 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 2905.300 </td>
   <td style="text-align:right;"> 6684.51950 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 3716.700 </td>
   <td style="text-align:right;"> 8074.64950 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 5591.400 </td>
   <td style="text-align:right;"> 11578.21380 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 7067.000 </td>
   <td style="text-align:right;"> 17099.58370 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 485.160 </td>
   <td style="text-align:right;"> 1062.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 595.160 </td>
   <td style="text-align:right;"> 1065.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 695.160 </td>
   <td style="text-align:right;"> 1263.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 756.660 </td>
   <td style="text-align:right;"> 1004.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 889.660 </td>
   <td style="text-align:right;"> 1872.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 893.660 </td>
   <td style="text-align:right;"> 2391.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1162.640 </td>
   <td style="text-align:right;"> 2489.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1593.640 </td>
   <td style="text-align:right;"> 3795.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2643.640 </td>
   <td style="text-align:right;"> 6335.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 3105.040 </td>
   <td style="text-align:right;"> 8374.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 3507.240 </td>
   <td style="text-align:right;"> 10991.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 653.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 653.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 127.300 </td>
   <td style="text-align:right;"> 653.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 223.300 </td>
   <td style="text-align:right;"> 672.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 322.300 </td>
   <td style="text-align:right;"> 934.13400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 322.300 </td>
   <td style="text-align:right;"> 966.12700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 421.300 </td>
   <td style="text-align:right;"> 1257.97300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 421.300 </td>
   <td style="text-align:right;"> 1306.95300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 421.300 </td>
   <td style="text-align:right;"> 1287.27100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 421.500 </td>
   <td style="text-align:right;"> 1391.85000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 421.500 </td>
   <td style="text-align:right;"> 1342.57584 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 103.320 </td>
   <td style="text-align:right;"> 403.24650 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 103.220 </td>
   <td style="text-align:right;"> 427.33650 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 108.420 </td>
   <td style="text-align:right;"> 474.78850 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 109.320 </td>
   <td style="text-align:right;"> 470.71250 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 109.320 </td>
   <td style="text-align:right;"> 398.83010 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 188.320 </td>
   <td style="text-align:right;"> 765.07910 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 282.720 </td>
   <td style="text-align:right;"> 1145.23030 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 386.320 </td>
   <td style="text-align:right;"> 1186.94400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 392.290 </td>
   <td style="text-align:right;"> 1096.27610 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 441.330 </td>
   <td style="text-align:right;"> 1396.73360 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 557.130 </td>
   <td style="text-align:right;"> 1655.90475 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 14.000 </td>
   <td style="text-align:right;"> 40.10400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 14.000 </td>
   <td style="text-align:right;"> 36.24900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 73.000 </td>
   <td style="text-align:right;"> 39.63300 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 73.000 </td>
   <td style="text-align:right;"> 147.12400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 152.000 </td>
   <td style="text-align:right;"> 352.14400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 164.000 </td>
   <td style="text-align:right;"> 462.70200 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 164.000 </td>
   <td style="text-align:right;"> 492.79400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 164.000 </td>
   <td style="text-align:right;"> 472.61900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 174.000 </td>
   <td style="text-align:right;"> 503.92000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 204.400 </td>
   <td style="text-align:right;"> 601.33477 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 204.400 </td>
   <td style="text-align:right;"> 591.19313 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 102.36500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 183.37900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 197.96400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 195.04400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 191.90400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 54.035 </td>
   <td style="text-align:right;"> 176.96300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 54.035 </td>
   <td style="text-align:right;"> 188.74296 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 9.200 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 9.200 </td>
   <td style="text-align:right;"> 15.85200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 9.500 </td>
   <td style="text-align:right;"> 19.85400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 9.500 </td>
   <td style="text-align:right;"> 20.84300 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.833 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.833 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2360.950 </td>
   <td style="text-align:right;"> 9328.55970 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 3258.310 </td>
   <td style="text-align:right;"> 10539.50100 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 3643.800 </td>
   <td style="text-align:right;"> 11702.36910 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 4072.150 </td>
   <td style="text-align:right;"> 13516.11510 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 5122.100 </td>
   <td style="text-align:right;"> 13683.32690 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 5879.660 </td>
   <td style="text-align:right;"> 17371.23410 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 7472.377 </td>
   <td style="text-align:right;"> 21510.40150 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 8619.677 </td>
   <td style="text-align:right;"> 24698.95709 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 10667.296 </td>
   <td style="text-align:right;"> 29349.44410 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 13565.793 </td>
   <td style="text-align:right;"> 35750.34167 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 15602.413 </td>
   <td style="text-align:right;"> 44633.91314 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 13658.410 </td>
   <td style="text-align:right;"> 63581.01600 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 13424.617 </td>
   <td style="text-align:right;"> 57501.22800 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 13471.818 </td>
   <td style="text-align:right;"> 67541.01400 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 13543.968 </td>
   <td style="text-align:right;"> 61438.09000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 13771.168 </td>
   <td style="text-align:right;"> 58659.24800 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 14162.691 </td>
   <td style="text-align:right;"> 58122.55500 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 14778.952 </td>
   <td style="text-align:right;"> 65687.28200 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 14778.952 </td>
   <td style="text-align:right;"> 69937.91100 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 14960.442 </td>
   <td style="text-align:right;"> 64204.25400 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 15583.142 </td>
   <td style="text-align:right;"> 62608.07300 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 16405.390 </td>
   <td style="text-align:right;"> 62291.66100 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1391.000 </td>
   <td style="text-align:right;"> 4782.16800 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1573.650 </td>
   <td style="text-align:right;"> 4742.91500 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1712.650 </td>
   <td style="text-align:right;"> 5413.65900 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1712.650 </td>
   <td style="text-align:right;"> 5540.21000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1788.750 </td>
   <td style="text-align:right;"> 5114.70000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1937.750 </td>
   <td style="text-align:right;"> 5157.39800 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 2102.697 </td>
   <td style="text-align:right;"> 6379.81327 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 2395.797 </td>
   <td style="text-align:right;"> 7008.79769 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2398.646 </td>
   <td style="text-align:right;"> 7335.90000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 2772.700 </td>
   <td style="text-align:right;"> 7445.30000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2791.400 </td>
   <td style="text-align:right;"> 7946.50000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 869.800 </td>
   <td style="text-align:right;"> 4664.82600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1024.180 </td>
   <td style="text-align:right;"> 4604.93800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1024.180 </td>
   <td style="text-align:right;"> 5012.98500 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1024.180 </td>
   <td style="text-align:right;"> 4604.26000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1024.180 </td>
   <td style="text-align:right;"> 3540.50600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1024.180 </td>
   <td style="text-align:right;"> 4372.63500 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1049.680 </td>
   <td style="text-align:right;"> 5323.15300 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1049.680 </td>
   <td style="text-align:right;"> 4895.71400 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1059.680 </td>
   <td style="text-align:right;"> 5094.81100 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1065.780 </td>
   <td style="text-align:right;"> 5342.09000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1115.100 </td>
   <td style="text-align:right;"> 4109.61200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 5079.790 </td>
   <td style="text-align:right;"> 36520.50820 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 5163.740 </td>
   <td style="text-align:right;"> 34008.12550 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 5163.740 </td>
   <td style="text-align:right;"> 33865.20360 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 5163.740 </td>
   <td style="text-align:right;"> 35038.44560 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 5163.740 </td>
   <td style="text-align:right;"> 33913.56600 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 5163.740 </td>
   <td style="text-align:right;"> 33612.11800 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 5301.740 </td>
   <td style="text-align:right;"> 34953.19200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 5318.240 </td>
   <td style="text-align:right;"> 33100.85990 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 5519.240 </td>
   <td style="text-align:right;"> 36246.83650 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 5519.640 </td>
   <td style="text-align:right;"> 35450.86650 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 5519.640 </td>
   <td style="text-align:right;"> 35599.47086 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 8745.210 </td>
   <td style="text-align:right;"> 36757.11300 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 9020.560 </td>
   <td style="text-align:right;"> 37428.97400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 9102.850 </td>
   <td style="text-align:right;"> 36060.62000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 9378.800 </td>
   <td style="text-align:right;"> 43684.04400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 9893.650 </td>
   <td style="text-align:right;"> 43148.86580 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 10398.210 </td>
   <td style="text-align:right;"> 36800.35900 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 11120.480 </td>
   <td style="text-align:right;"> 40411.73420 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 11429.380 </td>
   <td style="text-align:right;"> 40571.65550 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 12281.780 </td>
   <td style="text-align:right;"> 46010.73750 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 14563.400 </td>
   <td style="text-align:right;"> 50777.67780 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 15835.000 </td>
   <td style="text-align:right;"> 54399.58370 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 36958.637 </td>
   <td style="text-align:right;"> 174418.23500 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 37280.709 </td>
   <td style="text-align:right;"> 173656.11700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 38134.777 </td>
   <td style="text-align:right;"> 182362.75700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 39021.425 </td>
   <td style="text-align:right;"> 188895.24500 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 39303.710 </td>
   <td style="text-align:right;"> 191294.84200 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 39320.120 </td>
   <td style="text-align:right;"> 179801.35900 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 39346.393 </td>
   <td style="text-align:right;"> 192180.86700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 40810.440 </td>
   <td style="text-align:right;"> 195766.73000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 41076.993 </td>
   <td style="text-align:right;"> 208865.14400 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 43139.297 </td>
   <td style="text-align:right;"> 205581.36700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 43719.210 </td>
   <td style="text-align:right;"> 208658.96900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 1076.250 </td>
   <td style="text-align:right;"> 4528.33200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1076.250 </td>
   <td style="text-align:right;"> 4383.62500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1076.250 </td>
   <td style="text-align:right;"> 3455.98100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1172.250 </td>
   <td style="text-align:right;"> 4215.11300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1271.250 </td>
   <td style="text-align:right;"> 3905.76000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1271.250 </td>
   <td style="text-align:right;"> 4291.47700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1378.100 </td>
   <td style="text-align:right;"> 5099.26100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1378.100 </td>
   <td style="text-align:right;"> 4164.23300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1378.100 </td>
   <td style="text-align:right;"> 4687.58300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1378.300 </td>
   <td style="text-align:right;"> 4354.96400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1378.300 </td>
   <td style="text-align:right;"> 4070.39984 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 507.070 </td>
   <td style="text-align:right;"> 1478.61450 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 506.970 </td>
   <td style="text-align:right;"> 1446.75650 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 512.170 </td>
   <td style="text-align:right;"> 1396.85150 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 513.070 </td>
   <td style="text-align:right;"> 1565.80750 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 513.070 </td>
   <td style="text-align:right;"> 1471.49610 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 562.070 </td>
   <td style="text-align:right;"> 1771.82510 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 658.300 </td>
   <td style="text-align:right;"> 2256.22230 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 761.900 </td>
   <td style="text-align:right;"> 2036.92500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 767.870 </td>
   <td style="text-align:right;"> 2100.26310 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 816.910 </td>
   <td style="text-align:right;"> 2525.41960 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 932.710 </td>
   <td style="text-align:right;"> 2659.20875 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 14.000 </td>
   <td style="text-align:right;"> 40.10400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 14.000 </td>
   <td style="text-align:right;"> 36.24900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 73.000 </td>
   <td style="text-align:right;"> 39.63300 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 73.000 </td>
   <td style="text-align:right;"> 147.12400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 152.000 </td>
   <td style="text-align:right;"> 352.14400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 164.000 </td>
   <td style="text-align:right;"> 462.70200 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 164.000 </td>
   <td style="text-align:right;"> 492.79400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 164.000 </td>
   <td style="text-align:right;"> 472.61900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 174.000 </td>
   <td style="text-align:right;"> 503.92000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 204.400 </td>
   <td style="text-align:right;"> 601.33477 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 204.400 </td>
   <td style="text-align:right;"> 591.19313 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 6780.060 </td>
   <td style="text-align:right;"> 40498.23800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 6775.450 </td>
   <td style="text-align:right;"> 41709.86600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 6776.800 </td>
   <td style="text-align:right;"> 40048.49100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 6776.800 </td>
   <td style="text-align:right;"> 41790.38800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 6835.050 </td>
   <td style="text-align:right;"> 36830.54000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 6835.050 </td>
   <td style="text-align:right;"> 40462.08500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 6842.700 </td>
   <td style="text-align:right;"> 40214.85900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 6837.060 </td>
   <td style="text-align:right;"> 42381.50500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 6842.700 </td>
   <td style="text-align:right;"> 41616.31800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 6820.455 </td>
   <td style="text-align:right;"> 39224.78900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 6820.455 </td>
   <td style="text-align:right;"> 40520.74296 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 65.000 </td>
   <td style="text-align:right;"> 259.10700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 41.700 </td>
   <td style="text-align:right;"> 251.86600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 43.000 </td>
   <td style="text-align:right;"> 250.24600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 246.57500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 253.95200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 253.95200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 55.700 </td>
   <td style="text-align:right;"> 260.34500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 64.900 </td>
   <td style="text-align:right;"> 252.69900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 64.900 </td>
   <td style="text-align:right;"> 278.53500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 65.200 </td>
   <td style="text-align:right;"> 253.77000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 65.200 </td>
   <td style="text-align:right;"> 273.59178 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 76.700 </td>
   <td style="text-align:right;"> 320.44300 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 77.500 </td>
   <td style="text-align:right;"> 334.60800 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 78.700 </td>
   <td style="text-align:right;"> 330.63200 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 78.700 </td>
   <td style="text-align:right;"> 348.29300 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 78.700 </td>
   <td style="text-align:right;"> 379.05600 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 78.700 </td>
   <td style="text-align:right;"> 380.43100 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 95.300 </td>
   <td style="text-align:right;"> 388.06600 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 95.300 </td>
   <td style="text-align:right;"> 430.19400 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 95.300 </td>
   <td style="text-align:right;"> 424.99000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 95.333 </td>
   <td style="text-align:right;"> 410.66800 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 95.333 </td>
   <td style="text-align:right;"> 421.88400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 75221.927 </td>
   <td style="text-align:right;"> 367848.70470 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 75979.326 </td>
   <td style="text-align:right;"> 360105.26800 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 77169.935 </td>
   <td style="text-align:right;"> 375778.07310 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 78514.283 </td>
   <td style="text-align:right;"> 387513.59510 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 79850.968 </td>
   <td style="text-align:right;"> 378864.67590 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 80973.461 </td>
   <td style="text-align:right;"> 365488.89610 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 82894.042 </td>
   <td style="text-align:right;"> 393647.58880 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 85083.749 </td>
   <td style="text-align:right;"> 401019.84310 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 86619.651 </td>
   <td style="text-align:right;"> 417369.29210 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 92024.592 </td>
   <td style="text-align:right;"> 414576.31970 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 94882.173 </td>
   <td style="text-align:right;"> 421542.81700 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2182.880 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 2287.880 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 2287.880 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 2287.880 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 2287.880 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 2320.380 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 2367.850 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 2321.650 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2393.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 2393.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2393.050 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 10887.950 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 10508.350 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 10663.350 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 11061.950 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 11440.250 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 11300.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 11249.101 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 11794.029 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 12493.296 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 12864.080 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 13915.950 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2873.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 2854.620 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 2854.620 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 2879.450 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 2972.450 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 3224.950 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 3224.950 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 3220.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 3089.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 3148.600 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 3363.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 520.120 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 519.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 519.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 519.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 519.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 519.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 519.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 519.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 519.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 497.740 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 499.860 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 23039.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 23527.685 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 23535.850 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 24685.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 24410.870 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 25934.170 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 25734.305 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 25148.305 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 25831.305 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 23642.750 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 24083.750 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2579.210 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 3088.210 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 3209.210 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 3128.710 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 3128.710 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 2997.710 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 2512.690 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 830.690 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1837.690 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1368.690 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1089.010 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 3282.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 3282.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 3282.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 3282.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 3280.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 3229.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 3229.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 3229.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 3254.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 3254.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 3254.300 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2008.920 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 2006.420 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 2006.420 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 2006.420 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 2006.120 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 2006.420 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 2058.420 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 2058.420 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2058.430 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 2104.870 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 2104.870 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 161.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 161.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 161.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 163.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 163.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 160.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 862.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 862.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 862.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 862.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 892.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 892.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 889.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 889.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 863.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 971.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 971.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 149.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 109.923 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 107.180 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 111.598 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 160.718 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 126.998 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 126.940 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 126.940 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 130.760 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 104.960 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 121.270 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 33.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 33.570 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 28.970 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 54.280 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 48632.000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 49294.748 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 49576.170 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 51072.968 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 51346.658 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 52800.668 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 52161.146 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 50386.924 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 52721.421 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 50600.890 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 52039.460 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 102.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 102.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 246.000 </td>
   <td style="text-align:right;"> 484.90000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 246.000 </td>
   <td style="text-align:right;"> 508.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 388.000 </td>
   <td style="text-align:right;"> 859.80000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 488.000 </td>
   <td style="text-align:right;"> 1071.20000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 488.000 </td>
   <td style="text-align:right;"> 1206.30000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 251.000 </td>
   <td style="text-align:right;"> 741.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 386.200 </td>
   <td style="text-align:right;"> 921.36600 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 525.200 </td>
   <td style="text-align:right;"> 1430.26700 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 525.200 </td>
   <td style="text-align:right;"> 1472.90200 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 591.200 </td>
   <td style="text-align:right;"> 1557.90000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 723.200 </td>
   <td style="text-align:right;"> 1628.62100 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 865.000 </td>
   <td style="text-align:right;"> 2372.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1088.000 </td>
   <td style="text-align:right;"> 2601.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1088.000 </td>
   <td style="text-align:right;"> 3058.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1434.000 </td>
   <td style="text-align:right;"> 3519.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1463.000 </td>
   <td style="text-align:right;"> 4089.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 15.800 </td>
   <td style="text-align:right;"> 91.91600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 573.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 620.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 574.39100 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 578.58200 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 171.180 </td>
   <td style="text-align:right;"> 506.58700 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 196.680 </td>
   <td style="text-align:right;"> 682.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 196.680 </td>
   <td style="text-align:right;"> 655.33600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 196.680 </td>
   <td style="text-align:right;"> 646.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 196.680 </td>
   <td style="text-align:right;"> 636.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 221.000 </td>
   <td style="text-align:right;"> 684.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 20.000 </td>
   <td style="text-align:right;"> 53.42000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 103.950 </td>
   <td style="text-align:right;"> 325.11500 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 103.950 </td>
   <td style="text-align:right;"> 325.11500 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 103.950 </td>
   <td style="text-align:right;"> 411.85200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 103.950 </td>
   <td style="text-align:right;"> 364.51200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 103.950 </td>
   <td style="text-align:right;"> 343.19600 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 241.950 </td>
   <td style="text-align:right;"> 746.90200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 258.450 </td>
   <td style="text-align:right;"> 876.74700 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 258.450 </td>
   <td style="text-align:right;"> 867.80600 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 258.450 </td>
   <td style="text-align:right;"> 911.31900 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 258.450 </td>
   <td style="text-align:right;"> 860.32836 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 14.700 </td>
   <td style="text-align:right;"> 25.65800 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 414.000 </td>
   <td style="text-align:right;"> 145.17900 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 491.000 </td>
   <td style="text-align:right;"> 493.71800 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 782.000 </td>
   <td style="text-align:right;"> 1400.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1168.000 </td>
   <td style="text-align:right;"> 2300.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1447.000 </td>
   <td style="text-align:right;"> 2800.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1970.000 </td>
   <td style="text-align:right;"> 3900.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 2053.000 </td>
   <td style="text-align:right;"> 4600.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2491.000 </td>
   <td style="text-align:right;"> 5200.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 3490.000 </td>
   <td style="text-align:right;"> 6800.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 4374.000 </td>
   <td style="text-align:right;"> 10200.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 207.000 </td>
   <td style="text-align:right;"> 416.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 317.000 </td>
   <td style="text-align:right;"> 419.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 417.000 </td>
   <td style="text-align:right;"> 617.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 527.000 </td>
   <td style="text-align:right;"> 565.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 660.000 </td>
   <td style="text-align:right;"> 1322.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 664.000 </td>
   <td style="text-align:right;"> 1547.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 923.000 </td>
   <td style="text-align:right;"> 1400.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1354.000 </td>
   <td style="text-align:right;"> 2562.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 2404.000 </td>
   <td style="text-align:right;"> 4721.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 2865.000 </td>
   <td style="text-align:right;"> 6650.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 3262.000 </td>
   <td style="text-align:right;"> 8938.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 96.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 195.000 </td>
   <td style="text-align:right;"> 270.13400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 195.000 </td>
   <td style="text-align:right;"> 389.12700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 294.000 </td>
   <td style="text-align:right;"> 692.97300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 294.000 </td>
   <td style="text-align:right;"> 732.95300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 294.000 </td>
   <td style="text-align:right;"> 737.27100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 294.000 </td>
   <td style="text-align:right;"> 785.85000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 294.000 </td>
   <td style="text-align:right;"> 736.57584 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 34.700 </td>
   <td style="text-align:right;"> 85.44500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 37.100 </td>
   <td style="text-align:right;"> 109.53500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 42.300 </td>
   <td style="text-align:right;"> 156.98700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 43.200 </td>
   <td style="text-align:right;"> 148.60900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 43.200 </td>
   <td style="text-align:right;"> 154.00900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 122.200 </td>
   <td style="text-align:right;"> 386.67000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 216.600 </td>
   <td style="text-align:right;"> 782.49700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 320.200 </td>
   <td style="text-align:right;"> 800.28900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 326.170 </td>
   <td style="text-align:right;"> 765.41200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 328.170 </td>
   <td style="text-align:right;"> 748.67800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 443.970 </td>
   <td style="text-align:right;"> 1015.07525 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 13.000 </td>
   <td style="text-align:right;"> 40.10400 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 13.000 </td>
   <td style="text-align:right;"> 36.24900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 72.000 </td>
   <td style="text-align:right;"> 39.63300 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 72.000 </td>
   <td style="text-align:right;"> 141.66600 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 151.000 </td>
   <td style="text-align:right;"> 347.32800 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 163.000 </td>
   <td style="text-align:right;"> 457.62500 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 163.000 </td>
   <td style="text-align:right;"> 487.67500 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 163.000 </td>
   <td style="text-align:right;"> 467.62100 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 173.000 </td>
   <td style="text-align:right;"> 499.02900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 203.000 </td>
   <td style="text-align:right;"> 594.76800 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 203.000 </td>
   <td style="text-align:right;"> 586.83240 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 102.36500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 183.37900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 197.96400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 195.04400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 191.90400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 176.96300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 54.000 </td>
   <td style="text-align:right;"> 188.74296 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 9.200 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 9.200 </td>
   <td style="text-align:right;"> 15.85200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 9.200 </td>
   <td style="text-align:right;"> 19.85400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 9.200 </td>
   <td style="text-align:right;"> 20.84300 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.800 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 556.200 </td>
   <td style="text-align:right;"> 1453.54300 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1443.230 </td>
   <td style="text-align:right;"> 2529.44400 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1823.430 </td>
   <td style="text-align:right;"> 3682.72000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 2321.330 </td>
   <td style="text-align:right;"> 4714.42000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 3240.330 </td>
   <td style="text-align:right;"> 7030.83000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 3746.330 </td>
   <td style="text-align:right;"> 8364.90500 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 5171.030 </td>
   <td style="text-align:right;"> 11746.91100 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 6037.330 </td>
   <td style="text-align:right;"> 13998.99000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 7683.300 </td>
   <td style="text-align:right;"> 17562.07400 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 9621.300 </td>
   <td style="text-align:right;"> 21913.63200 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 11071.420 </td>
   <td style="text-align:right;"> 28525.69781 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 63653.12940 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 67034.75615 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 67122.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 66109.30000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 67056.40000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 68411.10406 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 66674.02624 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 68067.70826 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 70716.90000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 75377.40000 </td>
  </tr>
<tr>
<td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 73593.50000 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4192.65400 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4096.35300 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4288.96300 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4633.97600 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6397.40300 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6101.18200 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3569.97900 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3646.53100 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3646.84600 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4399.78900 </td>
  </tr>
<tr>
<td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4273.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 242388.92670 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 240529.76050 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 247296.32530 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 239022.35740 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 222565.78750 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 228969.57840 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 223054.86930 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 223979.91040 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 230191.23930 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 233108.42040 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 224496.91630 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 556.33400 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 503.41200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 564.17000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 523.30500 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 271.76000 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 174.44600 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 186.83600 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 141.40200 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 141.72400 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 113.56100 </td>
  </tr>
<tr>
<td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 158.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 16804.62200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 14083.49500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 13812.85400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10376.35600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 9553.09700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 7124.26800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6702.43300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6123.80600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10382.45900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 12114.73900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10308.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1638.11300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1058.20500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1534.82200 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1416.29700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1338.12000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1280.75000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1389.15700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1321.00100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1460.82100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1829.17900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1793.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 11061.76700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10092.53000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 11280.06800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10748.96900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10235.40400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10295.29100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 9331.76400 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 9041.96000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8654.62600 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8507.16300 </td>
  </tr>
<tr>
<td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8369.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 141.64500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 144.70900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 148.88100 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 182.19900 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 161.92500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 161.92500 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 98.30800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 98.30700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 98.30700 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 157.59800 </td>
  </tr>
<tr>
<td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 187.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 434.14330 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 434.14330 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 434.14330 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 492.89240 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 388.25250 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 301.17030 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 192.23510 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 194.69810 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 297.28330 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 475.37140 </td>
  </tr>
<tr>
<td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 444.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 122578.25200 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 121194.95200 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 122832.33200 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 122513.62000 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 104897.12400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 114315.02300 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 114676.70600 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 114158.29100 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 116367.04500 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 113136.67400 </td>
  </tr>
<tr>
<td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 105599.41630 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6.31300 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 7.52800 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 5.09900 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2.86500 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4.92000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3.77600 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4.81000 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 14.51100 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8.15600 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 5.65600 </td>
  </tr>
<tr>
<td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 5.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6054.20800 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6804.84300 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 9647.36200 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4836.40700 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 5010.86200 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4739.89800 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4319.54200 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4791.26600 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 306.65400 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 106.55800 </td>
  </tr>
<tr>
<td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 252.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 15245.33000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 15050.99000 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 15601.97600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 17162.28600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 17227.91600 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 16035.77900 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 15872.20500 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 16356.06400 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 18087.12700 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 16862.04800 </td>
  </tr>
<tr>
<td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 19489.00000 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 22.41600 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 23.84400 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 23.65500 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 23.88500 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 22.60400 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 24.96600 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 36.86800 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 24.36500 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 23.29100 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 22.68400 </td>
  </tr>
<tr>
<td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Other sources </td>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 26.00000 </td>
  </tr>
</tbody>
</table></div>

## Dataset Dictionary

```r
kable(RE_Dictionary, "html") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) %>%
  scroll_box(width = "100%", height = "400px")
```

<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:400px; overflow-x: scroll; width:100%; "><table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<thead><tr>
<th style="text-align:left;"> Column </th>
   <th style="text-align:left;"> Data Value or Column Name Indication </th>
   <th style="text-align:left;"> Description of Data Value or Column Name </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> BC </td>
   <td style="text-align:left;"> Province of British Columbia </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> Province of Alberta </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> SK </td>
   <td style="text-align:left;"> Province of Saskatchewan </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> MB </td>
   <td style="text-align:left;"> Province of Manitoba </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> ON </td>
   <td style="text-align:left;"> Province of Ontario </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> QC </td>
   <td style="text-align:left;"> Province of Quebec </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> NB </td>
   <td style="text-align:left;"> Province of New Brunswick </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> NS </td>
   <td style="text-align:left;"> Province of Nova Scotia </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> PE </td>
   <td style="text-align:left;"> Province of Prince Edward Island </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> NF </td>
   <td style="text-align:left;"> Province of Newfoundland and Labrador </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> NWT </td>
   <td style="text-align:left;"> Northwest Territories </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> YT </td>
   <td style="text-align:left;"> Yukon Territory </td>
  </tr>
<tr>
<td style="text-align:left;"> Region </td>
   <td style="text-align:left;"> NU </td>
   <td style="text-align:left;"> Nunavut Territory </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Hydro </td>
   <td style="text-align:left;"> Hydroelectric power plants </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Wind </td>
   <td style="text-align:left;"> Wind power plants </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Biomass </td>
   <td style="text-align:left;"> Biomass power plants </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Solar </td>
   <td style="text-align:left;"> Solar power plants </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Nuclear </td>
   <td style="text-align:left;"> Nuclear power plants </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Coal </td>
   <td style="text-align:left;"> Coal power plants </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Natural Gas </td>
   <td style="text-align:left;"> Natural gas power plants </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Oil </td>
   <td style="text-align:left;"> Oil power plants (fuel oil and diesel) </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Thermal </td>
   <td style="text-align:left;"> Thermal power plants (biomass, nuclear, coal, natural gas and oil) </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> All sources </td>
   <td style="text-align:left;"> All power plants </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Renewables </td>
   <td style="text-align:left;"> Renewable power plants (biomass, hydro, solar and wind) </td>
  </tr>
<tr>
<td style="text-align:left;"> Source </td>
   <td style="text-align:left;"> Non-hydro renewables </td>
   <td style="text-align:left;"> Non-hydro renewable power plants (biomass, solar and wind) </td>
  </tr>
<tr>
<td style="text-align:left;"> Year </td>
   <td style="text-align:left;"> 4 digit integer number between 2005 and 2014 </td>
   <td style="text-align:left;"> Year that the data refers to </td>
  </tr>
<tr>
<td style="text-align:left;"> Unit_Capacity </td>
   <td style="text-align:left;"> MW </td>
   <td style="text-align:left;"> Megawatts is a unit of measure for electricity generation capacity </td>
  </tr>
<tr>
<td style="text-align:left;"> Unit_Generation </td>
   <td style="text-align:left;"> GW.h </td>
   <td style="text-align:left;"> Gigawatt hours is a unit of measure for electricity generation </td>
  </tr>
</tbody>
</table></div>

## First Basic Plot

```r
ggplotly(ggplot(RE_Full, aes(x = Capacity_MW, y = Generation_GWh)) +
  geom_point(aes(color = Source)))
```

<!--html_preserve--><div id="54e71995efdc" style="width:720px;height:432px;" class="plotly html-widget"></div>
<script type="application/json" data-for="54e71995efdc">{"x":{"data":[{"x":[15030.37,14901.577,14948.778,15020.928,15248.128,15624.151,16286.612,16240.412,16467.902,17090.602,17912.85,12007.95,11768.9,12062.9,12461.5,12905.8,12897.7,12993.10133,13776.02932,14475.296,15198.48,16279.35,3742.8,3878.8,3878.8,3903.63,3996.63,4249.13,4274.63,4269.68,4148.68,4212.78,4476.65,5577.91,5661.48,5661.48,5661.48,5661.48,5661.48,5799.48,5815.98,6016.98,5995.38,5997.5,31575.21,32372.245,32462.7,33916.1,34097.52,36125.38,36647.785,36370.685,37906.085,37614.15,39344.75,39259.687,40090.759,41065.827,41920.475,42202.76,42088.17,41619.443,41401.49,42675.043,44268.347,44563.38,4231.25,4231.25,4231.25,4327.25,4424.25,4373.25,4480.1,4480.1,4505.1,4505.3,4505.3,2447.37,2447.27,2452.47,2453.37,2453.07,2502.37,2650.6,2754.2,2760.18,2809.22,2925.02,173,173,232,232,311,324,324,324,336,366.4,363.4,7642.06,7637.45,7638.8,7638.8,7727.05,7727.05,7731.7,7726.06,7705.7,7791.455,7791.455,214,151.623,150.18,167.298,216.418,182.698,182.64,191.84,195.66,170.16,186.47,110.04,110.84,112.04,112.04,112.04,112.27,128.87,128.87,128.87,128.903,124.303,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.315,54.315,122065.927,123479.474,124951.505,127869.151,129410.426,131921.929,133173.2413,133533.6263,137375.776,140205.492,144524.743],"y":[67773.67,61597.581,71829.977,66072.066,65056.651,64223.737,69257.261,73584.442,67851.1,67007.862,66564.661,68435.2974,71777.67115,72535.659,71649.51,72171.1,73568.50206,73053.83951,75076.50595,78052.8,82822.7,81540,19910.156,19655.928,20614.961,21766.546,20768.422,20408.414,21195.358,21251.778,23181.938,22204.138,23598.612,37076.8422,34511.5375,34429.3736,35561.7506,34185.326,33786.564,35140.028,33242.2619,36388.5605,35564.4275,35757.47086,159335.365,158623.926,158892.952,166197.664,148045.9898,151115.382,155088.4402,154729.9465,162377.7825,163914.3518,159999,180472.443,180460.96,192010.119,193731.652,196305.704,184541.257,196500.409,200557.996,209171.798,205687.925,208910.969,21332.954,18467.12,17268.835,14591.469,13458.857,11415.745,11801.694,10288.039,15070.042,16469.703,14378.39984,12540.3815,11539.2865,12676.9195,12314.7765,11706.9001,12067.1161,11587.9863,11078.885,10754.8891,11032.5826,11028.20875,46.417,43.777,44.732,149.989,357.064,466.478,497.604,487.13,512.076,606.99077,596.19313,42136.351,42768.071,41583.313,43206.685,38168.66,41742.835,41604.016,43702.506,43077.139,41053.968,42313.74296,693.2503,686.0093,684.3893,739.4674,642.2045,555.1223,452.5801,447.3971,575.8183,729.1414,717.591776,342.859,358.452,354.287,372.178,401.66,405.397,424.934,454.559,448.281,433.352,447.884,141.645,144.709,148.881,182.199,161.925,161.925,98.308,98.307,98.307,157.598,187,610237.6314,600635.0285,623074.3984,626535.9525,601430.4634,594458.4745,616702.4581,624999.7535,647560.5314,647684.7401,646039.7333],"text":["Source: All sources<br />Capacity_MW:  15030.370<br />Generation_GWh:  67773.67000","Source: All sources<br />Capacity_MW:  14901.577<br />Generation_GWh:  61597.58100","Source: All sources<br />Capacity_MW:  14948.778<br />Generation_GWh:  71829.97700","Source: All sources<br />Capacity_MW:  15020.928<br />Generation_GWh:  66072.06600","Source: All sources<br />Capacity_MW:  15248.128<br />Generation_GWh:  65056.65100","Source: All sources<br />Capacity_MW:  15624.151<br />Generation_GWh:  64223.73700","Source: All sources<br />Capacity_MW:  16286.612<br />Generation_GWh:  69257.26100","Source: All sources<br />Capacity_MW:  16240.412<br />Generation_GWh:  73584.44200","Source: All sources<br />Capacity_MW:  16467.902<br />Generation_GWh:  67851.10000","Source: All sources<br />Capacity_MW:  17090.602<br />Generation_GWh:  67007.86200","Source: All sources<br />Capacity_MW:  17912.850<br />Generation_GWh:  66564.66100","Source: All sources<br />Capacity_MW:  12007.950<br />Generation_GWh:  68435.29740","Source: All sources<br />Capacity_MW:  11768.900<br />Generation_GWh:  71777.67115","Source: All sources<br />Capacity_MW:  12062.900<br />Generation_GWh:  72535.65900","Source: All sources<br />Capacity_MW:  12461.500<br />Generation_GWh:  71649.51000","Source: All sources<br />Capacity_MW:  12905.800<br />Generation_GWh:  72171.10000","Source: All sources<br />Capacity_MW:  12897.700<br />Generation_GWh:  73568.50206","Source: All sources<br />Capacity_MW:  12993.101<br />Generation_GWh:  73053.83951","Source: All sources<br />Capacity_MW:  13776.029<br />Generation_GWh:  75076.50595","Source: All sources<br />Capacity_MW:  14475.296<br />Generation_GWh:  78052.80000","Source: All sources<br />Capacity_MW:  15198.480<br />Generation_GWh:  82822.70000","Source: All sources<br />Capacity_MW:  16279.350<br />Generation_GWh:  81540.00000","Source: All sources<br />Capacity_MW:   3742.800<br />Generation_GWh:  19910.15600","Source: All sources<br />Capacity_MW:   3878.800<br />Generation_GWh:  19655.92800","Source: All sources<br />Capacity_MW:   3878.800<br />Generation_GWh:  20614.96100","Source: All sources<br />Capacity_MW:   3903.630<br />Generation_GWh:  21766.54600","Source: All sources<br />Capacity_MW:   3996.630<br />Generation_GWh:  20768.42200","Source: All sources<br />Capacity_MW:   4249.130<br />Generation_GWh:  20408.41400","Source: All sources<br />Capacity_MW:   4274.630<br />Generation_GWh:  21195.35800","Source: All sources<br />Capacity_MW:   4269.680<br />Generation_GWh:  21251.77800","Source: All sources<br />Capacity_MW:   4148.680<br />Generation_GWh:  23181.93800","Source: All sources<br />Capacity_MW:   4212.780<br />Generation_GWh:  22204.13800","Source: All sources<br />Capacity_MW:   4476.650<br />Generation_GWh:  23598.61200","Source: All sources<br />Capacity_MW:   5577.910<br />Generation_GWh:  37076.84220","Source: All sources<br />Capacity_MW:   5661.480<br />Generation_GWh:  34511.53750","Source: All sources<br />Capacity_MW:   5661.480<br />Generation_GWh:  34429.37360","Source: All sources<br />Capacity_MW:   5661.480<br />Generation_GWh:  35561.75060","Source: All sources<br />Capacity_MW:   5661.480<br />Generation_GWh:  34185.32600","Source: All sources<br />Capacity_MW:   5661.480<br />Generation_GWh:  33786.56400","Source: All sources<br />Capacity_MW:   5799.480<br />Generation_GWh:  35140.02800","Source: All sources<br />Capacity_MW:   5815.980<br />Generation_GWh:  33242.26190","Source: All sources<br />Capacity_MW:   6016.980<br />Generation_GWh:  36388.56050","Source: All sources<br />Capacity_MW:   5995.380<br />Generation_GWh:  35564.42750","Source: All sources<br />Capacity_MW:   5997.500<br />Generation_GWh:  35757.47086","Source: All sources<br />Capacity_MW:  31575.210<br />Generation_GWh: 159335.36500","Source: All sources<br />Capacity_MW:  32372.245<br />Generation_GWh: 158623.92600","Source: All sources<br />Capacity_MW:  32462.700<br />Generation_GWh: 158892.95200","Source: All sources<br />Capacity_MW:  33916.100<br />Generation_GWh: 166197.66400","Source: All sources<br />Capacity_MW:  34097.520<br />Generation_GWh: 148045.98980","Source: All sources<br />Capacity_MW:  36125.380<br />Generation_GWh: 151115.38200","Source: All sources<br />Capacity_MW:  36647.785<br />Generation_GWh: 155088.44020","Source: All sources<br />Capacity_MW:  36370.685<br />Generation_GWh: 154729.94650","Source: All sources<br />Capacity_MW:  37906.085<br />Generation_GWh: 162377.78250","Source: All sources<br />Capacity_MW:  37614.150<br />Generation_GWh: 163914.35180","Source: All sources<br />Capacity_MW:  39344.750<br />Generation_GWh: 159999.00000","Source: All sources<br />Capacity_MW:  39259.687<br />Generation_GWh: 180472.44300","Source: All sources<br />Capacity_MW:  40090.759<br />Generation_GWh: 180460.96000","Source: All sources<br />Capacity_MW:  41065.827<br />Generation_GWh: 192010.11900","Source: All sources<br />Capacity_MW:  41920.475<br />Generation_GWh: 193731.65200","Source: All sources<br />Capacity_MW:  42202.760<br />Generation_GWh: 196305.70400","Source: All sources<br />Capacity_MW:  42088.170<br />Generation_GWh: 184541.25700","Source: All sources<br />Capacity_MW:  41619.443<br />Generation_GWh: 196500.40900","Source: All sources<br />Capacity_MW:  41401.490<br />Generation_GWh: 200557.99600","Source: All sources<br />Capacity_MW:  42675.043<br />Generation_GWh: 209171.79800","Source: All sources<br />Capacity_MW:  44268.347<br />Generation_GWh: 205687.92500","Source: All sources<br />Capacity_MW:  44563.380<br />Generation_GWh: 208910.96900","Source: All sources<br />Capacity_MW:   4231.250<br />Generation_GWh:  21332.95400","Source: All sources<br />Capacity_MW:   4231.250<br />Generation_GWh:  18467.12000","Source: All sources<br />Capacity_MW:   4231.250<br />Generation_GWh:  17268.83500","Source: All sources<br />Capacity_MW:   4327.250<br />Generation_GWh:  14591.46900","Source: All sources<br />Capacity_MW:   4424.250<br />Generation_GWh:  13458.85700","Source: All sources<br />Capacity_MW:   4373.250<br />Generation_GWh:  11415.74500","Source: All sources<br />Capacity_MW:   4480.100<br />Generation_GWh:  11801.69400","Source: All sources<br />Capacity_MW:   4480.100<br />Generation_GWh:  10288.03900","Source: All sources<br />Capacity_MW:   4505.100<br />Generation_GWh:  15070.04200","Source: All sources<br />Capacity_MW:   4505.300<br />Generation_GWh:  16469.70300","Source: All sources<br />Capacity_MW:   4505.300<br />Generation_GWh:  14378.39984","Source: All sources<br />Capacity_MW:   2447.370<br />Generation_GWh:  12540.38150","Source: All sources<br />Capacity_MW:   2447.270<br />Generation_GWh:  11539.28650","Source: All sources<br />Capacity_MW:   2452.470<br />Generation_GWh:  12676.91950","Source: All sources<br />Capacity_MW:   2453.370<br />Generation_GWh:  12314.77650","Source: All sources<br />Capacity_MW:   2453.070<br />Generation_GWh:  11706.90010","Source: All sources<br />Capacity_MW:   2502.370<br />Generation_GWh:  12067.11610","Source: All sources<br />Capacity_MW:   2650.600<br />Generation_GWh:  11587.98630","Source: All sources<br />Capacity_MW:   2754.200<br />Generation_GWh:  11078.88500","Source: All sources<br />Capacity_MW:   2760.180<br />Generation_GWh:  10754.88910","Source: All sources<br />Capacity_MW:   2809.220<br />Generation_GWh:  11032.58260","Source: All sources<br />Capacity_MW:   2925.020<br />Generation_GWh:  11028.20875","Source: All sources<br />Capacity_MW:    173.000<br />Generation_GWh:     46.41700","Source: All sources<br />Capacity_MW:    173.000<br />Generation_GWh:     43.77700","Source: All sources<br />Capacity_MW:    232.000<br />Generation_GWh:     44.73200","Source: All sources<br />Capacity_MW:    232.000<br />Generation_GWh:    149.98900","Source: All sources<br />Capacity_MW:    311.000<br />Generation_GWh:    357.06400","Source: All sources<br />Capacity_MW:    324.000<br />Generation_GWh:    466.47800","Source: All sources<br />Capacity_MW:    324.000<br />Generation_GWh:    497.60400","Source: All sources<br />Capacity_MW:    324.000<br />Generation_GWh:    487.13000","Source: All sources<br />Capacity_MW:    336.000<br />Generation_GWh:    512.07600","Source: All sources<br />Capacity_MW:    366.400<br />Generation_GWh:    606.99077","Source: All sources<br />Capacity_MW:    363.400<br />Generation_GWh:    596.19313","Source: All sources<br />Capacity_MW:   7642.060<br />Generation_GWh:  42136.35100","Source: All sources<br />Capacity_MW:   7637.450<br />Generation_GWh:  42768.07100","Source: All sources<br />Capacity_MW:   7638.800<br />Generation_GWh:  41583.31300","Source: All sources<br />Capacity_MW:   7638.800<br />Generation_GWh:  43206.68500","Source: All sources<br />Capacity_MW:   7727.050<br />Generation_GWh:  38168.66000","Source: All sources<br />Capacity_MW:   7727.050<br />Generation_GWh:  41742.83500","Source: All sources<br />Capacity_MW:   7731.700<br />Generation_GWh:  41604.01600","Source: All sources<br />Capacity_MW:   7726.060<br />Generation_GWh:  43702.50600","Source: All sources<br />Capacity_MW:   7705.700<br />Generation_GWh:  43077.13900","Source: All sources<br />Capacity_MW:   7791.455<br />Generation_GWh:  41053.96800","Source: All sources<br />Capacity_MW:   7791.455<br />Generation_GWh:  42313.74296","Source: All sources<br />Capacity_MW:    214.000<br />Generation_GWh:    693.25030","Source: All sources<br />Capacity_MW:    151.623<br />Generation_GWh:    686.00930","Source: All sources<br />Capacity_MW:    150.180<br />Generation_GWh:    684.38930","Source: All sources<br />Capacity_MW:    167.298<br />Generation_GWh:    739.46740","Source: All sources<br />Capacity_MW:    216.418<br />Generation_GWh:    642.20450","Source: All sources<br />Capacity_MW:    182.698<br />Generation_GWh:    555.12230","Source: All sources<br />Capacity_MW:    182.640<br />Generation_GWh:    452.58010","Source: All sources<br />Capacity_MW:    191.840<br />Generation_GWh:    447.39710","Source: All sources<br />Capacity_MW:    195.660<br />Generation_GWh:    575.81830","Source: All sources<br />Capacity_MW:    170.160<br />Generation_GWh:    729.14140","Source: All sources<br />Capacity_MW:    186.470<br />Generation_GWh:    717.59178","Source: All sources<br />Capacity_MW:    110.040<br />Generation_GWh:    342.85900","Source: All sources<br />Capacity_MW:    110.840<br />Generation_GWh:    358.45200","Source: All sources<br />Capacity_MW:    112.040<br />Generation_GWh:    354.28700","Source: All sources<br />Capacity_MW:    112.040<br />Generation_GWh:    372.17800","Source: All sources<br />Capacity_MW:    112.040<br />Generation_GWh:    401.66000","Source: All sources<br />Capacity_MW:    112.270<br />Generation_GWh:    405.39700","Source: All sources<br />Capacity_MW:    128.870<br />Generation_GWh:    424.93400","Source: All sources<br />Capacity_MW:    128.870<br />Generation_GWh:    454.55900","Source: All sources<br />Capacity_MW:    128.870<br />Generation_GWh:    448.28100","Source: All sources<br />Capacity_MW:    128.903<br />Generation_GWh:    433.35200","Source: All sources<br />Capacity_MW:    124.303<br />Generation_GWh:    447.88400","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:    141.64500","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:    144.70900","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:    148.88100","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:    182.19900","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:    161.92500","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:    161.92500","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:     98.30800","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:     98.30700","Source: All sources<br />Capacity_MW:     54.280<br />Generation_GWh:     98.30700","Source: All sources<br />Capacity_MW:     54.315<br />Generation_GWh:    157.59800","Source: All sources<br />Capacity_MW:     54.315<br />Generation_GWh:    187.00000","Source: All sources<br />Capacity_MW: 122065.927<br />Generation_GWh: 610237.63140","Source: All sources<br />Capacity_MW: 123479.474<br />Generation_GWh: 600635.02850","Source: All sources<br />Capacity_MW: 124951.505<br />Generation_GWh: 623074.39840","Source: All sources<br />Capacity_MW: 127869.151<br />Generation_GWh: 626535.95250","Source: All sources<br />Capacity_MW: 129410.426<br />Generation_GWh: 601430.46340","Source: All sources<br />Capacity_MW: 131921.929<br />Generation_GWh: 594458.47450","Source: All sources<br />Capacity_MW: 133173.241<br />Generation_GWh: 616702.45810","Source: All sources<br />Capacity_MW: 133533.626<br />Generation_GWh: 624999.75350","Source: All sources<br />Capacity_MW: 137375.776<br />Generation_GWh: 647560.53140","Source: All sources<br />Capacity_MW: 140205.492<br />Generation_GWh: 647684.74010","Source: All sources<br />Capacity_MW: 144524.743<br />Generation_GWh: 646039.73330"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(248,118,109,1)"}},"hoveron":"points","name":"All sources","legendgroup":"All sources","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[810.92,810.92,810.92,810.92,810.92,858.92,860.19,860.19,885.59,885.59,885.59,271,313.1,313.1,313.1,323.2,340.2,358.697,413.797,416.646,438.3,428,0,0,0,0,0,0,0,0,0,1.6,1.6,22,22,22,22,22,22,22,22,22,22,22,209,176,176,148,207,207,207,207,207,592,574,278.16,278.16,278.16,229.66,229.66,229.66,239.64,239.64,239.64,239.64,244.84,127.3,127.3,127.3,127.3,127.3,127.3,127.3,127.3,127.3,127.3,127.3,68.62,66.12,66.12,66.12,66.12,66.12,66.12,66.12,66.12,112.56,112.56,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1788,1794.6,1794.6,1718.1,1787.2,1852.2,1881.947,1937.047,1965.296,2419.99,2396.89],"y":[3254,3254,3254,2739,2163,3848,4165,4289,4121,3964,3711,1725.168,1855.169,1870.362,1917.388,1861.5,1908.777,1972.19,2089.11769,2250.1,2065.2,2148.5,0,0,0,0,0,0,0,0,0,0,0,27.4332,32.4725,26.8716,38.1296,0,0,0,38.6769,41.8655,44.6735,44.9414,1251.614,1251.614,1251.614,2668.616,1159.3598,1322.066,1206.4482,1242.5195,1701.6495,2962.2138,3898.5837,646,646,646,439,550,844,1089,1233,1614,1724,2053,653,653,653,672,664,577,565,574,550,606,606,317.8015,317.8015,317.8015,322.1035,244.8211,378.4091,362.7333,386.655,330.8641,648.0556,640.8295,0,0,0,5.458,4.816,5.077,5.119,4.998,4.891,6.56677,4.36073,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7875.0167,8010.057,8019.6491,8801.6951,6647.4969,8883.3291,9365.4905,9857.96709,10614.3701,12020.70967,13107.21533],"text":["Source: Biomass<br />Capacity_MW:    810.920<br />Generation_GWh:   3254.00000","Source: Biomass<br />Capacity_MW:    810.920<br />Generation_GWh:   3254.00000","Source: Biomass<br />Capacity_MW:    810.920<br />Generation_GWh:   3254.00000","Source: Biomass<br />Capacity_MW:    810.920<br />Generation_GWh:   2739.00000","Source: Biomass<br />Capacity_MW:    810.920<br />Generation_GWh:   2163.00000","Source: Biomass<br />Capacity_MW:    858.920<br />Generation_GWh:   3848.00000","Source: Biomass<br />Capacity_MW:    860.190<br />Generation_GWh:   4165.00000","Source: Biomass<br />Capacity_MW:    860.190<br />Generation_GWh:   4289.00000","Source: Biomass<br />Capacity_MW:    885.590<br />Generation_GWh:   4121.00000","Source: Biomass<br />Capacity_MW:    885.590<br />Generation_GWh:   3964.00000","Source: Biomass<br />Capacity_MW:    885.590<br />Generation_GWh:   3711.00000","Source: Biomass<br />Capacity_MW:    271.000<br />Generation_GWh:   1725.16800","Source: Biomass<br />Capacity_MW:    313.100<br />Generation_GWh:   1855.16900","Source: Biomass<br />Capacity_MW:    313.100<br />Generation_GWh:   1870.36200","Source: Biomass<br />Capacity_MW:    313.100<br />Generation_GWh:   1917.38800","Source: Biomass<br />Capacity_MW:    323.200<br />Generation_GWh:   1861.50000","Source: Biomass<br />Capacity_MW:    340.200<br />Generation_GWh:   1908.77700","Source: Biomass<br />Capacity_MW:    358.697<br />Generation_GWh:   1972.19000","Source: Biomass<br />Capacity_MW:    413.797<br />Generation_GWh:   2089.11769","Source: Biomass<br />Capacity_MW:    416.646<br />Generation_GWh:   2250.10000","Source: Biomass<br />Capacity_MW:    438.300<br />Generation_GWh:   2065.20000","Source: Biomass<br />Capacity_MW:    428.000<br />Generation_GWh:   2148.50000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      1.600<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      1.600<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:     27.43320","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:     32.47250","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:     26.87160","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:     38.12960","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:     38.67690","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:     41.86550","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:     44.67350","Source: Biomass<br />Capacity_MW:     22.000<br />Generation_GWh:     44.94140","Source: Biomass<br />Capacity_MW:    209.000<br />Generation_GWh:   1251.61400","Source: Biomass<br />Capacity_MW:    176.000<br />Generation_GWh:   1251.61400","Source: Biomass<br />Capacity_MW:    176.000<br />Generation_GWh:   1251.61400","Source: Biomass<br />Capacity_MW:    148.000<br />Generation_GWh:   2668.61600","Source: Biomass<br />Capacity_MW:    207.000<br />Generation_GWh:   1159.35980","Source: Biomass<br />Capacity_MW:    207.000<br />Generation_GWh:   1322.06600","Source: Biomass<br />Capacity_MW:    207.000<br />Generation_GWh:   1206.44820","Source: Biomass<br />Capacity_MW:    207.000<br />Generation_GWh:   1242.51950","Source: Biomass<br />Capacity_MW:    207.000<br />Generation_GWh:   1701.64950","Source: Biomass<br />Capacity_MW:    592.000<br />Generation_GWh:   2962.21380","Source: Biomass<br />Capacity_MW:    574.000<br />Generation_GWh:   3898.58370","Source: Biomass<br />Capacity_MW:    278.160<br />Generation_GWh:    646.00000","Source: Biomass<br />Capacity_MW:    278.160<br />Generation_GWh:    646.00000","Source: Biomass<br />Capacity_MW:    278.160<br />Generation_GWh:    646.00000","Source: Biomass<br />Capacity_MW:    229.660<br />Generation_GWh:    439.00000","Source: Biomass<br />Capacity_MW:    229.660<br />Generation_GWh:    550.00000","Source: Biomass<br />Capacity_MW:    229.660<br />Generation_GWh:    844.00000","Source: Biomass<br />Capacity_MW:    239.640<br />Generation_GWh:   1089.00000","Source: Biomass<br />Capacity_MW:    239.640<br />Generation_GWh:   1233.00000","Source: Biomass<br />Capacity_MW:    239.640<br />Generation_GWh:   1614.00000","Source: Biomass<br />Capacity_MW:    239.640<br />Generation_GWh:   1724.00000","Source: Biomass<br />Capacity_MW:    244.840<br />Generation_GWh:   2053.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    653.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    653.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    653.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    672.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    664.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    577.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    565.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    574.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    550.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    606.00000","Source: Biomass<br />Capacity_MW:    127.300<br />Generation_GWh:    606.00000","Source: Biomass<br />Capacity_MW:     68.620<br />Generation_GWh:    317.80150","Source: Biomass<br />Capacity_MW:     66.120<br />Generation_GWh:    317.80150","Source: Biomass<br />Capacity_MW:     66.120<br />Generation_GWh:    317.80150","Source: Biomass<br />Capacity_MW:     66.120<br />Generation_GWh:    322.10350","Source: Biomass<br />Capacity_MW:     66.120<br />Generation_GWh:    244.82110","Source: Biomass<br />Capacity_MW:     66.120<br />Generation_GWh:    378.40910","Source: Biomass<br />Capacity_MW:     66.120<br />Generation_GWh:    362.73330","Source: Biomass<br />Capacity_MW:     66.120<br />Generation_GWh:    386.65500","Source: Biomass<br />Capacity_MW:     66.120<br />Generation_GWh:    330.86410","Source: Biomass<br />Capacity_MW:    112.560<br />Generation_GWh:    648.05560","Source: Biomass<br />Capacity_MW:    112.560<br />Generation_GWh:    640.82950","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      5.45800","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      4.81600","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      5.07700","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      5.11900","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      4.99800","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      4.89100","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      6.56677","Source: Biomass<br />Capacity_MW:      1.000<br />Generation_GWh:      4.36073","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Biomass<br />Capacity_MW:   1788.000<br />Generation_GWh:   7875.01670","Source: Biomass<br />Capacity_MW:   1794.600<br />Generation_GWh:   8010.05700","Source: Biomass<br />Capacity_MW:   1794.600<br />Generation_GWh:   8019.64910","Source: Biomass<br />Capacity_MW:   1718.100<br />Generation_GWh:   8801.69510","Source: Biomass<br />Capacity_MW:   1787.200<br />Generation_GWh:   6647.49690","Source: Biomass<br />Capacity_MW:   1852.200<br />Generation_GWh:   8883.32910","Source: Biomass<br />Capacity_MW:   1881.947<br />Generation_GWh:   9365.49050","Source: Biomass<br />Capacity_MW:   1937.047<br />Generation_GWh:   9857.96709","Source: Biomass<br />Capacity_MW:   1965.296<br />Generation_GWh:  10614.37010","Source: Biomass<br />Capacity_MW:   2419.990<br />Generation_GWh:  12020.70967","Source: Biomass<br />Capacity_MW:   2396.890<br />Generation_GWh:  13107.21533"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(225,138,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(225,138,0,1)"}},"hoveron":"points","name":"Biomass","legendgroup":"Biomass","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,0,0,0,0,0,0,0,0,0,0,5839.6,5863.6,5917.9,5918.3,5971.3,5735.3,5631.8,5690.327322,6258.3,6258,6266.8,1818.38,1800,1800,1822,1822,1826,1826,1826,1756,1651,1651.38,97.64,97.64,97.64,97.64,97.64,97.64,97.64,97.64,97.64,97.64,97.64,6437,6329,6339,6077,6077,4487,4275,3296,2291,153,0,0,0,0,0,0,0,0,0,0,0,0,541,541,541,541,541,490,490,490,490,490,490,1288,1288,1288,1288,1288,1288,1288,1288,1288,1288,1288,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16021.62,15919.24,15983.54,15743.94,15796.94,13923.94,13608.44,12687.96732,12180.94,9937.64,9793.82],"y":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"text":["Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   5839.600<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   5863.600<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   5917.900<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   5918.300<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   5971.300<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   5735.300<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   5631.800<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   5690.327<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   6258.300<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   6258.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   6266.800<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1818.380<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1800.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1800.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1822.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1822.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1826.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1826.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1826.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1756.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1651.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1651.380<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:     97.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   6437.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   6329.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   6339.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   6077.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   6077.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   4487.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   4275.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   3296.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   2291.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    153.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    541.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    541.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    541.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    541.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    541.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    490.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    490.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    490.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    490.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    490.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:    490.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   1288.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  16021.620<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  15919.240<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  15983.540<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  15743.940<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  15796.940<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  13923.940<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  13608.440<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  12687.967<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:  12180.940<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   9937.640<br />Generation_GWh:           NA","Source: Coal<br />Capacity_MW:   9793.820<br />Generation_GWh:           NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(190,156,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(190,156,0,1)"}},"hoveron":"points","name":"Coal","legendgroup":"Coal","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[12847.49,12613.697,12660.898,12733.048,12858.248,13201.771,13672.762,13672.762,13686.852,14206.752,15029,869,874.35,874.35,874.35,874.35,874.35,879,894,894,894,894,854,853,853,853,853,853,853,853,863,864,889,5037.79,5037.79,5037.79,5037.79,5037.79,5037.79,5037.79,5037.79,5238.79,5238.79,5238.79,8504.76,8410.08,8410.08,8416.08,8424.08,8463.08,8524.08,8524.08,8565.08,8972,8768,36473.477,36685.549,37439.617,38264.765,38414.05,38426.46,38183.753,39216.8,38433.353,40034.257,40211.97,948.95,948.95,948.95,948.95,948.95,948.95,956.8,956.8,956.8,956.8,956.8,403.75,403.75,403.75,403.75,403.75,373.75,375.58,375.58,375.58,375.58,375.58,0,0,0,0,0,0,0,0,0,0,0,6780.06,6775.45,6776.8,6776.8,6781.05,6781.05,6788.7,6783.06,6788.7,6766.42,6766.42,65,41.7,43,55.7,55.7,55.7,55.7,55.7,55.7,55.7,55.7,76.7,76.7,77.9,77.9,77.9,77.9,94.5,94.5,94.5,94.5,94.5,0,0,0,0,0,0,0,0,0,0,0,72860.977,72721.016,73526.135,74442.133,74728.868,75093.801,75421.665,76464.072,75952.355,78458.799,79279.76],"y":[60327.016,54247.228,64287.014,58699.09,56462.248,54151.855,61037.382,65140.911,59223.454,57572.873,57374.361,2316,1966.38,2113.03,2149.92,1695.3,1620,2035.623272,2318.68,2027.8,1861.1,1709,4572.91,4031.938,4392.985,4029.869,2961.924,3866.048,4641.153,4240.378,4448.811,4706.09,3425.612,36439.655,33650.538,33513.217,34588.464,33549.054,33268.922,34206.29,32185.436,35337.165,34494.874,34694.2011,35479.841,36032.181,34315.288,39615.428,39684.506,32555.293,34907.286,33887.136,37936.088,39199.464,37300,173356.235,172591.117,181099.757,187891.245,189422.842,177410.359,189691.867,191971.73,202530.144,197207.367,197667.969,3875.332,3730.625,2802.981,3543.113,2971.626,3325.35,3841.288,2857.28,3400.312,2963.114,2727.824,1075.368,1019.42,922.063,1095.095,1072.666,1006.746,1110.992,849.981,1003.987,1128.686,1003.304,0,0,0,0,0,0,0,0,0,0,0,40498.238,41709.866,40048.491,41790.388,36728.175,40278.706,40016.895,42186.461,41424.414,39047.826,40332,259.107,251.866,250.246,246.575,253.952,253.952,260.345,252.699,262.683,233.916,252.748776,320.443,334.608,330.632,348.293,379.056,380.431,388.066,430.194,424.99,410.668,421.884,0,0,0,0,0,0,0,0,0,0,0,358520.145,349565.767,364075.704,373997.48,365181.349,348117.662,372137.1873,376320.886,388019.848,378825.978,376908.9039],"text":["Source: Hydro<br />Capacity_MW:  12847.490<br />Generation_GWh:  60327.01600","Source: Hydro<br />Capacity_MW:  12613.697<br />Generation_GWh:  54247.22800","Source: Hydro<br />Capacity_MW:  12660.898<br />Generation_GWh:  64287.01400","Source: Hydro<br />Capacity_MW:  12733.048<br />Generation_GWh:  58699.09000","Source: Hydro<br />Capacity_MW:  12858.248<br />Generation_GWh:  56462.24800","Source: Hydro<br />Capacity_MW:  13201.771<br />Generation_GWh:  54151.85500","Source: Hydro<br />Capacity_MW:  13672.762<br />Generation_GWh:  61037.38200","Source: Hydro<br />Capacity_MW:  13672.762<br />Generation_GWh:  65140.91100","Source: Hydro<br />Capacity_MW:  13686.852<br />Generation_GWh:  59223.45400","Source: Hydro<br />Capacity_MW:  14206.752<br />Generation_GWh:  57572.87300","Source: Hydro<br />Capacity_MW:  15029.000<br />Generation_GWh:  57374.36100","Source: Hydro<br />Capacity_MW:    869.000<br />Generation_GWh:   2316.00000","Source: Hydro<br />Capacity_MW:    874.350<br />Generation_GWh:   1966.38000","Source: Hydro<br />Capacity_MW:    874.350<br />Generation_GWh:   2113.03000","Source: Hydro<br />Capacity_MW:    874.350<br />Generation_GWh:   2149.92000","Source: Hydro<br />Capacity_MW:    874.350<br />Generation_GWh:   1695.30000","Source: Hydro<br />Capacity_MW:    874.350<br />Generation_GWh:   1620.00000","Source: Hydro<br />Capacity_MW:    879.000<br />Generation_GWh:   2035.62327","Source: Hydro<br />Capacity_MW:    894.000<br />Generation_GWh:   2318.68000","Source: Hydro<br />Capacity_MW:    894.000<br />Generation_GWh:   2027.80000","Source: Hydro<br />Capacity_MW:    894.000<br />Generation_GWh:   1861.10000","Source: Hydro<br />Capacity_MW:    894.000<br />Generation_GWh:   1709.00000","Source: Hydro<br />Capacity_MW:    854.000<br />Generation_GWh:   4572.91000","Source: Hydro<br />Capacity_MW:    853.000<br />Generation_GWh:   4031.93800","Source: Hydro<br />Capacity_MW:    853.000<br />Generation_GWh:   4392.98500","Source: Hydro<br />Capacity_MW:    853.000<br />Generation_GWh:   4029.86900","Source: Hydro<br />Capacity_MW:    853.000<br />Generation_GWh:   2961.92400","Source: Hydro<br />Capacity_MW:    853.000<br />Generation_GWh:   3866.04800","Source: Hydro<br />Capacity_MW:    853.000<br />Generation_GWh:   4641.15300","Source: Hydro<br />Capacity_MW:    853.000<br />Generation_GWh:   4240.37800","Source: Hydro<br />Capacity_MW:    863.000<br />Generation_GWh:   4448.81100","Source: Hydro<br />Capacity_MW:    864.000<br />Generation_GWh:   4706.09000","Source: Hydro<br />Capacity_MW:    889.000<br />Generation_GWh:   3425.61200","Source: Hydro<br />Capacity_MW:   5037.790<br />Generation_GWh:  36439.65500","Source: Hydro<br />Capacity_MW:   5037.790<br />Generation_GWh:  33650.53800","Source: Hydro<br />Capacity_MW:   5037.790<br />Generation_GWh:  33513.21700","Source: Hydro<br />Capacity_MW:   5037.790<br />Generation_GWh:  34588.46400","Source: Hydro<br />Capacity_MW:   5037.790<br />Generation_GWh:  33549.05400","Source: Hydro<br />Capacity_MW:   5037.790<br />Generation_GWh:  33268.92200","Source: Hydro<br />Capacity_MW:   5037.790<br />Generation_GWh:  34206.29000","Source: Hydro<br />Capacity_MW:   5037.790<br />Generation_GWh:  32185.43600","Source: Hydro<br />Capacity_MW:   5238.790<br />Generation_GWh:  35337.16500","Source: Hydro<br />Capacity_MW:   5238.790<br />Generation_GWh:  34494.87400","Source: Hydro<br />Capacity_MW:   5238.790<br />Generation_GWh:  34694.20110","Source: Hydro<br />Capacity_MW:   8504.760<br />Generation_GWh:  35479.84100","Source: Hydro<br />Capacity_MW:   8410.080<br />Generation_GWh:  36032.18100","Source: Hydro<br />Capacity_MW:   8410.080<br />Generation_GWh:  34315.28800","Source: Hydro<br />Capacity_MW:   8416.080<br />Generation_GWh:  39615.42800","Source: Hydro<br />Capacity_MW:   8424.080<br />Generation_GWh:  39684.50600","Source: Hydro<br />Capacity_MW:   8463.080<br />Generation_GWh:  32555.29300","Source: Hydro<br />Capacity_MW:   8524.080<br />Generation_GWh:  34907.28600","Source: Hydro<br />Capacity_MW:   8524.080<br />Generation_GWh:  33887.13600","Source: Hydro<br />Capacity_MW:   8565.080<br />Generation_GWh:  37936.08800","Source: Hydro<br />Capacity_MW:   8972.000<br />Generation_GWh:  39199.46400","Source: Hydro<br />Capacity_MW:   8768.000<br />Generation_GWh:  37300.00000","Source: Hydro<br />Capacity_MW:  36473.477<br />Generation_GWh: 173356.23500","Source: Hydro<br />Capacity_MW:  36685.549<br />Generation_GWh: 172591.11700","Source: Hydro<br />Capacity_MW:  37439.617<br />Generation_GWh: 181099.75700","Source: Hydro<br />Capacity_MW:  38264.765<br />Generation_GWh: 187891.24500","Source: Hydro<br />Capacity_MW:  38414.050<br />Generation_GWh: 189422.84200","Source: Hydro<br />Capacity_MW:  38426.460<br />Generation_GWh: 177410.35900","Source: Hydro<br />Capacity_MW:  38183.753<br />Generation_GWh: 189691.86700","Source: Hydro<br />Capacity_MW:  39216.800<br />Generation_GWh: 191971.73000","Source: Hydro<br />Capacity_MW:  38433.353<br />Generation_GWh: 202530.14400","Source: Hydro<br />Capacity_MW:  40034.257<br />Generation_GWh: 197207.36700","Source: Hydro<br />Capacity_MW:  40211.970<br />Generation_GWh: 197667.96900","Source: Hydro<br />Capacity_MW:    948.950<br />Generation_GWh:   3875.33200","Source: Hydro<br />Capacity_MW:    948.950<br />Generation_GWh:   3730.62500","Source: Hydro<br />Capacity_MW:    948.950<br />Generation_GWh:   2802.98100","Source: Hydro<br />Capacity_MW:    948.950<br />Generation_GWh:   3543.11300","Source: Hydro<br />Capacity_MW:    948.950<br />Generation_GWh:   2971.62600","Source: Hydro<br />Capacity_MW:    948.950<br />Generation_GWh:   3325.35000","Source: Hydro<br />Capacity_MW:    956.800<br />Generation_GWh:   3841.28800","Source: Hydro<br />Capacity_MW:    956.800<br />Generation_GWh:   2857.28000","Source: Hydro<br />Capacity_MW:    956.800<br />Generation_GWh:   3400.31200","Source: Hydro<br />Capacity_MW:    956.800<br />Generation_GWh:   2963.11400","Source: Hydro<br />Capacity_MW:    956.800<br />Generation_GWh:   2727.82400","Source: Hydro<br />Capacity_MW:    403.750<br />Generation_GWh:   1075.36800","Source: Hydro<br />Capacity_MW:    403.750<br />Generation_GWh:   1019.42000","Source: Hydro<br />Capacity_MW:    403.750<br />Generation_GWh:    922.06300","Source: Hydro<br />Capacity_MW:    403.750<br />Generation_GWh:   1095.09500","Source: Hydro<br />Capacity_MW:    403.750<br />Generation_GWh:   1072.66600","Source: Hydro<br />Capacity_MW:    373.750<br />Generation_GWh:   1006.74600","Source: Hydro<br />Capacity_MW:    375.580<br />Generation_GWh:   1110.99200","Source: Hydro<br />Capacity_MW:    375.580<br />Generation_GWh:    849.98100","Source: Hydro<br />Capacity_MW:    375.580<br />Generation_GWh:   1003.98700","Source: Hydro<br />Capacity_MW:    375.580<br />Generation_GWh:   1128.68600","Source: Hydro<br />Capacity_MW:    375.580<br />Generation_GWh:   1003.30400","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:   6780.060<br />Generation_GWh:  40498.23800","Source: Hydro<br />Capacity_MW:   6775.450<br />Generation_GWh:  41709.86600","Source: Hydro<br />Capacity_MW:   6776.800<br />Generation_GWh:  40048.49100","Source: Hydro<br />Capacity_MW:   6776.800<br />Generation_GWh:  41790.38800","Source: Hydro<br />Capacity_MW:   6781.050<br />Generation_GWh:  36728.17500","Source: Hydro<br />Capacity_MW:   6781.050<br />Generation_GWh:  40278.70600","Source: Hydro<br />Capacity_MW:   6788.700<br />Generation_GWh:  40016.89500","Source: Hydro<br />Capacity_MW:   6783.060<br />Generation_GWh:  42186.46100","Source: Hydro<br />Capacity_MW:   6788.700<br />Generation_GWh:  41424.41400","Source: Hydro<br />Capacity_MW:   6766.420<br />Generation_GWh:  39047.82600","Source: Hydro<br />Capacity_MW:   6766.420<br />Generation_GWh:  40332.00000","Source: Hydro<br />Capacity_MW:     65.000<br />Generation_GWh:    259.10700","Source: Hydro<br />Capacity_MW:     41.700<br />Generation_GWh:    251.86600","Source: Hydro<br />Capacity_MW:     43.000<br />Generation_GWh:    250.24600","Source: Hydro<br />Capacity_MW:     55.700<br />Generation_GWh:    246.57500","Source: Hydro<br />Capacity_MW:     55.700<br />Generation_GWh:    253.95200","Source: Hydro<br />Capacity_MW:     55.700<br />Generation_GWh:    253.95200","Source: Hydro<br />Capacity_MW:     55.700<br />Generation_GWh:    260.34500","Source: Hydro<br />Capacity_MW:     55.700<br />Generation_GWh:    252.69900","Source: Hydro<br />Capacity_MW:     55.700<br />Generation_GWh:    262.68300","Source: Hydro<br />Capacity_MW:     55.700<br />Generation_GWh:    233.91600","Source: Hydro<br />Capacity_MW:     55.700<br />Generation_GWh:    252.74878","Source: Hydro<br />Capacity_MW:     76.700<br />Generation_GWh:    320.44300","Source: Hydro<br />Capacity_MW:     76.700<br />Generation_GWh:    334.60800","Source: Hydro<br />Capacity_MW:     77.900<br />Generation_GWh:    330.63200","Source: Hydro<br />Capacity_MW:     77.900<br />Generation_GWh:    348.29300","Source: Hydro<br />Capacity_MW:     77.900<br />Generation_GWh:    379.05600","Source: Hydro<br />Capacity_MW:     77.900<br />Generation_GWh:    380.43100","Source: Hydro<br />Capacity_MW:     94.500<br />Generation_GWh:    388.06600","Source: Hydro<br />Capacity_MW:     94.500<br />Generation_GWh:    430.19400","Source: Hydro<br />Capacity_MW:     94.500<br />Generation_GWh:    424.99000","Source: Hydro<br />Capacity_MW:     94.500<br />Generation_GWh:    410.66800","Source: Hydro<br />Capacity_MW:     94.500<br />Generation_GWh:    421.88400","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Hydro<br />Capacity_MW:  72860.977<br />Generation_GWh: 358520.14500","Source: Hydro<br />Capacity_MW:  72721.016<br />Generation_GWh: 349565.76700","Source: Hydro<br />Capacity_MW:  73526.135<br />Generation_GWh: 364075.70400","Source: Hydro<br />Capacity_MW:  74442.133<br />Generation_GWh: 373997.48000","Source: Hydro<br />Capacity_MW:  74728.868<br />Generation_GWh: 365181.34900","Source: Hydro<br />Capacity_MW:  75093.801<br />Generation_GWh: 348117.66200","Source: Hydro<br />Capacity_MW:  75421.665<br />Generation_GWh: 372137.18730","Source: Hydro<br />Capacity_MW:  76464.072<br />Generation_GWh: 376320.88600","Source: Hydro<br />Capacity_MW:  75952.355<br />Generation_GWh: 388019.84800","Source: Hydro<br />Capacity_MW:  78458.799<br />Generation_GWh: 378825.97800","Source: Hydro<br />Capacity_MW:  79279.760<br />Generation_GWh: 376908.90390"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(140,171,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(140,171,0,1)"}},"hoveron":"points","name":"Hydro","legendgroup":"Hydro","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1320,1425,1425,1425,1425,1425,1425.2,1425,1425,1425,1425,4770.2,4324.5,4425.2,4823.4,5138.6,5217.5,5251.454333,5682.755,5811.2,6160.63,7214,1053.45,1053.45,1053.45,1053.45,1146.45,1393.95,1393.95,1394,1328,1480,1709,368.1,368.1,368.1,368.1,368.1,368.1,368.1,368.1,368.1,368.1,368.1,2813,2907,2905,4344,4010,7122,7106,7499,7537,7038,7650,31.05,591.05,591.05,591.05,591.05,591.05,591.05,591.05,591.05,591.05,591.05,340,340,340,340,350,350,350,350,350,350,350,430,430,430,430,430,430,482,482,482.01,482.01,482.01,0,0,0,0,0,0,0,0,0,0,0,103,103,103,103,103,103,103,103,103,103,103,35,35,27.2,27.2,60.92,27.2,27.2,27.2,27.2,27.2,27.2,0,0,0,0,0,0,0,0,0,0,4.4,0,0,0,0,0,0,0,0,0,0,0,11263.8,11577.1,11668,13505.2,13623.12,17027.8,17097.95433,17922.105,18022.56,18024.99,19923.76],"y":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"text":["Source: Natural Gas<br />Capacity_MW:   1320.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1425.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   4770.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   4324.500<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   4425.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   4823.400<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   5138.600<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   5217.500<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   5251.454<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   5682.755<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   5811.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   6160.630<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   7214.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1053.450<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1053.450<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1053.450<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1053.450<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1146.450<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1393.950<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1393.950<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1394.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1328.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1480.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   1709.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    368.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   2813.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   2907.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   2905.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   4344.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   4010.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   7122.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   7106.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   7499.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   7537.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   7038.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:   7650.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     31.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    591.050<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    340.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    340.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    340.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    340.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    350.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    350.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    350.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    350.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    350.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    350.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    350.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    430.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    430.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    430.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    430.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    430.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    430.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    482.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    482.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    482.010<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    482.010<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    482.010<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:    103.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     35.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     35.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     27.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     27.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     60.920<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     27.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     27.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     27.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     27.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     27.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:     27.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      4.400<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  11263.800<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  11577.100<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  11668.000<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  13505.200<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  13623.120<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  17027.800<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  17097.954<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  17922.105<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  18022.560<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  18024.990<br />Generation_GWh:           NA","Source: Natural Gas<br />Capacity_MW:  19923.760<br />Generation_GWh:           NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(36,183,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(36,183,0,1)"}},"hoveron":"points","name":"Natural Gas","legendgroup":"Natural Gas","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[810.92,810.92,810.92,810.92,912.92,960.92,1106.19,1106.19,1273.59,1376.39,1376.39,522,699.3,838.3,838.3,914.4,1063.4,1223.697,1501.797,1504.646,1878.7,1897.4,15.8,171.18,171.18,171.18,171.18,171.18,196.68,196.68,196.68,201.78,226.1,42,125.95,125.95,125.95,125.95,125.95,263.95,280.45,280.45,280.85,280.85,240.45,610.48,692.77,962.72,1469.57,1935.13,2596.4,2905.3,3716.7,5591.4,7067,485.16,595.16,695.16,756.66,889.66,893.66,1162.64,1593.64,2643.64,3105.04,3507.24,127.3,127.3,127.3,223.3,322.3,322.3,421.3,421.3,421.3,421.5,421.5,103.32,103.22,108.42,109.32,109.32,188.32,282.72,386.32,392.29,441.33,557.13,14,14,73,73,152,164,164,164,174,204.4,204.4,0,0,0,0,54,54,54,54,54,54.035,54.035,0,0,0,0,0,0,0,9.2,9.2,9.5,9.5,0,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.833,0.833,0,0,0,0,0,0,0,0,0,0.035,0.035,2360.95,3258.31,3643.8,4072.15,5122.1,5879.66,7472.377,8619.677,10667.296,13565.793,15602.413],"y":[3254,3254,3254,2739,2197,3970.7,4649.9,4797,4980.8,5035.2,4917.3,2466.168,2776.535,3300.629,3390.29,3419.4,3537.398,4344.19,4690.11769,5308.1,5584.2,6237.5,91.916,573,620,574.391,578.582,506.587,682,655.336,646,636,684,80.8532,357.5875,351.9866,449.9816,364.512,343.196,746.902,915.4239,909.6715,955.9925,905.26976,1277.272,1396.793,1745.332,4068.616,3464.3598,4245.066,5504.4482,6684.5195,8074.6495,11578.2138,17099.5837,1062,1065,1263,1004,1872,2391,2489,3795,6335,8374,10991,653,653,653,672,934.134,966.127,1257.973,1306.953,1287.271,1391.85,1342.57584,403.2465,427.3365,474.7885,470.7125,398.8301,765.0791,1145.2303,1186.944,1096.2761,1396.7336,1655.904749,40.104,36.249,39.633,147.124,352.144,462.702,492.794,472.619,503.92,601.33477,591.19313,0,0,0,0,102.365,183.379,197.964,195.044,191.904,176.963,188.74296,0,0,0,0,0,0,0,0,15.852,19.854,20.843,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9328.5597,10539.501,11702.3691,13516.1151,13683.3269,17371.2341,21510.4015,24698.95709,29349.4441,35750.34167,44633.91314],"text":["Source: Non-hydro renewables<br />Capacity_MW:    810.920<br />Generation_GWh:   3254.00000","Source: Non-hydro renewables<br />Capacity_MW:    810.920<br />Generation_GWh:   3254.00000","Source: Non-hydro renewables<br />Capacity_MW:    810.920<br />Generation_GWh:   3254.00000","Source: Non-hydro renewables<br />Capacity_MW:    810.920<br />Generation_GWh:   2739.00000","Source: Non-hydro renewables<br />Capacity_MW:    912.920<br />Generation_GWh:   2197.00000","Source: Non-hydro renewables<br />Capacity_MW:    960.920<br />Generation_GWh:   3970.70000","Source: Non-hydro renewables<br />Capacity_MW:   1106.190<br />Generation_GWh:   4649.90000","Source: Non-hydro renewables<br />Capacity_MW:   1106.190<br />Generation_GWh:   4797.00000","Source: Non-hydro renewables<br />Capacity_MW:   1273.590<br />Generation_GWh:   4980.80000","Source: Non-hydro renewables<br />Capacity_MW:   1376.390<br />Generation_GWh:   5035.20000","Source: Non-hydro renewables<br />Capacity_MW:   1376.390<br />Generation_GWh:   4917.30000","Source: Non-hydro renewables<br />Capacity_MW:    522.000<br />Generation_GWh:   2466.16800","Source: Non-hydro renewables<br />Capacity_MW:    699.300<br />Generation_GWh:   2776.53500","Source: Non-hydro renewables<br />Capacity_MW:    838.300<br />Generation_GWh:   3300.62900","Source: Non-hydro renewables<br />Capacity_MW:    838.300<br />Generation_GWh:   3390.29000","Source: Non-hydro renewables<br />Capacity_MW:    914.400<br />Generation_GWh:   3419.40000","Source: Non-hydro renewables<br />Capacity_MW:   1063.400<br />Generation_GWh:   3537.39800","Source: Non-hydro renewables<br />Capacity_MW:   1223.697<br />Generation_GWh:   4344.19000","Source: Non-hydro renewables<br />Capacity_MW:   1501.797<br />Generation_GWh:   4690.11769","Source: Non-hydro renewables<br />Capacity_MW:   1504.646<br />Generation_GWh:   5308.10000","Source: Non-hydro renewables<br />Capacity_MW:   1878.700<br />Generation_GWh:   5584.20000","Source: Non-hydro renewables<br />Capacity_MW:   1897.400<br />Generation_GWh:   6237.50000","Source: Non-hydro renewables<br />Capacity_MW:     15.800<br />Generation_GWh:     91.91600","Source: Non-hydro renewables<br />Capacity_MW:    171.180<br />Generation_GWh:    573.00000","Source: Non-hydro renewables<br />Capacity_MW:    171.180<br />Generation_GWh:    620.00000","Source: Non-hydro renewables<br />Capacity_MW:    171.180<br />Generation_GWh:    574.39100","Source: Non-hydro renewables<br />Capacity_MW:    171.180<br />Generation_GWh:    578.58200","Source: Non-hydro renewables<br />Capacity_MW:    171.180<br />Generation_GWh:    506.58700","Source: Non-hydro renewables<br />Capacity_MW:    196.680<br />Generation_GWh:    682.00000","Source: Non-hydro renewables<br />Capacity_MW:    196.680<br />Generation_GWh:    655.33600","Source: Non-hydro renewables<br />Capacity_MW:    196.680<br />Generation_GWh:    646.00000","Source: Non-hydro renewables<br />Capacity_MW:    201.780<br />Generation_GWh:    636.00000","Source: Non-hydro renewables<br />Capacity_MW:    226.100<br />Generation_GWh:    684.00000","Source: Non-hydro renewables<br />Capacity_MW:     42.000<br />Generation_GWh:     80.85320","Source: Non-hydro renewables<br />Capacity_MW:    125.950<br />Generation_GWh:    357.58750","Source: Non-hydro renewables<br />Capacity_MW:    125.950<br />Generation_GWh:    351.98660","Source: Non-hydro renewables<br />Capacity_MW:    125.950<br />Generation_GWh:    449.98160","Source: Non-hydro renewables<br />Capacity_MW:    125.950<br />Generation_GWh:    364.51200","Source: Non-hydro renewables<br />Capacity_MW:    125.950<br />Generation_GWh:    343.19600","Source: Non-hydro renewables<br />Capacity_MW:    263.950<br />Generation_GWh:    746.90200","Source: Non-hydro renewables<br />Capacity_MW:    280.450<br />Generation_GWh:    915.42390","Source: Non-hydro renewables<br />Capacity_MW:    280.450<br />Generation_GWh:    909.67150","Source: Non-hydro renewables<br />Capacity_MW:    280.850<br />Generation_GWh:    955.99250","Source: Non-hydro renewables<br />Capacity_MW:    280.850<br />Generation_GWh:    905.26976","Source: Non-hydro renewables<br />Capacity_MW:    240.450<br />Generation_GWh:   1277.27200","Source: Non-hydro renewables<br />Capacity_MW:    610.480<br />Generation_GWh:   1396.79300","Source: Non-hydro renewables<br />Capacity_MW:    692.770<br />Generation_GWh:   1745.33200","Source: Non-hydro renewables<br />Capacity_MW:    962.720<br />Generation_GWh:   4068.61600","Source: Non-hydro renewables<br />Capacity_MW:   1469.570<br />Generation_GWh:   3464.35980","Source: Non-hydro renewables<br />Capacity_MW:   1935.130<br />Generation_GWh:   4245.06600","Source: Non-hydro renewables<br />Capacity_MW:   2596.400<br />Generation_GWh:   5504.44820","Source: Non-hydro renewables<br />Capacity_MW:   2905.300<br />Generation_GWh:   6684.51950","Source: Non-hydro renewables<br />Capacity_MW:   3716.700<br />Generation_GWh:   8074.64950","Source: Non-hydro renewables<br />Capacity_MW:   5591.400<br />Generation_GWh:  11578.21380","Source: Non-hydro renewables<br />Capacity_MW:   7067.000<br />Generation_GWh:  17099.58370","Source: Non-hydro renewables<br />Capacity_MW:    485.160<br />Generation_GWh:   1062.00000","Source: Non-hydro renewables<br />Capacity_MW:    595.160<br />Generation_GWh:   1065.00000","Source: Non-hydro renewables<br />Capacity_MW:    695.160<br />Generation_GWh:   1263.00000","Source: Non-hydro renewables<br />Capacity_MW:    756.660<br />Generation_GWh:   1004.00000","Source: Non-hydro renewables<br />Capacity_MW:    889.660<br />Generation_GWh:   1872.00000","Source: Non-hydro renewables<br />Capacity_MW:    893.660<br />Generation_GWh:   2391.00000","Source: Non-hydro renewables<br />Capacity_MW:   1162.640<br />Generation_GWh:   2489.00000","Source: Non-hydro renewables<br />Capacity_MW:   1593.640<br />Generation_GWh:   3795.00000","Source: Non-hydro renewables<br />Capacity_MW:   2643.640<br />Generation_GWh:   6335.00000","Source: Non-hydro renewables<br />Capacity_MW:   3105.040<br />Generation_GWh:   8374.00000","Source: Non-hydro renewables<br />Capacity_MW:   3507.240<br />Generation_GWh:  10991.00000","Source: Non-hydro renewables<br />Capacity_MW:    127.300<br />Generation_GWh:    653.00000","Source: Non-hydro renewables<br />Capacity_MW:    127.300<br />Generation_GWh:    653.00000","Source: Non-hydro renewables<br />Capacity_MW:    127.300<br />Generation_GWh:    653.00000","Source: Non-hydro renewables<br />Capacity_MW:    223.300<br />Generation_GWh:    672.00000","Source: Non-hydro renewables<br />Capacity_MW:    322.300<br />Generation_GWh:    934.13400","Source: Non-hydro renewables<br />Capacity_MW:    322.300<br />Generation_GWh:    966.12700","Source: Non-hydro renewables<br />Capacity_MW:    421.300<br />Generation_GWh:   1257.97300","Source: Non-hydro renewables<br />Capacity_MW:    421.300<br />Generation_GWh:   1306.95300","Source: Non-hydro renewables<br />Capacity_MW:    421.300<br />Generation_GWh:   1287.27100","Source: Non-hydro renewables<br />Capacity_MW:    421.500<br />Generation_GWh:   1391.85000","Source: Non-hydro renewables<br />Capacity_MW:    421.500<br />Generation_GWh:   1342.57584","Source: Non-hydro renewables<br />Capacity_MW:    103.320<br />Generation_GWh:    403.24650","Source: Non-hydro renewables<br />Capacity_MW:    103.220<br />Generation_GWh:    427.33650","Source: Non-hydro renewables<br />Capacity_MW:    108.420<br />Generation_GWh:    474.78850","Source: Non-hydro renewables<br />Capacity_MW:    109.320<br />Generation_GWh:    470.71250","Source: Non-hydro renewables<br />Capacity_MW:    109.320<br />Generation_GWh:    398.83010","Source: Non-hydro renewables<br />Capacity_MW:    188.320<br />Generation_GWh:    765.07910","Source: Non-hydro renewables<br />Capacity_MW:    282.720<br />Generation_GWh:   1145.23030","Source: Non-hydro renewables<br />Capacity_MW:    386.320<br />Generation_GWh:   1186.94400","Source: Non-hydro renewables<br />Capacity_MW:    392.290<br />Generation_GWh:   1096.27610","Source: Non-hydro renewables<br />Capacity_MW:    441.330<br />Generation_GWh:   1396.73360","Source: Non-hydro renewables<br />Capacity_MW:    557.130<br />Generation_GWh:   1655.90475","Source: Non-hydro renewables<br />Capacity_MW:     14.000<br />Generation_GWh:     40.10400","Source: Non-hydro renewables<br />Capacity_MW:     14.000<br />Generation_GWh:     36.24900","Source: Non-hydro renewables<br />Capacity_MW:     73.000<br />Generation_GWh:     39.63300","Source: Non-hydro renewables<br />Capacity_MW:     73.000<br />Generation_GWh:    147.12400","Source: Non-hydro renewables<br />Capacity_MW:    152.000<br />Generation_GWh:    352.14400","Source: Non-hydro renewables<br />Capacity_MW:    164.000<br />Generation_GWh:    462.70200","Source: Non-hydro renewables<br />Capacity_MW:    164.000<br />Generation_GWh:    492.79400","Source: Non-hydro renewables<br />Capacity_MW:    164.000<br />Generation_GWh:    472.61900","Source: Non-hydro renewables<br />Capacity_MW:    174.000<br />Generation_GWh:    503.92000","Source: Non-hydro renewables<br />Capacity_MW:    204.400<br />Generation_GWh:    601.33477","Source: Non-hydro renewables<br />Capacity_MW:    204.400<br />Generation_GWh:    591.19313","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:     54.000<br />Generation_GWh:    102.36500","Source: Non-hydro renewables<br />Capacity_MW:     54.000<br />Generation_GWh:    183.37900","Source: Non-hydro renewables<br />Capacity_MW:     54.000<br />Generation_GWh:    197.96400","Source: Non-hydro renewables<br />Capacity_MW:     54.000<br />Generation_GWh:    195.04400","Source: Non-hydro renewables<br />Capacity_MW:     54.000<br />Generation_GWh:    191.90400","Source: Non-hydro renewables<br />Capacity_MW:     54.035<br />Generation_GWh:    176.96300","Source: Non-hydro renewables<br />Capacity_MW:     54.035<br />Generation_GWh:    188.74296","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      9.200<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      9.200<br />Generation_GWh:     15.85200","Source: Non-hydro renewables<br />Capacity_MW:      9.500<br />Generation_GWh:     19.85400","Source: Non-hydro renewables<br />Capacity_MW:      9.500<br />Generation_GWh:     20.84300","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.833<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.833<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.035<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:      0.035<br />Generation_GWh:      0.00000","Source: Non-hydro renewables<br />Capacity_MW:   2360.950<br />Generation_GWh:   9328.55970","Source: Non-hydro renewables<br />Capacity_MW:   3258.310<br />Generation_GWh:  10539.50100","Source: Non-hydro renewables<br />Capacity_MW:   3643.800<br />Generation_GWh:  11702.36910","Source: Non-hydro renewables<br />Capacity_MW:   4072.150<br />Generation_GWh:  13516.11510","Source: Non-hydro renewables<br />Capacity_MW:   5122.100<br />Generation_GWh:  13683.32690","Source: Non-hydro renewables<br />Capacity_MW:   5879.660<br />Generation_GWh:  17371.23410","Source: Non-hydro renewables<br />Capacity_MW:   7472.377<br />Generation_GWh:  21510.40150","Source: Non-hydro renewables<br />Capacity_MW:   8619.677<br />Generation_GWh:  24698.95709","Source: Non-hydro renewables<br />Capacity_MW:  10667.296<br />Generation_GWh:  29349.44410","Source: Non-hydro renewables<br />Capacity_MW:  13565.793<br />Generation_GWh:  35750.34167","Source: Non-hydro renewables<br />Capacity_MW:  15602.413<br />Generation_GWh:  44633.91314"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,190,112,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,190,112,1)"}},"hoveron":"points","name":"Non-hydro renewables","legendgroup":"Non-hydro renewables","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11450,11990,11990,11990,11990,11990,11990,11990,13640,13568,13568,675,675,675,675,675,675,675,0,0,0,0,680,680,680,680,680,680,680,680,705,705,705,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12805,13345,13345,13345,13345,13345,13345,12670,14345,14273,14273],"y":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"text":["Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  11450.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  11990.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  11990.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  11990.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  11990.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  11990.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  11990.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  11990.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13640.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13568.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13568.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    675.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    675.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    675.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    675.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    675.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    675.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    675.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    680.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    680.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    680.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    680.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    680.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    680.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    680.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    680.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    705.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    705.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:    705.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  12805.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13345.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13345.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13345.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13345.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13345.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  13345.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  12670.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  14345.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  14273.000<br />Generation_GWh:           NA","Source: Nuclear<br />Capacity_MW:  14273.000<br />Generation_GWh:           NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,193,171,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,193,171,1)"}},"hoveron":"points","name":"Nuclear","legendgroup":"Nuclear","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[51.96,51.96,51.96,51.96,51.96,36.46,82.46,36.46,82.46,82.46,82.46,7.15,7.15,7.15,7.15,7.15,7.15,7.15,7.15,7.15,7.15,7.15,1.17,1.17,1.17,4,4,5,5,0,5,16,1.17,32.38,32,32,32,32,32,32,32,32,10,12.12,2130,2125.685,2125.85,2126.3,2126.87,2128.17,2156.305,2156.305,2156.305,2291.75,2291.75,1595,1544,1665,1633,1633,1502,1007,0,1007,538,253.12,1594,1594,1594,1594,1582,1582,1582,1582,1582,1582,1582,222.3,222.3,222.3,222.3,222,222.3,222.3,222.3,222.3,222.3,222.3,159,159,159,159,159,160,160,160,162,162,159,759,759,759,759,789,789,786,786,760,868,868,114,74.923,79.98,84.398,99.798,99.798,99.74,99.74,103.56,77.76,94.07,33.34,33.34,33.34,33.34,33.34,33.57,33.57,33.57,33.57,33.57,24.57,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,6753.58,6658.808,6785.03,6760.728,6794.398,6651.728,6227.805,5169.805,6207.625,5945.27,5651.99],"y":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"text":["Source: Oil<br />Capacity_MW:     51.960<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     51.960<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     51.960<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     51.960<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     51.960<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     36.460<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     82.460<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     36.460<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     82.460<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     82.460<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     82.460<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      7.150<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      1.170<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      1.170<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      1.170<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      4.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      4.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      5.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      5.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      5.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     16.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      1.170<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.380<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     32.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     10.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     12.120<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2130.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2125.685<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2125.850<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2126.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2126.870<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2128.170<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2156.305<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2156.305<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2156.305<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2291.750<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   2291.750<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1595.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1544.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1665.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1633.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1633.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1502.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1007.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:      0.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1007.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    538.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    253.120<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1594.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1594.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1594.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1594.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1582.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1582.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1582.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1582.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1582.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1582.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   1582.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    222.300<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    159.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    159.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    159.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    159.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    159.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    162.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    162.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    159.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    759.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    759.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    759.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    759.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    789.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    789.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    786.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    786.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    760.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    868.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    868.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    114.000<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     74.923<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     79.980<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     84.398<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     99.798<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     99.798<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     99.740<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     99.740<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:    103.560<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     77.760<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     94.070<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     24.570<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   6753.580<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   6658.808<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   6785.030<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   6760.728<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   6794.398<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   6651.728<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   6227.805<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   5169.805<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   6207.625<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   5945.270<br />Generation_GWh:           NA","Source: Oil<br />Capacity_MW:   5651.990<br />Generation_GWh:           NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,187,218,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,187,218,1)"}},"hoveron":"points","name":"Oil","legendgroup":"Oil","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"y":[63653.1294,67034.75615,67122,66109.3,67056.4,68411.10406,66674.02624,68067.70826,70716.9,75377.4,73593.5,4192.654,4096.353,4288.963,4633.976,6397.403,6101.182,3569.979,3646.531,3646.846,4399.789,4273,242388.9267,240529.7605,247296.3253,239022.3574,222565.7875,228969.5784,223054.8693,223979.9104,230191.2393,233108.4204,224496.9163,556.334,503.412,564.17,523.305,271.76,174.446,186.836,141.402,141.724,113.561,158,16804.622,14083.495,13812.854,10376.356,9553.097,7124.268,6702.433,6123.806,10382.459,12114.739,10308,1638.113,1058.205,1534.822,1416.297,1338.12,1280.75,1389.157,1321.001,1460.821,1829.179,1793,11061.767,10092.53,11280.068,10748.969,10235.404,10295.291,9331.764,9041.96,8654.626,8507.163,8369,141.645,144.709,148.881,182.199,161.925,161.925,98.308,98.307,98.307,157.598,187,434.1433,434.1433,434.1433,492.8924,388.2525,301.1703,192.2351,194.6981,297.2833,475.3714,444,122578.252,121194.952,122832.332,122513.62,104897.124,114315.023,114676.706,114158.291,116367.045,113136.674,105599.4163,6.313,7.528,5.099,2.865,4.92,3.776,4.81,14.511,8.156,5.656,5,6054.208,6804.843,9647.362,4836.407,5010.862,4739.898,4319.542,4791.266,306.654,106.558,252,15245.33,15050.99,15601.976,17162.286,17227.916,16035.779,15872.205,16356.064,18087.127,16862.048,19489,22.416,23.844,23.655,23.885,22.604,24.966,36.868,24.365,23.291,22.684,26],"text":["Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  63653.12940","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  67034.75615","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  67122.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  66109.30000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  67056.40000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  68411.10406","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  66674.02624","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  68067.70826","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  70716.90000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  75377.40000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  73593.50000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4192.65400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4096.35300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4288.96300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4633.97600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   6397.40300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   6101.18200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   3569.97900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   3646.53100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   3646.84600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4399.78900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4273.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 242388.92670","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 240529.76050","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 247296.32530","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 239022.35740","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 222565.78750","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 228969.57840","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 223054.86930","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 223979.91040","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 230191.23930","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 233108.42040","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 224496.91630","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    556.33400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    503.41200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    564.17000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    523.30500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    271.76000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    174.44600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    186.83600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    141.40200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    141.72400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    113.56100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    158.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  16804.62200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  14083.49500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  13812.85400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  10376.35600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   9553.09700","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   7124.26800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   6702.43300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   6123.80600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  10382.45900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  12114.73900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  10308.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1638.11300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1058.20500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1534.82200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1416.29700","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1338.12000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1280.75000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1389.15700","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1321.00100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1460.82100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1829.17900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   1793.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  11061.76700","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  10092.53000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  11280.06800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  10748.96900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  10235.40400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  10295.29100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   9331.76400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   9041.96000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   8654.62600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   8507.16300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   8369.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    141.64500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    144.70900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    148.88100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    182.19900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    161.92500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    161.92500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     98.30800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     98.30700","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     98.30700","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    157.59800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    187.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    434.14330","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    434.14330","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    434.14330","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    492.89240","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    388.25250","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    301.17030","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    192.23510","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    194.69810","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    297.28330","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    475.37140","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    444.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 122578.25200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 121194.95200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 122832.33200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 122513.62000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 104897.12400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 114315.02300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 114676.70600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 114158.29100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 116367.04500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 113136.67400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh: 105599.41630","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      6.31300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      7.52800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      5.09900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      2.86500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      4.92000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      3.77600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      4.81000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     14.51100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      8.15600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      5.65600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:      5.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   6054.20800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   6804.84300","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   9647.36200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4836.40700","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   5010.86200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4739.89800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4319.54200","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:   4791.26600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    306.65400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    106.55800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:    252.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  15245.33000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  15050.99000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  15601.97600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  17162.28600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  17227.91600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  16035.77900","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  15872.20500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  16356.06400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  18087.12700","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  16862.04800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:  19489.00000","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     22.41600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     23.84400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     23.65500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     23.88500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     22.60400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     24.96600","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     36.86800","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     24.36500","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     23.29100","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     22.68400","Source: Other sources<br />Capacity_MW:         NA<br />Generation_GWh:     26.00000"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,172,252,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,172,252,1)"}},"hoveron":"points","name":"Other sources","legendgroup":"Other sources","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[13658.41,13424.617,13471.818,13543.968,13771.168,14162.691,14778.952,14778.952,14960.442,15583.142,16405.39,1391,1573.65,1712.65,1712.65,1788.75,1937.75,2102.697,2395.797,2398.646,2772.7,2791.4,869.8,1024.18,1024.18,1024.18,1024.18,1024.18,1049.68,1049.68,1059.68,1065.78,1115.1,5079.79,5163.74,5163.74,5163.74,5163.74,5163.74,5301.74,5318.24,5519.24,5519.64,5519.64,8745.21,9020.56,9102.85,9378.8,9893.65,10398.21,11120.48,11429.38,12281.78,14563.4,15835,36958.637,37280.709,38134.777,39021.425,39303.71,39320.12,39346.393,40810.44,41076.993,43139.297,43719.21,1076.25,1076.25,1076.25,1172.25,1271.25,1271.25,1378.1,1378.1,1378.1,1378.3,1378.3,507.07,506.97,512.17,513.07,513.07,562.07,658.3,761.9,767.87,816.91,932.71,14,14,73,73,152,164,164,164,174,204.4,204.4,6780.06,6775.45,6776.8,6776.8,6835.05,6835.05,6842.7,6837.06,6842.7,6820.455,6820.455,65,41.7,43,55.7,55.7,55.7,55.7,64.9,64.9,65.2,65.2,76.7,77.5,78.7,78.7,78.7,78.7,95.3,95.3,95.3,95.333,95.333,0,0,0,0,0,0,0,0,0,0.035,0.035,75221.927,75979.326,77169.935,78514.283,79850.968,80973.461,82894.042,85083.749,86619.651,92024.592,94882.173],"y":[63581.016,57501.228,67541.014,61438.09,58659.248,58122.555,65687.282,69937.911,64204.254,62608.073,62291.661,4782.168,4742.915,5413.659,5540.21,5114.7,5157.398,6379.813272,7008.79769,7335.9,7445.3,7946.5,4664.826,4604.938,5012.985,4604.26,3540.506,4372.635,5323.153,4895.714,5094.811,5342.09,4109.612,36520.5082,34008.1255,33865.2036,35038.4456,33913.566,33612.118,34953.192,33100.8599,36246.8365,35450.8665,35599.47086,36757.113,37428.974,36060.62,43684.044,43148.8658,36800.359,40411.7342,40571.6555,46010.7375,50777.6778,54399.5837,174418.235,173656.117,182362.757,188895.245,191294.842,179801.359,192180.867,195766.73,208865.144,205581.367,208658.969,4528.332,4383.625,3455.981,4215.113,3905.76,4291.477,5099.261,4164.233,4687.583,4354.964,4070.39984,1478.6145,1446.7565,1396.8515,1565.8075,1471.4961,1771.8251,2256.2223,2036.925,2100.2631,2525.4196,2659.208749,40.104,36.249,39.633,147.124,352.144,462.702,492.794,472.619,503.92,601.33477,591.19313,40498.238,41709.866,40048.491,41790.388,36830.54,40462.085,40214.859,42381.505,41616.318,39224.789,40520.74296,259.107,251.866,250.246,246.575,253.952,253.952,260.345,252.699,278.535,253.77,273.591776,320.443,334.608,330.632,348.293,379.056,380.431,388.066,430.194,424.99,410.668,421.884,0,0,0,0,0,0,0,0,0,0,0,367848.7047,360105.268,375778.0731,387513.5951,378864.6759,365488.8961,393647.5888,401019.8431,417369.2921,414576.3197,421542.817],"text":["Source: Renewables<br />Capacity_MW:  13658.410<br />Generation_GWh:  63581.01600","Source: Renewables<br />Capacity_MW:  13424.617<br />Generation_GWh:  57501.22800","Source: Renewables<br />Capacity_MW:  13471.818<br />Generation_GWh:  67541.01400","Source: Renewables<br />Capacity_MW:  13543.968<br />Generation_GWh:  61438.09000","Source: Renewables<br />Capacity_MW:  13771.168<br />Generation_GWh:  58659.24800","Source: Renewables<br />Capacity_MW:  14162.691<br />Generation_GWh:  58122.55500","Source: Renewables<br />Capacity_MW:  14778.952<br />Generation_GWh:  65687.28200","Source: Renewables<br />Capacity_MW:  14778.952<br />Generation_GWh:  69937.91100","Source: Renewables<br />Capacity_MW:  14960.442<br />Generation_GWh:  64204.25400","Source: Renewables<br />Capacity_MW:  15583.142<br />Generation_GWh:  62608.07300","Source: Renewables<br />Capacity_MW:  16405.390<br />Generation_GWh:  62291.66100","Source: Renewables<br />Capacity_MW:   1391.000<br />Generation_GWh:   4782.16800","Source: Renewables<br />Capacity_MW:   1573.650<br />Generation_GWh:   4742.91500","Source: Renewables<br />Capacity_MW:   1712.650<br />Generation_GWh:   5413.65900","Source: Renewables<br />Capacity_MW:   1712.650<br />Generation_GWh:   5540.21000","Source: Renewables<br />Capacity_MW:   1788.750<br />Generation_GWh:   5114.70000","Source: Renewables<br />Capacity_MW:   1937.750<br />Generation_GWh:   5157.39800","Source: Renewables<br />Capacity_MW:   2102.697<br />Generation_GWh:   6379.81327","Source: Renewables<br />Capacity_MW:   2395.797<br />Generation_GWh:   7008.79769","Source: Renewables<br />Capacity_MW:   2398.646<br />Generation_GWh:   7335.90000","Source: Renewables<br />Capacity_MW:   2772.700<br />Generation_GWh:   7445.30000","Source: Renewables<br />Capacity_MW:   2791.400<br />Generation_GWh:   7946.50000","Source: Renewables<br />Capacity_MW:    869.800<br />Generation_GWh:   4664.82600","Source: Renewables<br />Capacity_MW:   1024.180<br />Generation_GWh:   4604.93800","Source: Renewables<br />Capacity_MW:   1024.180<br />Generation_GWh:   5012.98500","Source: Renewables<br />Capacity_MW:   1024.180<br />Generation_GWh:   4604.26000","Source: Renewables<br />Capacity_MW:   1024.180<br />Generation_GWh:   3540.50600","Source: Renewables<br />Capacity_MW:   1024.180<br />Generation_GWh:   4372.63500","Source: Renewables<br />Capacity_MW:   1049.680<br />Generation_GWh:   5323.15300","Source: Renewables<br />Capacity_MW:   1049.680<br />Generation_GWh:   4895.71400","Source: Renewables<br />Capacity_MW:   1059.680<br />Generation_GWh:   5094.81100","Source: Renewables<br />Capacity_MW:   1065.780<br />Generation_GWh:   5342.09000","Source: Renewables<br />Capacity_MW:   1115.100<br />Generation_GWh:   4109.61200","Source: Renewables<br />Capacity_MW:   5079.790<br />Generation_GWh:  36520.50820","Source: Renewables<br />Capacity_MW:   5163.740<br />Generation_GWh:  34008.12550","Source: Renewables<br />Capacity_MW:   5163.740<br />Generation_GWh:  33865.20360","Source: Renewables<br />Capacity_MW:   5163.740<br />Generation_GWh:  35038.44560","Source: Renewables<br />Capacity_MW:   5163.740<br />Generation_GWh:  33913.56600","Source: Renewables<br />Capacity_MW:   5163.740<br />Generation_GWh:  33612.11800","Source: Renewables<br />Capacity_MW:   5301.740<br />Generation_GWh:  34953.19200","Source: Renewables<br />Capacity_MW:   5318.240<br />Generation_GWh:  33100.85990","Source: Renewables<br />Capacity_MW:   5519.240<br />Generation_GWh:  36246.83650","Source: Renewables<br />Capacity_MW:   5519.640<br />Generation_GWh:  35450.86650","Source: Renewables<br />Capacity_MW:   5519.640<br />Generation_GWh:  35599.47086","Source: Renewables<br />Capacity_MW:   8745.210<br />Generation_GWh:  36757.11300","Source: Renewables<br />Capacity_MW:   9020.560<br />Generation_GWh:  37428.97400","Source: Renewables<br />Capacity_MW:   9102.850<br />Generation_GWh:  36060.62000","Source: Renewables<br />Capacity_MW:   9378.800<br />Generation_GWh:  43684.04400","Source: Renewables<br />Capacity_MW:   9893.650<br />Generation_GWh:  43148.86580","Source: Renewables<br />Capacity_MW:  10398.210<br />Generation_GWh:  36800.35900","Source: Renewables<br />Capacity_MW:  11120.480<br />Generation_GWh:  40411.73420","Source: Renewables<br />Capacity_MW:  11429.380<br />Generation_GWh:  40571.65550","Source: Renewables<br />Capacity_MW:  12281.780<br />Generation_GWh:  46010.73750","Source: Renewables<br />Capacity_MW:  14563.400<br />Generation_GWh:  50777.67780","Source: Renewables<br />Capacity_MW:  15835.000<br />Generation_GWh:  54399.58370","Source: Renewables<br />Capacity_MW:  36958.637<br />Generation_GWh: 174418.23500","Source: Renewables<br />Capacity_MW:  37280.709<br />Generation_GWh: 173656.11700","Source: Renewables<br />Capacity_MW:  38134.777<br />Generation_GWh: 182362.75700","Source: Renewables<br />Capacity_MW:  39021.425<br />Generation_GWh: 188895.24500","Source: Renewables<br />Capacity_MW:  39303.710<br />Generation_GWh: 191294.84200","Source: Renewables<br />Capacity_MW:  39320.120<br />Generation_GWh: 179801.35900","Source: Renewables<br />Capacity_MW:  39346.393<br />Generation_GWh: 192180.86700","Source: Renewables<br />Capacity_MW:  40810.440<br />Generation_GWh: 195766.73000","Source: Renewables<br />Capacity_MW:  41076.993<br />Generation_GWh: 208865.14400","Source: Renewables<br />Capacity_MW:  43139.297<br />Generation_GWh: 205581.36700","Source: Renewables<br />Capacity_MW:  43719.210<br />Generation_GWh: 208658.96900","Source: Renewables<br />Capacity_MW:   1076.250<br />Generation_GWh:   4528.33200","Source: Renewables<br />Capacity_MW:   1076.250<br />Generation_GWh:   4383.62500","Source: Renewables<br />Capacity_MW:   1076.250<br />Generation_GWh:   3455.98100","Source: Renewables<br />Capacity_MW:   1172.250<br />Generation_GWh:   4215.11300","Source: Renewables<br />Capacity_MW:   1271.250<br />Generation_GWh:   3905.76000","Source: Renewables<br />Capacity_MW:   1271.250<br />Generation_GWh:   4291.47700","Source: Renewables<br />Capacity_MW:   1378.100<br />Generation_GWh:   5099.26100","Source: Renewables<br />Capacity_MW:   1378.100<br />Generation_GWh:   4164.23300","Source: Renewables<br />Capacity_MW:   1378.100<br />Generation_GWh:   4687.58300","Source: Renewables<br />Capacity_MW:   1378.300<br />Generation_GWh:   4354.96400","Source: Renewables<br />Capacity_MW:   1378.300<br />Generation_GWh:   4070.39984","Source: Renewables<br />Capacity_MW:    507.070<br />Generation_GWh:   1478.61450","Source: Renewables<br />Capacity_MW:    506.970<br />Generation_GWh:   1446.75650","Source: Renewables<br />Capacity_MW:    512.170<br />Generation_GWh:   1396.85150","Source: Renewables<br />Capacity_MW:    513.070<br />Generation_GWh:   1565.80750","Source: Renewables<br />Capacity_MW:    513.070<br />Generation_GWh:   1471.49610","Source: Renewables<br />Capacity_MW:    562.070<br />Generation_GWh:   1771.82510","Source: Renewables<br />Capacity_MW:    658.300<br />Generation_GWh:   2256.22230","Source: Renewables<br />Capacity_MW:    761.900<br />Generation_GWh:   2036.92500","Source: Renewables<br />Capacity_MW:    767.870<br />Generation_GWh:   2100.26310","Source: Renewables<br />Capacity_MW:    816.910<br />Generation_GWh:   2525.41960","Source: Renewables<br />Capacity_MW:    932.710<br />Generation_GWh:   2659.20875","Source: Renewables<br />Capacity_MW:     14.000<br />Generation_GWh:     40.10400","Source: Renewables<br />Capacity_MW:     14.000<br />Generation_GWh:     36.24900","Source: Renewables<br />Capacity_MW:     73.000<br />Generation_GWh:     39.63300","Source: Renewables<br />Capacity_MW:     73.000<br />Generation_GWh:    147.12400","Source: Renewables<br />Capacity_MW:    152.000<br />Generation_GWh:    352.14400","Source: Renewables<br />Capacity_MW:    164.000<br />Generation_GWh:    462.70200","Source: Renewables<br />Capacity_MW:    164.000<br />Generation_GWh:    492.79400","Source: Renewables<br />Capacity_MW:    164.000<br />Generation_GWh:    472.61900","Source: Renewables<br />Capacity_MW:    174.000<br />Generation_GWh:    503.92000","Source: Renewables<br />Capacity_MW:    204.400<br />Generation_GWh:    601.33477","Source: Renewables<br />Capacity_MW:    204.400<br />Generation_GWh:    591.19313","Source: Renewables<br />Capacity_MW:   6780.060<br />Generation_GWh:  40498.23800","Source: Renewables<br />Capacity_MW:   6775.450<br />Generation_GWh:  41709.86600","Source: Renewables<br />Capacity_MW:   6776.800<br />Generation_GWh:  40048.49100","Source: Renewables<br />Capacity_MW:   6776.800<br />Generation_GWh:  41790.38800","Source: Renewables<br />Capacity_MW:   6835.050<br />Generation_GWh:  36830.54000","Source: Renewables<br />Capacity_MW:   6835.050<br />Generation_GWh:  40462.08500","Source: Renewables<br />Capacity_MW:   6842.700<br />Generation_GWh:  40214.85900","Source: Renewables<br />Capacity_MW:   6837.060<br />Generation_GWh:  42381.50500","Source: Renewables<br />Capacity_MW:   6842.700<br />Generation_GWh:  41616.31800","Source: Renewables<br />Capacity_MW:   6820.455<br />Generation_GWh:  39224.78900","Source: Renewables<br />Capacity_MW:   6820.455<br />Generation_GWh:  40520.74296","Source: Renewables<br />Capacity_MW:     65.000<br />Generation_GWh:    259.10700","Source: Renewables<br />Capacity_MW:     41.700<br />Generation_GWh:    251.86600","Source: Renewables<br />Capacity_MW:     43.000<br />Generation_GWh:    250.24600","Source: Renewables<br />Capacity_MW:     55.700<br />Generation_GWh:    246.57500","Source: Renewables<br />Capacity_MW:     55.700<br />Generation_GWh:    253.95200","Source: Renewables<br />Capacity_MW:     55.700<br />Generation_GWh:    253.95200","Source: Renewables<br />Capacity_MW:     55.700<br />Generation_GWh:    260.34500","Source: Renewables<br />Capacity_MW:     64.900<br />Generation_GWh:    252.69900","Source: Renewables<br />Capacity_MW:     64.900<br />Generation_GWh:    278.53500","Source: Renewables<br />Capacity_MW:     65.200<br />Generation_GWh:    253.77000","Source: Renewables<br />Capacity_MW:     65.200<br />Generation_GWh:    273.59178","Source: Renewables<br />Capacity_MW:     76.700<br />Generation_GWh:    320.44300","Source: Renewables<br />Capacity_MW:     77.500<br />Generation_GWh:    334.60800","Source: Renewables<br />Capacity_MW:     78.700<br />Generation_GWh:    330.63200","Source: Renewables<br />Capacity_MW:     78.700<br />Generation_GWh:    348.29300","Source: Renewables<br />Capacity_MW:     78.700<br />Generation_GWh:    379.05600","Source: Renewables<br />Capacity_MW:     78.700<br />Generation_GWh:    380.43100","Source: Renewables<br />Capacity_MW:     95.300<br />Generation_GWh:    388.06600","Source: Renewables<br />Capacity_MW:     95.300<br />Generation_GWh:    430.19400","Source: Renewables<br />Capacity_MW:     95.300<br />Generation_GWh:    424.99000","Source: Renewables<br />Capacity_MW:     95.333<br />Generation_GWh:    410.66800","Source: Renewables<br />Capacity_MW:     95.333<br />Generation_GWh:    421.88400","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.035<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:      0.035<br />Generation_GWh:      0.00000","Source: Renewables<br />Capacity_MW:  75221.927<br />Generation_GWh: 367848.70470","Source: Renewables<br />Capacity_MW:  75979.326<br />Generation_GWh: 360105.26800","Source: Renewables<br />Capacity_MW:  77169.935<br />Generation_GWh: 375778.07310","Source: Renewables<br />Capacity_MW:  78514.283<br />Generation_GWh: 387513.59510","Source: Renewables<br />Capacity_MW:  79850.968<br />Generation_GWh: 378864.67590","Source: Renewables<br />Capacity_MW:  80973.461<br />Generation_GWh: 365488.89610","Source: Renewables<br />Capacity_MW:  82894.042<br />Generation_GWh: 393647.58880","Source: Renewables<br />Capacity_MW:  85083.749<br />Generation_GWh: 401019.84310","Source: Renewables<br />Capacity_MW:  86619.651<br />Generation_GWh: 417369.29210","Source: Renewables<br />Capacity_MW:  92024.592<br />Generation_GWh: 414576.31970","Source: Renewables<br />Capacity_MW:  94882.173<br />Generation_GWh: 421542.81700"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(139,147,255,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(139,147,255,1)"}},"hoveron":"points","name":"Renewables","legendgroup":"Renewables","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,0,0,0,0,0,0,0,0,2.8,2.8,0,0,0,0,0,0,0,0,0,6.4,6.4,0,0,0,0,0,0,0,0,0,3.5,3.5,0,0,0,0,0,0,0,0,0,0.4,0.4,16.75,20.48,25.77,32.72,94.57,281.13,419.4,645.3,1018.7,1509.4,2119,0,0,0,0,0,0,0,0,0,0.4,0.4,0,0,0,0,0,0,0,0,0,0.2,0.2,0,0,0,0,0,0,0,0,0,0.6,0.6,0,0,0,0,0,0,0,0,0,0.4,0.4,0,0,0,0,0,0,0,0,0,0.035,0.035,0,0,0,0,0,0,0,0,0,0.3,0.3,0,0,0,0,0,0,0,0,0,0.033,0.033,0,0,0,0,0,0,0,0,0,0.035,0.035,16.75,20.48,25.77,32.72,94.57,281.13,419.4,645.3,1018.7,1524.503,2134.103],"y":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,123,398,842,1173,1816,3001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,123,398,842,1173,1816,3001],"text":["Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      2.800<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      2.800<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      6.400<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      6.400<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      3.500<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      3.500<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.400<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.400<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     16.750<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     20.480<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     25.770<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     32.720<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     94.570<br />Generation_GWh:      5.00000","Source: Solar<br />Capacity_MW:    281.130<br />Generation_GWh:    123.00000","Source: Solar<br />Capacity_MW:    419.400<br />Generation_GWh:    398.00000","Source: Solar<br />Capacity_MW:    645.300<br />Generation_GWh:    842.00000","Source: Solar<br />Capacity_MW:   1018.700<br />Generation_GWh:   1173.00000","Source: Solar<br />Capacity_MW:   1509.400<br />Generation_GWh:   1816.00000","Source: Solar<br />Capacity_MW:   2119.000<br />Generation_GWh:   3001.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.400<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.400<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.200<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.200<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.600<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.600<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.400<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.400<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.035<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.035<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.300<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.300<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.033<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.033<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.035<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:      0.035<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     16.750<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     20.480<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     25.770<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     32.720<br />Generation_GWh:      0.00000","Source: Solar<br />Capacity_MW:     94.570<br />Generation_GWh:      5.00000","Source: Solar<br />Capacity_MW:    281.130<br />Generation_GWh:    123.00000","Source: Solar<br />Capacity_MW:    419.400<br />Generation_GWh:    398.00000","Source: Solar<br />Capacity_MW:    645.300<br />Generation_GWh:    842.00000","Source: Solar<br />Capacity_MW:   1018.700<br />Generation_GWh:   1173.00000","Source: Solar<br />Capacity_MW:   1524.503<br />Generation_GWh:   1816.00000","Source: Solar<br />Capacity_MW:   2134.103<br />Generation_GWh:   3001.00000"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(213,117,254,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(213,117,254,1)"}},"hoveron":"points","name":"Solar","legendgroup":"Solar","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[2182.88,2287.88,2287.88,2287.88,2287.88,2320.38,2367.85,2321.65,2393.05,2393.05,2393.05,10887.95,10508.35,10663.35,11061.95,11440.25,11300.15,11249.10133,11794.02932,12493.296,12864.08,13915.95,2873,2854.62,2854.62,2879.45,2972.45,3224.95,3224.95,3220,3089,3148.6,3363.15,520.12,519.74,519.74,519.74,519.74,519.74,519.74,519.74,519.74,497.74,499.86,23039,23527.685,23535.85,24685.3,24410.87,25934.17,25734.305,25148.305,25831.305,23642.75,24083.75,2579.21,3088.21,3209.21,3128.71,3128.71,2997.71,2512.69,830.69,1837.69,1368.69,1089.01,3282.3,3282.3,3282.3,3282.3,3280.3,3229.3,3229.3,3229.3,3254.3,3254.3,3254.3,2008.92,2006.42,2006.42,2006.42,2006.12,2006.42,2058.42,2058.42,2058.43,2104.87,2104.87,160,160,160,160,160,161,161,161,163,163,160,862,862,862,862,892,892,889,889,863,971,971,149,109.923,107.18,111.598,160.718,126.998,126.94,126.94,130.76,104.96,121.27,33.34,33.34,33.34,33.34,33.34,33.57,33.57,33.57,33.57,33.57,28.97,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,54.28,48632,49294.748,49576.17,51072.968,51346.658,52800.668,52161.14633,50386.92432,52721.421,50600.89,52039.46],"y":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"text":["Source: Thermal<br />Capacity_MW:   2182.880<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2287.880<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2287.880<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2287.880<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2287.880<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2320.380<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2367.850<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2321.650<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2393.050<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2393.050<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2393.050<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  10887.950<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  10508.350<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  10663.350<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  11061.950<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  11440.250<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  11300.150<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  11249.101<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  11794.029<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  12493.296<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  12864.080<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  13915.950<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2873.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2854.620<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2854.620<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2879.450<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2972.450<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3224.950<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3224.950<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3220.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3089.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3148.600<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3363.150<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    520.120<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    519.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    519.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    519.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    519.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    519.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    519.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    519.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    519.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    497.740<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    499.860<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  23039.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  23527.685<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  23535.850<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  24685.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  24410.870<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  25934.170<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  25734.305<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  25148.305<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  25831.305<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  23642.750<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  24083.750<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2579.210<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3088.210<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3209.210<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3128.710<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3128.710<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2997.710<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2512.690<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    830.690<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   1837.690<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   1368.690<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   1089.010<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3282.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3282.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3282.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3282.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3280.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3229.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3229.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3229.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3254.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3254.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   3254.300<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2008.920<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2006.420<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2006.420<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2006.420<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2006.120<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2006.420<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2058.420<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2058.420<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2058.430<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2104.870<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:   2104.870<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    161.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    161.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    161.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    163.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    163.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    160.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    862.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    862.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    862.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    862.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    892.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    892.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    889.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    889.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    863.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    971.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    971.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    149.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    109.923<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    107.180<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    111.598<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    160.718<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    126.998<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    126.940<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    126.940<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    130.760<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    104.960<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:    121.270<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.340<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     33.570<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     28.970<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:     54.280<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  48632.000<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  49294.748<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  49576.170<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  51072.968<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  51346.658<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  52800.668<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  52161.146<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  50386.924<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  52721.421<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  50600.890<br />Generation_GWh:           NA","Source: Thermal<br />Capacity_MW:  52039.460<br />Generation_GWh:           NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(249,98,221,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(249,98,221,1)"}},"hoveron":"points","name":"Thermal","legendgroup":"Thermal","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,0,0,0,102,102,246,246,388,488,488,251,386.2,525.2,525.2,591.2,723.2,865,1088,1088,1434,1463,15.8,171.18,171.18,171.18,171.18,171.18,196.68,196.68,196.68,196.68,221,20,103.95,103.95,103.95,103.95,103.95,241.95,258.45,258.45,258.45,258.45,14.7,414,491,782,1168,1447,1970,2053,2491,3490,4374,207,317,417,527,660,664,923,1354,2404,2865,3262,0,0,0,96,195,195,294,294,294,294,294,34.7,37.1,42.3,43.2,43.2,122.2,216.6,320.2,326.17,328.17,443.97,13,13,72,72,151,163,163,163,173,203,203,0,0,0,0,54,54,54,54,54,54,54,0,0,0,0,0,0,0,9.2,9.2,9.2,9.2,0,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0,0,0,0,0,0,0,0,0,0,0,556.2,1443.23,1823.43,2321.33,3240.33,3746.33,5171.03,6037.33,7683.3,9621.3,11071.42],"y":[0,0,0,0,0,0,484.9,508,859.8,1071.2,1206.3,741,921.366,1430.267,1472.902,1557.9,1628.621,2372,2601,3058,3519,4089,91.916,573,620,574.391,578.582,506.587,682,655.336,646,636,684,53.42,325.115,325.115,411.852,364.512,343.196,746.902,876.747,867.806,911.319,860.32836,25.658,145.179,493.718,1400,2300,2800,3900,4600,5200,6800,10200,416,419,617,565,1322,1547,1400,2562,4721,6650,8938,0,0,0,0,270.134,389.127,692.973,732.953,737.271,785.85,736.57584,85.445,109.535,156.987,148.609,154.009,386.67,782.497,800.289,765.412,748.678,1015.075249,40.104,36.249,39.633,141.666,347.328,457.625,487.675,467.621,499.029,594.768,586.8324,0,0,0,0,102.365,183.379,197.964,195.044,191.904,176.963,188.74296,0,0,0,0,0,0,0,0,15.852,19.854,20.843,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1453.543,2529.444,3682.72,4714.42,7030.83,8364.905,11746.911,13998.99,17562.074,21913.632,28525.69781],"text":["Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:    102.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:    102.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:    246.000<br />Generation_GWh:    484.90000","Source: Wind<br />Capacity_MW:    246.000<br />Generation_GWh:    508.00000","Source: Wind<br />Capacity_MW:    388.000<br />Generation_GWh:    859.80000","Source: Wind<br />Capacity_MW:    488.000<br />Generation_GWh:   1071.20000","Source: Wind<br />Capacity_MW:    488.000<br />Generation_GWh:   1206.30000","Source: Wind<br />Capacity_MW:    251.000<br />Generation_GWh:    741.00000","Source: Wind<br />Capacity_MW:    386.200<br />Generation_GWh:    921.36600","Source: Wind<br />Capacity_MW:    525.200<br />Generation_GWh:   1430.26700","Source: Wind<br />Capacity_MW:    525.200<br />Generation_GWh:   1472.90200","Source: Wind<br />Capacity_MW:    591.200<br />Generation_GWh:   1557.90000","Source: Wind<br />Capacity_MW:    723.200<br />Generation_GWh:   1628.62100","Source: Wind<br />Capacity_MW:    865.000<br />Generation_GWh:   2372.00000","Source: Wind<br />Capacity_MW:   1088.000<br />Generation_GWh:   2601.00000","Source: Wind<br />Capacity_MW:   1088.000<br />Generation_GWh:   3058.00000","Source: Wind<br />Capacity_MW:   1434.000<br />Generation_GWh:   3519.00000","Source: Wind<br />Capacity_MW:   1463.000<br />Generation_GWh:   4089.00000","Source: Wind<br />Capacity_MW:     15.800<br />Generation_GWh:     91.91600","Source: Wind<br />Capacity_MW:    171.180<br />Generation_GWh:    573.00000","Source: Wind<br />Capacity_MW:    171.180<br />Generation_GWh:    620.00000","Source: Wind<br />Capacity_MW:    171.180<br />Generation_GWh:    574.39100","Source: Wind<br />Capacity_MW:    171.180<br />Generation_GWh:    578.58200","Source: Wind<br />Capacity_MW:    171.180<br />Generation_GWh:    506.58700","Source: Wind<br />Capacity_MW:    196.680<br />Generation_GWh:    682.00000","Source: Wind<br />Capacity_MW:    196.680<br />Generation_GWh:    655.33600","Source: Wind<br />Capacity_MW:    196.680<br />Generation_GWh:    646.00000","Source: Wind<br />Capacity_MW:    196.680<br />Generation_GWh:    636.00000","Source: Wind<br />Capacity_MW:    221.000<br />Generation_GWh:    684.00000","Source: Wind<br />Capacity_MW:     20.000<br />Generation_GWh:     53.42000","Source: Wind<br />Capacity_MW:    103.950<br />Generation_GWh:    325.11500","Source: Wind<br />Capacity_MW:    103.950<br />Generation_GWh:    325.11500","Source: Wind<br />Capacity_MW:    103.950<br />Generation_GWh:    411.85200","Source: Wind<br />Capacity_MW:    103.950<br />Generation_GWh:    364.51200","Source: Wind<br />Capacity_MW:    103.950<br />Generation_GWh:    343.19600","Source: Wind<br />Capacity_MW:    241.950<br />Generation_GWh:    746.90200","Source: Wind<br />Capacity_MW:    258.450<br />Generation_GWh:    876.74700","Source: Wind<br />Capacity_MW:    258.450<br />Generation_GWh:    867.80600","Source: Wind<br />Capacity_MW:    258.450<br />Generation_GWh:    911.31900","Source: Wind<br />Capacity_MW:    258.450<br />Generation_GWh:    860.32836","Source: Wind<br />Capacity_MW:     14.700<br />Generation_GWh:     25.65800","Source: Wind<br />Capacity_MW:    414.000<br />Generation_GWh:    145.17900","Source: Wind<br />Capacity_MW:    491.000<br />Generation_GWh:    493.71800","Source: Wind<br />Capacity_MW:    782.000<br />Generation_GWh:   1400.00000","Source: Wind<br />Capacity_MW:   1168.000<br />Generation_GWh:   2300.00000","Source: Wind<br />Capacity_MW:   1447.000<br />Generation_GWh:   2800.00000","Source: Wind<br />Capacity_MW:   1970.000<br />Generation_GWh:   3900.00000","Source: Wind<br />Capacity_MW:   2053.000<br />Generation_GWh:   4600.00000","Source: Wind<br />Capacity_MW:   2491.000<br />Generation_GWh:   5200.00000","Source: Wind<br />Capacity_MW:   3490.000<br />Generation_GWh:   6800.00000","Source: Wind<br />Capacity_MW:   4374.000<br />Generation_GWh:  10200.00000","Source: Wind<br />Capacity_MW:    207.000<br />Generation_GWh:    416.00000","Source: Wind<br />Capacity_MW:    317.000<br />Generation_GWh:    419.00000","Source: Wind<br />Capacity_MW:    417.000<br />Generation_GWh:    617.00000","Source: Wind<br />Capacity_MW:    527.000<br />Generation_GWh:    565.00000","Source: Wind<br />Capacity_MW:    660.000<br />Generation_GWh:   1322.00000","Source: Wind<br />Capacity_MW:    664.000<br />Generation_GWh:   1547.00000","Source: Wind<br />Capacity_MW:    923.000<br />Generation_GWh:   1400.00000","Source: Wind<br />Capacity_MW:   1354.000<br />Generation_GWh:   2562.00000","Source: Wind<br />Capacity_MW:   2404.000<br />Generation_GWh:   4721.00000","Source: Wind<br />Capacity_MW:   2865.000<br />Generation_GWh:   6650.00000","Source: Wind<br />Capacity_MW:   3262.000<br />Generation_GWh:   8938.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:     96.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:    195.000<br />Generation_GWh:    270.13400","Source: Wind<br />Capacity_MW:    195.000<br />Generation_GWh:    389.12700","Source: Wind<br />Capacity_MW:    294.000<br />Generation_GWh:    692.97300","Source: Wind<br />Capacity_MW:    294.000<br />Generation_GWh:    732.95300","Source: Wind<br />Capacity_MW:    294.000<br />Generation_GWh:    737.27100","Source: Wind<br />Capacity_MW:    294.000<br />Generation_GWh:    785.85000","Source: Wind<br />Capacity_MW:    294.000<br />Generation_GWh:    736.57584","Source: Wind<br />Capacity_MW:     34.700<br />Generation_GWh:     85.44500","Source: Wind<br />Capacity_MW:     37.100<br />Generation_GWh:    109.53500","Source: Wind<br />Capacity_MW:     42.300<br />Generation_GWh:    156.98700","Source: Wind<br />Capacity_MW:     43.200<br />Generation_GWh:    148.60900","Source: Wind<br />Capacity_MW:     43.200<br />Generation_GWh:    154.00900","Source: Wind<br />Capacity_MW:    122.200<br />Generation_GWh:    386.67000","Source: Wind<br />Capacity_MW:    216.600<br />Generation_GWh:    782.49700","Source: Wind<br />Capacity_MW:    320.200<br />Generation_GWh:    800.28900","Source: Wind<br />Capacity_MW:    326.170<br />Generation_GWh:    765.41200","Source: Wind<br />Capacity_MW:    328.170<br />Generation_GWh:    748.67800","Source: Wind<br />Capacity_MW:    443.970<br />Generation_GWh:   1015.07525","Source: Wind<br />Capacity_MW:     13.000<br />Generation_GWh:     40.10400","Source: Wind<br />Capacity_MW:     13.000<br />Generation_GWh:     36.24900","Source: Wind<br />Capacity_MW:     72.000<br />Generation_GWh:     39.63300","Source: Wind<br />Capacity_MW:     72.000<br />Generation_GWh:    141.66600","Source: Wind<br />Capacity_MW:    151.000<br />Generation_GWh:    347.32800","Source: Wind<br />Capacity_MW:    163.000<br />Generation_GWh:    457.62500","Source: Wind<br />Capacity_MW:    163.000<br />Generation_GWh:    487.67500","Source: Wind<br />Capacity_MW:    163.000<br />Generation_GWh:    467.62100","Source: Wind<br />Capacity_MW:    173.000<br />Generation_GWh:    499.02900","Source: Wind<br />Capacity_MW:    203.000<br />Generation_GWh:    594.76800","Source: Wind<br />Capacity_MW:    203.000<br />Generation_GWh:    586.83240","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:     54.000<br />Generation_GWh:    102.36500","Source: Wind<br />Capacity_MW:     54.000<br />Generation_GWh:    183.37900","Source: Wind<br />Capacity_MW:     54.000<br />Generation_GWh:    197.96400","Source: Wind<br />Capacity_MW:     54.000<br />Generation_GWh:    195.04400","Source: Wind<br />Capacity_MW:     54.000<br />Generation_GWh:    191.90400","Source: Wind<br />Capacity_MW:     54.000<br />Generation_GWh:    176.96300","Source: Wind<br />Capacity_MW:     54.000<br />Generation_GWh:    188.74296","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      9.200<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      9.200<br />Generation_GWh:     15.85200","Source: Wind<br />Capacity_MW:      9.200<br />Generation_GWh:     19.85400","Source: Wind<br />Capacity_MW:      9.200<br />Generation_GWh:     20.84300","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.800<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:      0.000<br />Generation_GWh:      0.00000","Source: Wind<br />Capacity_MW:    556.200<br />Generation_GWh:   1453.54300","Source: Wind<br />Capacity_MW:   1443.230<br />Generation_GWh:   2529.44400","Source: Wind<br />Capacity_MW:   1823.430<br />Generation_GWh:   3682.72000","Source: Wind<br />Capacity_MW:   2321.330<br />Generation_GWh:   4714.42000","Source: Wind<br />Capacity_MW:   3240.330<br />Generation_GWh:   7030.83000","Source: Wind<br />Capacity_MW:   3746.330<br />Generation_GWh:   8364.90500","Source: Wind<br />Capacity_MW:   5171.030<br />Generation_GWh:  11746.91100","Source: Wind<br />Capacity_MW:   6037.330<br />Generation_GWh:  13998.99000","Source: Wind<br />Capacity_MW:   7683.300<br />Generation_GWh:  17562.07400","Source: Wind<br />Capacity_MW:   9621.300<br />Generation_GWh:  21913.63200","Source: Wind<br />Capacity_MW:  11071.420<br />Generation_GWh:  28525.69781"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(255,101,172,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(255,101,172,1)"}},"hoveron":"points","name":"Wind","legendgroup":"Wind","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":28.1765601217656,"r":7.30593607305936,"b":42.130898021309,"l":54.7945205479452},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"type":"linear","autorange":false,"range":[-7226.23715,151750.98015],"tickmode":"array","ticktext":["0","50000","100000","150000"],"tickvals":[0,50000,100000,150000],"categoryorder":"array","categoryarray":["0","50000","100000","150000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":"Capacity_MW","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"type":"linear","autorange":false,"range":[-32384.237005,680068.977105],"tickmode":"array","ticktext":["0e+00","2e+05","4e+05","6e+05"],"tickvals":[0,200000,400000,600000],"categoryorder":"array","categoryarray":["0e+00","2e+05","4e+05","6e+05"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"Generation_GWh","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"y":0.903762029746282},"annotations":[{"text":"Source","x":1.02,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"left","yanchor":"bottom","legendTitle":true}],"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":[{"name":"Collaborate","icon":{"width":1000,"ascent":500,"descent":-50,"path":"M487 375c7-10 9-23 5-36l-79-259c-3-12-11-23-22-31-11-8-22-12-35-12l-263 0c-15 0-29 5-43 15-13 10-23 23-28 37-5 13-5 25-1 37 0 0 0 3 1 7 1 5 1 8 1 11 0 2 0 4-1 6 0 3-1 5-1 6 1 2 2 4 3 6 1 2 2 4 4 6 2 3 4 5 5 7 5 7 9 16 13 26 4 10 7 19 9 26 0 2 0 5 0 9-1 4-1 6 0 8 0 2 2 5 4 8 3 3 5 5 5 7 4 6 8 15 12 26 4 11 7 19 7 26 1 1 0 4 0 9-1 4-1 7 0 8 1 2 3 5 6 8 4 4 6 6 6 7 4 5 8 13 13 24 4 11 7 20 7 28 1 1 0 4 0 7-1 3-1 6-1 7 0 2 1 4 3 6 1 1 3 4 5 6 2 3 3 5 5 6 1 2 3 5 4 9 2 3 3 7 5 10 1 3 2 6 4 10 2 4 4 7 6 9 2 3 4 5 7 7 3 2 7 3 11 3 3 0 8 0 13-1l0-1c7 2 12 2 14 2l218 0c14 0 25-5 32-16 8-10 10-23 6-37l-79-259c-7-22-13-37-20-43-7-7-19-10-37-10l-248 0c-5 0-9-2-11-5-2-3-2-7 0-12 4-13 18-20 41-20l264 0c5 0 10 2 16 5 5 3 8 6 10 11l85 282c2 5 2 10 2 17 7-3 13-7 17-13z m-304 0c-1-3-1-5 0-7 1-1 3-2 6-2l174 0c2 0 4 1 7 2 2 2 4 4 5 7l6 18c0 3 0 5-1 7-1 1-3 2-6 2l-173 0c-3 0-5-1-8-2-2-2-4-4-4-7z m-24-73c-1-3-1-5 0-7 2-2 3-2 6-2l174 0c2 0 5 0 7 2 3 2 4 4 5 7l6 18c1 2 0 5-1 6-1 2-3 3-5 3l-174 0c-3 0-5-1-7-3-3-1-4-4-5-6z"},"click":"function(gd) { \n        // is this being viewed in RStudio?\n        if (location.search == '?viewer_pane=1') {\n          alert('To learn about plotly for collaboration, visit:\\n https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html');\n        } else {\n          window.open('https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html', '_blank');\n        }\n      }"}],"cloud":false},"source":"A","attrs":{"54e74b44ead7":{"colour":{},"x":{},"y":{},"type":"scatter"}},"cur_data":"54e74b44ead7","visdat":{"54e74b44ead7":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1}},"base_url":"https://plot.ly"},"evals":["config.modeBarButtonsToAdd.0.click"],"jsHooks":{"render":[{"code":"function(el, x) { var ctConfig = crosstalk.var('plotlyCrosstalkOpts').set({\"on\":\"plotly_click\",\"persistent\":false,\"dynamic\":false,\"selectize\":false,\"opacityDim\":0.2,\"selected\":{\"opacity\":1}}); }","data":null}]}}</script><!--/html_preserve-->

## Generation vs. Year

```r
ggplotly(ggplot(RE_Full %>% filter(Region == "BC"), aes(Year, Generation_GWh)) +
  geom_point() +
  facet_grid(Source ~ .))
```

<!--html_preserve--><div id="54e71a0e8d47" style="width:720px;height:432px;" class="plotly html-widget"></div>
<script type="application/json" data-for="54e71a0e8d47">{"x":{"data":[{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[67773.67,61597.581,71829.977,66072.066,65056.651,64223.737,69257.261,73584.442,67851.1,67007.862,66564.661],"text":["Year: 2005<br />Generation_GWh: 67773.670","Year: 2006<br />Generation_GWh: 61597.581","Year: 2007<br />Generation_GWh: 71829.977","Year: 2008<br />Generation_GWh: 66072.066","Year: 2009<br />Generation_GWh: 65056.651","Year: 2010<br />Generation_GWh: 64223.737","Year: 2011<br />Generation_GWh: 69257.261","Year: 2012<br />Generation_GWh: 73584.442","Year: 2013<br />Generation_GWh: 67851.100","Year: 2014<br />Generation_GWh: 67007.862","Year: 2015<br />Generation_GWh: 66564.661"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[3254,3254,3254,2739,2163,3848,4165,4289,4121,3964,3711],"text":["Year: 2005<br />Generation_GWh:  3254.000","Year: 2006<br />Generation_GWh:  3254.000","Year: 2007<br />Generation_GWh:  3254.000","Year: 2008<br />Generation_GWh:  2739.000","Year: 2009<br />Generation_GWh:  2163.000","Year: 2010<br />Generation_GWh:  3848.000","Year: 2011<br />Generation_GWh:  4165.000","Year: 2012<br />Generation_GWh:  4289.000","Year: 2013<br />Generation_GWh:  4121.000","Year: 2014<br />Generation_GWh:  3964.000","Year: 2015<br />Generation_GWh:  3711.000"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[60327.016,54247.228,64287.014,58699.09,56462.248,54151.855,61037.382,65140.911,59223.454,57572.873,57374.361],"text":["Year: 2005<br />Generation_GWh: 60327.016","Year: 2006<br />Generation_GWh: 54247.228","Year: 2007<br />Generation_GWh: 64287.014","Year: 2008<br />Generation_GWh: 58699.090","Year: 2009<br />Generation_GWh: 56462.248","Year: 2010<br />Generation_GWh: 54151.855","Year: 2011<br />Generation_GWh: 61037.382","Year: 2012<br />Generation_GWh: 65140.911","Year: 2013<br />Generation_GWh: 59223.454","Year: 2014<br />Generation_GWh: 57572.873","Year: 2015<br />Generation_GWh: 57374.361"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y4","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y5","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[3254,3254,3254,2739,2197,3970.7,4649.9,4797,4980.8,5035.2,4917.3],"text":["Year: 2005<br />Generation_GWh:  3254.000","Year: 2006<br />Generation_GWh:  3254.000","Year: 2007<br />Generation_GWh:  3254.000","Year: 2008<br />Generation_GWh:  2739.000","Year: 2009<br />Generation_GWh:  2197.000","Year: 2010<br />Generation_GWh:  3970.700","Year: 2011<br />Generation_GWh:  4649.900","Year: 2012<br />Generation_GWh:  4797.000","Year: 2013<br />Generation_GWh:  4980.800","Year: 2014<br />Generation_GWh:  5035.200","Year: 2015<br />Generation_GWh:  4917.300"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y6","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y7","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y8","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[4192.654,4096.353,4288.963,4633.976,6397.403,6101.182,3569.979,3646.531,3646.846,4399.789,4273],"text":["Year: 2005<br />Generation_GWh:  4192.654","Year: 2006<br />Generation_GWh:  4096.353","Year: 2007<br />Generation_GWh:  4288.963","Year: 2008<br />Generation_GWh:  4633.976","Year: 2009<br />Generation_GWh:  6397.403","Year: 2010<br />Generation_GWh:  6101.182","Year: 2011<br />Generation_GWh:  3569.979","Year: 2012<br />Generation_GWh:  3646.531","Year: 2013<br />Generation_GWh:  3646.846","Year: 2014<br />Generation_GWh:  4399.789","Year: 2015<br />Generation_GWh:  4273.000"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y9","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[63581.016,57501.228,67541.014,61438.09,58659.248,58122.555,65687.282,69937.911,64204.254,62608.073,62291.661],"text":["Year: 2005<br />Generation_GWh: 63581.016","Year: 2006<br />Generation_GWh: 57501.228","Year: 2007<br />Generation_GWh: 67541.014","Year: 2008<br />Generation_GWh: 61438.090","Year: 2009<br />Generation_GWh: 58659.248","Year: 2010<br />Generation_GWh: 58122.555","Year: 2011<br />Generation_GWh: 65687.282","Year: 2012<br />Generation_GWh: 69937.911","Year: 2013<br />Generation_GWh: 64204.254","Year: 2014<br />Generation_GWh: 62608.073","Year: 2015<br />Generation_GWh: 62291.661"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y10","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[0,0,0,0,0,0,0,0,0,0,0],"text":["Year: 2005<br />Generation_GWh:     0.000","Year: 2006<br />Generation_GWh:     0.000","Year: 2007<br />Generation_GWh:     0.000","Year: 2008<br />Generation_GWh:     0.000","Year: 2009<br />Generation_GWh:     0.000","Year: 2010<br />Generation_GWh:     0.000","Year: 2011<br />Generation_GWh:     0.000","Year: 2012<br />Generation_GWh:     0.000","Year: 2013<br />Generation_GWh:     0.000","Year: 2014<br />Generation_GWh:     0.000","Year: 2015<br />Generation_GWh:     0.000"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y11","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y12","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[0,0,0,0,0,0,484.9,508,859.8,1071.2,1206.3],"text":["Year: 2005<br />Generation_GWh:     0.000","Year: 2006<br />Generation_GWh:     0.000","Year: 2007<br />Generation_GWh:     0.000","Year: 2008<br />Generation_GWh:     0.000","Year: 2009<br />Generation_GWh:     0.000","Year: 2010<br />Generation_GWh:     0.000","Year: 2011<br />Generation_GWh:   484.900","Year: 2012<br />Generation_GWh:   508.000","Year: 2013<br />Generation_GWh:   859.800","Year: 2014<br />Generation_GWh:  1071.200","Year: 2015<br />Generation_GWh:  1206.300"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y13","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":39.8660578386606,"r":18.9954337899543,"b":42.130898021309,"l":54.7945205479452},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"type":"linear","autorange":false,"range":[0.4,11.6],"tickmode":"array","ticktext":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"tickvals":[1,2,3,4,5,6,7,8,9,10,11],"categoryorder":"array","categoryarray":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y13","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"annotations":[{"text":"Year","x":0.5,"y":-0.0524268560798241,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"top","annotationType":"axis"},{"text":"Generation_GWh","x":-0.0558092338914257,"y":0.5,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-90,"xanchor":"right","yanchor":"center","annotationType":"axis"},{"text":"All sources","x":1,"y":0.969994406067465,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Biomass","x":1,"y":0.884615384615385,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Coal","x":1,"y":0.807692307692308,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Hydro","x":1,"y":0.730769230769231,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Natural Gas","x":1,"y":0.653846153846154,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Non-hydro renewables","x":1,"y":0.576923076923077,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Nuclear","x":1,"y":0.5,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Oil","x":1,"y":0.423076923076923,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Other sources","x":1,"y":0.346153846153846,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Renewables","x":1,"y":0.269230769230769,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Solar","x":1,"y":0.192307692307692,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Thermal","x":1,"y":0.115384615384615,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Wind","x":1,"y":0.0300055939325345,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"}],"yaxis":{"domain":[0.939988812134931,1],"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.939988812134931,"y1":1},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.939988812134931,"y1":1},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.863065735211854,"y1":0.906165034018915},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.863065735211854,"y1":0.906165034018915},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.786142658288777,"y1":0.829241957095838},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.786142658288777,"y1":0.829241957095838},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.7092195813657,"y1":0.752318880172761},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.7092195813657,"y1":0.752318880172761},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.632296504442623,"y1":0.675395803249685},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.632296504442623,"y1":0.675395803249685},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.555373427519546,"y1":0.598472726326608},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.555373427519546,"y1":0.598472726326608},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.478450350596469,"y1":0.521549649403531},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.478450350596469,"y1":0.521549649403531},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.401527273673392,"y1":0.444626572480454},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.401527273673392,"y1":0.444626572480454},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.324604196750315,"y1":0.367703495557377},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.324604196750315,"y1":0.367703495557377},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.247681119827239,"y1":0.2907804186343},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.247681119827239,"y1":0.2907804186343},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.170758042904162,"y1":0.213857341711223},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.170758042904162,"y1":0.213857341711223},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.0938349659810847,"y1":0.136934264788146},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0.0938349659810847,"y1":0.136934264788146},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":0.0600111878650691},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.04619422572178,"y0":0,"y1":0.0600111878650691}],"yaxis2":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.863065735211854,0.906165034018915],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis3":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.786142658288777,0.829241957095838],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis4":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.7092195813657,0.752318880172761],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis5":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.632296504442623,0.675395803249685],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis6":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.555373427519546,0.598472726326608],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis7":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.478450350596469,0.521549649403531],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis8":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.401527273673392,0.444626572480454],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis9":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.324604196750315,0.367703495557377],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis10":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.247681119827239,0.2907804186343],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis11":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.170758042904162,0.213857341711223],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis12":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.0938349659810847,0.136934264788146],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis13":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0,0.0600111878650691],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":[{"name":"Collaborate","icon":{"width":1000,"ascent":500,"descent":-50,"path":"M487 375c7-10 9-23 5-36l-79-259c-3-12-11-23-22-31-11-8-22-12-35-12l-263 0c-15 0-29 5-43 15-13 10-23 23-28 37-5 13-5 25-1 37 0 0 0 3 1 7 1 5 1 8 1 11 0 2 0 4-1 6 0 3-1 5-1 6 1 2 2 4 3 6 1 2 2 4 4 6 2 3 4 5 5 7 5 7 9 16 13 26 4 10 7 19 9 26 0 2 0 5 0 9-1 4-1 6 0 8 0 2 2 5 4 8 3 3 5 5 5 7 4 6 8 15 12 26 4 11 7 19 7 26 1 1 0 4 0 9-1 4-1 7 0 8 1 2 3 5 6 8 4 4 6 6 6 7 4 5 8 13 13 24 4 11 7 20 7 28 1 1 0 4 0 7-1 3-1 6-1 7 0 2 1 4 3 6 1 1 3 4 5 6 2 3 3 5 5 6 1 2 3 5 4 9 2 3 3 7 5 10 1 3 2 6 4 10 2 4 4 7 6 9 2 3 4 5 7 7 3 2 7 3 11 3 3 0 8 0 13-1l0-1c7 2 12 2 14 2l218 0c14 0 25-5 32-16 8-10 10-23 6-37l-79-259c-7-22-13-37-20-43-7-7-19-10-37-10l-248 0c-5 0-9-2-11-5-2-3-2-7 0-12 4-13 18-20 41-20l264 0c5 0 10 2 16 5 5 3 8 6 10 11l85 282c2 5 2 10 2 17 7-3 13-7 17-13z m-304 0c-1-3-1-5 0-7 1-1 3-2 6-2l174 0c2 0 4 1 7 2 2 2 4 4 5 7l6 18c0 3 0 5-1 7-1 1-3 2-6 2l-173 0c-3 0-5-1-8-2-2-2-4-4-4-7z m-24-73c-1-3-1-5 0-7 2-2 3-2 6-2l174 0c2 0 5 0 7 2 3 2 4 4 5 7l6 18c1 2 0 5-1 6-1 2-3 3-5 3l-174 0c-3 0-5-1-7-3-3-1-4-4-5-6z"},"click":"function(gd) { \n        // is this being viewed in RStudio?\n        if (location.search == '?viewer_pane=1') {\n          alert('To learn about plotly for collaboration, visit:\\n https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html');\n        } else {\n          window.open('https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html', '_blank');\n        }\n      }"}],"cloud":false},"source":"A","attrs":{"54e76026e71a":{"x":{},"y":{},"type":"scatter"}},"cur_data":"54e76026e71a","visdat":{"54e76026e71a":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1}},"base_url":"https://plot.ly"},"evals":["config.modeBarButtonsToAdd.0.click"],"jsHooks":{"render":[{"code":"function(el, x) { var ctConfig = crosstalk.var('plotlyCrosstalkOpts').set({\"on\":\"plotly_click\",\"persistent\":false,\"dynamic\":false,\"selectize\":false,\"opacityDim\":0.2,\"selected\":{\"opacity\":1}}); }","data":null}]}}</script><!--/html_preserve-->

## Generation vs. Year in facets

```r
# Generation_GWh<=10000
Data <- filter(RE_Full, Region == "BC") 

ggplotly(ggplot(Data, mapping = aes(x = Year, y = Generation_GWh))+
  geom_point() +
  facet_wrap(~Source, ncol = 5) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)))
```

<!--html_preserve--><div id="54e77c41662c" style="width:720px;height:432px;" class="plotly html-widget"></div>
<script type="application/json" data-for="54e77c41662c">{"x":{"data":[{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[67773.67,61597.581,71829.977,66072.066,65056.651,64223.737,69257.261,73584.442,67851.1,67007.862,66564.661],"text":["Year: 2005<br />Generation_GWh: 67773.670","Year: 2006<br />Generation_GWh: 61597.581","Year: 2007<br />Generation_GWh: 71829.977","Year: 2008<br />Generation_GWh: 66072.066","Year: 2009<br />Generation_GWh: 65056.651","Year: 2010<br />Generation_GWh: 64223.737","Year: 2011<br />Generation_GWh: 69257.261","Year: 2012<br />Generation_GWh: 73584.442","Year: 2013<br />Generation_GWh: 67851.100","Year: 2014<br />Generation_GWh: 67007.862","Year: 2015<br />Generation_GWh: 66564.661"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[3254,3254,3254,2739,2163,3848,4165,4289,4121,3964,3711],"text":["Year: 2005<br />Generation_GWh:  3254.000","Year: 2006<br />Generation_GWh:  3254.000","Year: 2007<br />Generation_GWh:  3254.000","Year: 2008<br />Generation_GWh:  2739.000","Year: 2009<br />Generation_GWh:  2163.000","Year: 2010<br />Generation_GWh:  3848.000","Year: 2011<br />Generation_GWh:  4165.000","Year: 2012<br />Generation_GWh:  4289.000","Year: 2013<br />Generation_GWh:  4121.000","Year: 2014<br />Generation_GWh:  3964.000","Year: 2015<br />Generation_GWh:  3711.000"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x2","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x3","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[60327.016,54247.228,64287.014,58699.09,56462.248,54151.855,61037.382,65140.911,59223.454,57572.873,57374.361],"text":["Year: 2005<br />Generation_GWh: 60327.016","Year: 2006<br />Generation_GWh: 54247.228","Year: 2007<br />Generation_GWh: 64287.014","Year: 2008<br />Generation_GWh: 58699.090","Year: 2009<br />Generation_GWh: 56462.248","Year: 2010<br />Generation_GWh: 54151.855","Year: 2011<br />Generation_GWh: 61037.382","Year: 2012<br />Generation_GWh: 65140.911","Year: 2013<br />Generation_GWh: 59223.454","Year: 2014<br />Generation_GWh: 57572.873","Year: 2015<br />Generation_GWh: 57374.361"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x4","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x5","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[3254,3254,3254,2739,2197,3970.7,4649.9,4797,4980.8,5035.2,4917.3],"text":["Year: 2005<br />Generation_GWh:  3254.000","Year: 2006<br />Generation_GWh:  3254.000","Year: 2007<br />Generation_GWh:  3254.000","Year: 2008<br />Generation_GWh:  2739.000","Year: 2009<br />Generation_GWh:  2197.000","Year: 2010<br />Generation_GWh:  3970.700","Year: 2011<br />Generation_GWh:  4649.900","Year: 2012<br />Generation_GWh:  4797.000","Year: 2013<br />Generation_GWh:  4980.800","Year: 2014<br />Generation_GWh:  5035.200","Year: 2015<br />Generation_GWh:  4917.300"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x2","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x3","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[4192.654,4096.353,4288.963,4633.976,6397.403,6101.182,3569.979,3646.531,3646.846,4399.789,4273],"text":["Year: 2005<br />Generation_GWh:  4192.654","Year: 2006<br />Generation_GWh:  4096.353","Year: 2007<br />Generation_GWh:  4288.963","Year: 2008<br />Generation_GWh:  4633.976","Year: 2009<br />Generation_GWh:  6397.403","Year: 2010<br />Generation_GWh:  6101.182","Year: 2011<br />Generation_GWh:  3569.979","Year: 2012<br />Generation_GWh:  3646.531","Year: 2013<br />Generation_GWh:  3646.846","Year: 2014<br />Generation_GWh:  4399.789","Year: 2015<br />Generation_GWh:  4273.000"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x4","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[63581.016,57501.228,67541.014,61438.09,58659.248,58122.555,65687.282,69937.911,64204.254,62608.073,62291.661],"text":["Year: 2005<br />Generation_GWh: 63581.016","Year: 2006<br />Generation_GWh: 57501.228","Year: 2007<br />Generation_GWh: 67541.014","Year: 2008<br />Generation_GWh: 61438.090","Year: 2009<br />Generation_GWh: 58659.248","Year: 2010<br />Generation_GWh: 58122.555","Year: 2011<br />Generation_GWh: 65687.282","Year: 2012<br />Generation_GWh: 69937.911","Year: 2013<br />Generation_GWh: 64204.254","Year: 2014<br />Generation_GWh: 62608.073","Year: 2015<br />Generation_GWh: 62291.661"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x5","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[0,0,0,0,0,0,0,0,0,0,0],"text":["Year: 2005<br />Generation_GWh:     0.000","Year: 2006<br />Generation_GWh:     0.000","Year: 2007<br />Generation_GWh:     0.000","Year: 2008<br />Generation_GWh:     0.000","Year: 2009<br />Generation_GWh:     0.000","Year: 2010<br />Generation_GWh:     0.000","Year: 2011<br />Generation_GWh:     0.000","Year: 2012<br />Generation_GWh:     0.000","Year: 2013<br />Generation_GWh:     0.000","Year: 2014<br />Generation_GWh:     0.000","Year: 2015<br />Generation_GWh:     0.000"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[null,null,null,null,null,null,null,null,null,null,null],"text":["Year: 2005<br />Generation_GWh:        NA","Year: 2006<br />Generation_GWh:        NA","Year: 2007<br />Generation_GWh:        NA","Year: 2008<br />Generation_GWh:        NA","Year: 2009<br />Generation_GWh:        NA","Year: 2010<br />Generation_GWh:        NA","Year: 2011<br />Generation_GWh:        NA","Year: 2012<br />Generation_GWh:        NA","Year: 2013<br />Generation_GWh:        NA","Year: 2014<br />Generation_GWh:        NA","Year: 2015<br />Generation_GWh:        NA"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x2","yaxis":"y3","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10,11],"y":[0,0,0,0,0,0,484.9,508,859.8,1071.2,1206.3],"text":["Year: 2005<br />Generation_GWh:     0.000","Year: 2006<br />Generation_GWh:     0.000","Year: 2007<br />Generation_GWh:     0.000","Year: 2008<br />Generation_GWh:     0.000","Year: 2009<br />Generation_GWh:     0.000","Year: 2010<br />Generation_GWh:     0.000","Year: 2011<br />Generation_GWh:   484.900","Year: 2012<br />Generation_GWh:   508.000","Year: 2013<br />Generation_GWh:   859.800","Year: 2014<br />Generation_GWh:  1071.200","Year: 2015<br />Generation_GWh:  1206.300"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x3","yaxis":"y3","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":39.8660578386606,"r":7.30593607305936,"b":53.820395738204,"l":54.7945205479452},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,0.189852866565195],"type":"linear","autorange":false,"range":[0.4,11.6],"tickmode":"array","ticktext":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"tickvals":[1,2,3,4,5,6,7,8,9,10,11],"categoryorder":"array","categoryarray":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-90,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y3","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"annotations":[{"text":"Year","x":0.5,"y":-0.0794858785726366,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"top","annotationType":"axis"},{"text":"Generation_GWh","x":-0.0558092338914257,"y":0.5,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-90,"xanchor":"right","yanchor":"center","annotationType":"axis"},{"text":"All sources","x":0.0949264332825977,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Biomass","x":0.3,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Coal","x":0.5,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Hydro","x":0.7,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Natural Gas","x":0.905073566717402,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Non-hydro renewables","x":0.0949264332825977,"y":0.622695755115847,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Nuclear","x":0.3,"y":0.622695755115847,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Oil","x":0.5,"y":0.622695755115847,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Other sources","x":0.7,"y":0.622695755115847,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Renewables","x":0.905073566717402,"y":0.622695755115847,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Solar","x":0.0949264332825977,"y":0.289362421782513,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Thermal","x":0.3,"y":0.289362421782513,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Wind","x":0.5,"y":0.289362421782513,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"}],"yaxis":{"domain":[0.710637578217487,1],"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.189852866565195,"y0":0.710637578217487,"y1":1},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":0.189852866565195,"y0":1,"y1":1.07699037620297},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.210147133434805,"x1":0.389852866565195,"y0":0.710637578217487,"y1":1},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.210147133434805,"x1":0.389852866565195,"y0":1,"y1":1.07699037620297},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.410147133434805,"x1":0.589852866565195,"y0":0.710637578217487,"y1":1},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.410147133434805,"x1":0.589852866565195,"y0":1,"y1":1.07699037620297},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.610147133434805,"x1":0.789852866565195,"y0":0.710637578217487,"y1":1},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.610147133434805,"x1":0.789852866565195,"y0":1,"y1":1.07699037620297},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.810147133434805,"x1":1,"y0":0.710637578217487,"y1":1},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.810147133434805,"x1":1,"y0":1,"y1":1.07699037620297},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.189852866565195,"y0":0.377304244884154,"y1":0.622695755115847},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":0.189852866565195,"y0":0.622695755115847,"y1":0.699686131318821},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.210147133434805,"x1":0.389852866565195,"y0":0.377304244884154,"y1":0.622695755115847},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.210147133434805,"x1":0.389852866565195,"y0":0.622695755115847,"y1":0.699686131318821},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.410147133434805,"x1":0.589852866565195,"y0":0.377304244884154,"y1":0.622695755115847},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.410147133434805,"x1":0.589852866565195,"y0":0.622695755115847,"y1":0.699686131318821},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.610147133434805,"x1":0.789852866565195,"y0":0.377304244884154,"y1":0.622695755115847},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.610147133434805,"x1":0.789852866565195,"y0":0.622695755115847,"y1":0.699686131318821},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.810147133434805,"x1":1,"y0":0.377304244884154,"y1":0.622695755115847},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.810147133434805,"x1":1,"y0":0.622695755115847,"y1":0.699686131318821},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.189852866565195,"y0":0,"y1":0.289362421782513},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":0.189852866565195,"y0":0.289362421782513,"y1":0.366352797985488},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.210147133434805,"x1":0.389852866565195,"y0":0,"y1":0.289362421782513},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.210147133434805,"x1":0.389852866565195,"y0":0.289362421782513,"y1":0.366352797985488},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.410147133434805,"x1":0.589852866565195,"y0":0,"y1":0.289362421782513},{"type":"rect","fillcolor":"rgba(217,217,217,1)","line":{"color":"transparent","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0.410147133434805,"x1":0.589852866565195,"y0":0.289362421782513,"y1":0.366352797985488}],"xaxis2":{"type":"linear","autorange":false,"range":[0.4,11.6],"tickmode":"array","ticktext":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"tickvals":[1,2,3,4,5,6,7,8,9,10,11],"categoryorder":"array","categoryarray":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-90,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.210147133434805,0.389852866565195],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y3","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"xaxis3":{"type":"linear","autorange":false,"range":[0.4,11.6],"tickmode":"array","ticktext":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"tickvals":[1,2,3,4,5,6,7,8,9,10,11],"categoryorder":"array","categoryarray":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-90,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.410147133434805,0.589852866565195],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y3","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"xaxis4":{"type":"linear","autorange":false,"range":[0.4,11.6],"tickmode":"array","ticktext":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"tickvals":[1,2,3,4,5,6,7,8,9,10,11],"categoryorder":"array","categoryarray":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-90,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.610147133434805,0.789852866565195],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y3","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"xaxis5":{"type":"linear","autorange":false,"range":[0.4,11.6],"tickmode":"array","ticktext":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"tickvals":[1,2,3,4,5,6,7,8,9,10,11],"categoryorder":"array","categoryarray":["2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-90,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.810147133434805,1],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y3","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis2":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.377304244884154,0.622695755115847],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis3":{"type":"linear","autorange":false,"range":[-3679.2221,77263.6641],"tickmode":"array","ticktext":["0","20000","40000","60000"],"tickvals":[0,20000,40000,60000],"categoryorder":"array","categoryarray":["0","20000","40000","60000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0,0.289362421782513],"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":[{"name":"Collaborate","icon":{"width":1000,"ascent":500,"descent":-50,"path":"M487 375c7-10 9-23 5-36l-79-259c-3-12-11-23-22-31-11-8-22-12-35-12l-263 0c-15 0-29 5-43 15-13 10-23 23-28 37-5 13-5 25-1 37 0 0 0 3 1 7 1 5 1 8 1 11 0 2 0 4-1 6 0 3-1 5-1 6 1 2 2 4 3 6 1 2 2 4 4 6 2 3 4 5 5 7 5 7 9 16 13 26 4 10 7 19 9 26 0 2 0 5 0 9-1 4-1 6 0 8 0 2 2 5 4 8 3 3 5 5 5 7 4 6 8 15 12 26 4 11 7 19 7 26 1 1 0 4 0 9-1 4-1 7 0 8 1 2 3 5 6 8 4 4 6 6 6 7 4 5 8 13 13 24 4 11 7 20 7 28 1 1 0 4 0 7-1 3-1 6-1 7 0 2 1 4 3 6 1 1 3 4 5 6 2 3 3 5 5 6 1 2 3 5 4 9 2 3 3 7 5 10 1 3 2 6 4 10 2 4 4 7 6 9 2 3 4 5 7 7 3 2 7 3 11 3 3 0 8 0 13-1l0-1c7 2 12 2 14 2l218 0c14 0 25-5 32-16 8-10 10-23 6-37l-79-259c-7-22-13-37-20-43-7-7-19-10-37-10l-248 0c-5 0-9-2-11-5-2-3-2-7 0-12 4-13 18-20 41-20l264 0c5 0 10 2 16 5 5 3 8 6 10 11l85 282c2 5 2 10 2 17 7-3 13-7 17-13z m-304 0c-1-3-1-5 0-7 1-1 3-2 6-2l174 0c2 0 4 1 7 2 2 2 4 4 5 7l6 18c0 3 0 5-1 7-1 1-3 2-6 2l-173 0c-3 0-5-1-8-2-2-2-4-4-4-7z m-24-73c-1-3-1-5 0-7 2-2 3-2 6-2l174 0c2 0 5 0 7 2 3 2 4 4 5 7l6 18c1 2 0 5-1 6-1 2-3 3-5 3l-174 0c-3 0-5-1-7-3-3-1-4-4-5-6z"},"click":"function(gd) { \n        // is this being viewed in RStudio?\n        if (location.search == '?viewer_pane=1') {\n          alert('To learn about plotly for collaboration, visit:\\n https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html');\n        } else {\n          window.open('https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html', '_blank');\n        }\n      }"}],"cloud":false},"source":"A","attrs":{"54e7590b6997":{"x":{},"y":{},"type":"scatter"}},"cur_data":"54e7590b6997","visdat":{"54e7590b6997":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1}},"base_url":"https://plot.ly"},"evals":["config.modeBarButtonsToAdd.0.click"],"jsHooks":{"render":[{"code":"function(el, x) { var ctConfig = crosstalk.var('plotlyCrosstalkOpts').set({\"on\":\"plotly_click\",\"persistent\":false,\"dynamic\":false,\"selectize\":false,\"opacityDim\":0.2,\"selected\":{\"opacity\":1}}); }","data":null}]}}</script><!--/html_preserve-->
