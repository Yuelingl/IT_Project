---
title: "Clean PISA Data"
output:
  html_document:
    df_print: paged
    keep_md: yes
    toc: yes
---

### Goal

The Goal of this File is to clean the Data of the PISA (Programm for International Student Assessment) study in order  
to use it for comparing with the World Happiness Record and the GISAH Study.
  
  
The cleaned Data should contain only the values for the year 2015 and only rows where all colums have values.



### Load Librarys

-- Load Library for reading CSV Files.


```r
library(csvread)
```


### Read PISA - CSV File

-- Read CSV File "pisa_data.csv"
-- Gets PISA Data for cleaning



```r
pisadata_dirty <- read.csv(file = "../data/raw_data/pisa_data.csv", header = TRUE)
head(pisadata_dirty)
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["ï..Country.Name"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["Country.Code"],"name":[2],"type":["fctr"],"align":["left"]},{"label":["Series.Name"],"name":[3],"type":["fctr"],"align":["left"]},{"label":["Series.Code"],"name":[4],"type":["fctr"],"align":["left"]},{"label":["X2013..YR2013."],"name":[5],"type":["fctr"],"align":["left"]},{"label":["X2014..YR2014."],"name":[6],"type":["fctr"],"align":["left"]},{"label":["X2015..YR2015."],"name":[7],"type":["fctr"],"align":["left"]}],"data":[{"1":"Albania","2":"ALB","3":"PISA: Mean performance on the mathematics scale","4":"LO.PISA.MAT","5":"..","6":"..","7":"413.157","_rn_":"1"},{"1":"Albania","2":"ALB","3":"PISA: Mean performance on the mathematics scale. Female","4":"LO.PISA.MAT.FE","5":"..","6":"..","7":"417.750029482799","_rn_":"2"},{"1":"Albania","2":"ALB","3":"PISA: Mean performance on the mathematics scale. Male","4":"LO.PISA.MAT.MA","5":"..","6":"..","7":"408.545458736189","_rn_":"3"},{"1":"Albania","2":"ALB","3":"PISA: Mean performance on the reading scale","4":"LO.PISA.REA","5":"..","6":"..","7":"405.2588","_rn_":"4"},{"1":"Albania","2":"ALB","3":"PISA: Mean performance on the reading scale. Female","4":"LO.PISA.REA.FE","5":"..","6":"..","7":"434.639625546737","_rn_":"5"},{"1":"Albania","2":"ALB","3":"PISA: Mean performance on the reading scale. Male","4":"LO.PISA.REA.MA","5":"..","6":"..","7":"375.75919916958","_rn_":"6"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
