---
title: "Descriptive Analysis"
output:
  html_document:
    df_print: paged
    keep_md: yes
    toc: yes
---


## Setup

### Load Librarys

-- Load Library for reading CSV Files.
-- Load tidyr-library
-- Load dplyr-library


```r
library(csvread)
library(tidyr)
library(dplyr)
library(ggplot2)
library(ggthemes)
```

### Read Data

```r
master.data <- read.csv("../data/master_data/master_data.csv")
master.data
```

## Select relevant columns for regional analysis

Too many countries for plot analysis, therefore we take the respective regions as categories


```r
region.data <- select(master.data, -Country, Happiness.Score.Standard.Error)
region.data
```


```r
help.data<- select(master.data, Region,Happiness.Score, 5:11)

help.data<-help.data%>%
  group_by(Region)%>%
  summarise_all(funs(mean))

help.data
```

How the Happiness Score is made up

```r
theme_set(theme_classic())

happ.box<- ggplot(region.data, aes(Region, Happiness.Score))

happ.box + geom_boxplot(varwidth = T,   fill="plum") +
  theme(axis.text.x = element_text(angle=60, vjust = 0.6, size = 7.5))+
  labs(title="Happiness across Regions",
       x="Region",
       y="Happiness Score")
```


Preparing the dataset for binning



```r
binnable.happiness.data <- gather(help.data, Happiness.Reasons, Amount, 3:9 )
binnable.happiness.data<- select(binnable.happiness.data, Region,Happiness.Reasons, Amount)
binnable.happiness.data
```




```r
theme_set(theme_classic())

happ.histo<- ggplot(binnable.happiness.data, aes(Region, Amount))

happ.histo + geom_bar(aes(fill=Happiness.Reasons), position = "stack", stat="identity")+
  theme(axis.text.x = element_text(angle=70, vjust = 0.6, size = 7.5)) 
```

### 
