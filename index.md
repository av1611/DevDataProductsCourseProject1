---
title       : Deaths Due To HIV/AIDS
subtitle    : An Analysis of World Health Organization Data
author      : Alexis
job         : Coursera Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## The input

<div id="container" style="width:900px">

<div id="image1" style="width:240px;float:left">

<img src="https://raw.githubusercontent.com/av1611/DevDataProductsCourseProject1/gh-pages/figures/input.jpeg" alt="Shiny Input" width="220" height="280"
style="border:1px solid black"><br><br>

<img src="https://raw.githubusercontent.com/av1611/DevDataProductsCourseProject1/gh-pages/figures/mean.jpeg" alt="Adding a mean" width="160" height="160"
style="border:1px solid black">

</div>

<div id="text1" style="width:660px;float:right">

<br><p>In order to explore the AIDS death toll, single or multiple countries can
be selected. Per country, estimates for each of the years 2001 and 2012 are
registered (although missing values may occur). For the countries selected,
the respective death toll will be displayed in a table and a bar chart.</p>

<br><br><br>

<p>If adding a mean is desired, a row denoting the mean of the annual estimates 
can be added to the table below each country.</p>

</div></div>

--- 

## The data set

<p>Background for this application is the data set "Deaths Due To HIV/AIDS 
(Per 100,000 Population)" supplied by the World Health Organization. It is
read into R as follows:</p>


```r
temp <- tempfile(); url <- "http://apps.who.int/gho/athena/api/GHO/WHS2_138.csv?profile=verbose"
download.file(url, temp); data <- read.csv(temp); unlink(temp)
```

```
## Warning: downloaded length 67846 != reported length 200
```


```
##  [1] "GHO..CODE."             "GHO..DISPLAY."         
##  [3] "GHO..URL."              "PUBLISHSTATE..CODE."   
##  [5] "PUBLISHSTATE..DISPLAY." "PUBLISHSTATE..URL."    
##  [7] "YEAR..CODE."            "YEAR..DISPLAY."        
##  [9] "YEAR..URL."             "REGION..CODE."         
## [11] "REGION..DISPLAY."       "REGION..URL."          
## [13] "COUNTRY..CODE."         "COUNTRY..DISPLAY."     
## [15] "COUNTRY..URL."          "Display.Value"         
## [17] "Numeric"                "Low"                   
## [19] "High"                   "Comments"
```

--- 

## The output

<div id="container" style="width:900px">

<div id="image2" style="width:380px;float:left">
<img src="https://raw.githubusercontent.com/av1611/DevDataProductsCourseProject1/gh-pages/figures/output.jpeg" alt="Shiny Output" width="380" height="500"
style="border:1px solid black">
</div>

<div id="text2" style="width:420px;float:right">

<br><p>Once countries have been selected, their death toll per 100,000 citizens
is displayed in a table. Per country,
a measurement for each of the years 2001 and 2012 is listed.</p><br>

<p>If no countries were chosen for which missing values are registered, the
table is accompanied by a bar chart. It visualizes the death ratio for each
country and year.</p>

</div></div>

---

<div id="container" style="width:900px">

<div id="image3" style="width:480px;float:left">
<br><img src="https://raw.githubusercontent.com/av1611/DevDataProductsCourseProject1/gh-pages/figures/total.jpeg" alt="Shiny Total" width="460" height="540"
style="border:1px solid black">
</div>

<div id="text3" style="width:420px;float:right">
<br><br><br><br><br><center><h1>Have fun exploring!</h1></center>
</div>

</div>
