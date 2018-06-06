---
title: "Descriptive Maps"
output:
  html_document:
    df_print: paged
    keep_md: yes
    toc: yes
---




## Introduction

### Load Libraries

-- Load Librarys


```r
library(dplyr)
library(ggplot2)
library(maps)
library(csvread)
```

### Load CSV

-- Load CSV


```r
dfPisa <- read.csv("../../data/clean_data/pisa_data.csv", stringsAsFactors = FALSE)
dfAlcohol <- read.csv("../../data/clean_data/alcohol_data.csv", stringsAsFactors = FALSE)
dfHappiness <- read.csv("../../data/clean_data/happiness_data.csv", stringsAsFactors = FALSE)
```

## Create Maps

### Adapt Data to ggplot2-World Map



```r
WorldData <- ggplot2::map_data('world')
WorldData <- dplyr::filter(WorldData, region != "Antarctica")
WorldData <- ggplot2::fortify(WorldData)

names(dfAlcohol)[1] <- "region"
ind <- which(dfAlcohol$region=="Republic of Korea", arr.in=TRUE)
dfAlcohol$region[ind] <- "South Korea"
ind <- which(dfAlcohol$region=="Russian Federation", arr.in=TRUE)
dfAlcohol$region[ind] <- "Russia"
ind <- which(dfAlcohol$region=="United Kingdom", arr.in=TRUE)
dfAlcohol$region[ind] <- "UK"
ind <- which(dfAlcohol$region=="United States", arr.in=TRUE)
dfAlcohol$region[ind] <- "USA"
ind <- which(WorldData$region=="Trinidad", arr.in=TRUE)
for (country in ind) {
  WorldData$region[ind] <- "Trinidad and Tobago"
}
ind <- which(WorldData$region=="Tobago", arr.in=TRUE)
for (country in ind) {
  WorldData$region[ind] <- "Trinidad and Tobago"
}

names(dfHappiness)[1] <- "region"
ind <- which(dfHappiness$region=="Republic of Korea", arr.in=TRUE)
dfHappiness$region[ind] <- "South Korea"
ind <- which(dfHappiness$region=="Russian Federation", arr.in=TRUE)
dfHappiness$region[ind] <- "Russia"
ind <- which(dfHappiness$region=="United Kingdom", arr.in=TRUE)
dfHappiness$region[ind] <- "UK"
ind <- which(dfHappiness$region=="United States", arr.in=TRUE)
dfHappiness$region[ind] <- "USA"

names(dfPisa)[1] <- "region"
ind <- which(dfPisa$region=="Republic of Korea", arr.in=TRUE)
dfPisa$region[ind] <- "South Korea"
ind <- which(dfPisa$region=="Russian Federation", arr.in=TRUE)
dfPisa$region[ind] <- "Russia"
ind <- which(dfPisa$region=="United Kingdom", arr.in=TRUE)
dfPisa$region[ind] <- "UK"
ind <- which(dfPisa$region=="United States", arr.in=TRUE)
dfPisa$region[ind] <- "USA"
```

### World´s Alcohol consumption

-- Displays the World´s Alcohol Consumption in pure litres of Alcohol  
-- White countries have not participated in the study


```r
df <- data.frame(region=dfAlcohol$region, 
                 value=dfAlcohol$Alcohol.Consumption.All.Types, 
                 stringsAsFactors=FALSE)

p <- ggplot2::ggplot()
p <- p + ggplot2::geom_map(data=WorldData, map=WorldData,
                  ggplot2::aes(x=long, y=lat, group=group, map_id=region),
                  fill="white", colour="#7f7f7f", size=0.3)
```

```
## Warning: Ignoring unknown aesthetics: x, y
```

```r
p <- p + ggplot2::geom_map(data=df, map=WorldData,
                  ggplot2::aes(fill=value, map_id=region),
                  colour="#7f7f7f", size=0.3)
p <- p + ggplot2::coord_map("rectangular", lat0=0, xlim=c(-180,180), ylim=c(-60, 90))
p <- p + ggplot2::scale_fill_continuous(low="grey", high="blue", 
                               guide="colorbar")
p <- p + ggplot2::scale_y_continuous(breaks=c())
p <- p + ggplot2::scale_x_continuous(breaks=c())
p <- p + ggplot2::labs(fill="Litres", title="Litres of pure Alcohol per Capita in 2015", x="Latitude", y="Longitude")
p <- p + ggplot2::theme_bw()
p <- p + ggplot2::theme(panel.border = ggplot2::element_blank())
p
```

![](maps_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

### World´s Happiness Record

-- Displays the World´s Happiness record  
-- White countries have not participated in the study


```r
df <- data.frame(region=dfHappiness$region, 
                 value=dfHappiness$Happiness.Score, 
                 stringsAsFactors=FALSE)

p <- ggplot2::ggplot()
p <- p + ggplot2::geom_map(data=WorldData, map=WorldData,
                  ggplot2::aes(x=long, y=lat, group=group, map_id=region),
                  fill="white", colour="#7f7f7f", size=0.3)
```

```
## Warning: Ignoring unknown aesthetics: x, y
```

```r
p <- p + ggplot2::geom_map(data=df, map=WorldData,
                  ggplot2::aes(fill=value, map_id=region),
                  colour="#7f7f7f", size=0.3)
p <- p + ggplot2::coord_map("rectangular", lat0=0, xlim=c(-180,180), ylim=c(-60, 90))
p <- p + ggplot2::scale_fill_continuous(low="red", high="green", 
                               guide="colorbar")
p <- p + ggplot2::scale_y_continuous(breaks=c())
p <- p + ggplot2::scale_x_continuous(breaks=c())
p <- p + ggplot2::labs(fill="Happiness Score", title="Happiness Score 2015", x="Latitude", y="Longitude")
p <- p + ggplot2::theme_bw()
p <- p + ggplot2::theme(panel.border = ggplot2::element_blank())
p
```

![](maps_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

### PISA-Study Map

-- Displays Mean Performance of the PISA-Study  
-- White countries have not participated in the study


```r
df <- data.frame(region=dfPisa$region, 
                 value=dfPisa$PISA.Performance.Mean, 
                 stringsAsFactors=FALSE)

p <- ggplot2::ggplot()
p <- p + ggplot2::geom_map(data=WorldData, map=WorldData,
                  ggplot2::aes(x=long, y=lat, group=group, map_id=region),
                  fill="white", colour="#7f7f7f", size=0.3)
```

```
## Warning: Ignoring unknown aesthetics: x, y
```

```r
p <- p + ggplot2::geom_map(data=df, map=WorldData,
                  ggplot2::aes(fill=value, map_id=region),
                  colour="#7f7f7f", size=0.3)
p <- p + ggplot2::coord_map("rectangular", lat0=0, xlim=c(-180,180), ylim=c(-60, 90))
p <- p + ggplot2::scale_fill_continuous(low="grey", high="blue", 
                               guide="colorbar")
p <- p + ggplot2::scale_y_continuous(breaks=c())
p <- p + ggplot2::scale_x_continuous(breaks=c())
p <- p + ggplot2::labs(fill="Mean Performance Score", title="Mean PISA Performance in 2015", x="Latitude", y="Longitude")
p <- p + ggplot2::theme_bw()
p <- p + ggplot2::theme(panel.border = ggplot2::element_blank())
p
```

![](maps_files/figure-html/unnamed-chunk-6-1.png)<!-- -->