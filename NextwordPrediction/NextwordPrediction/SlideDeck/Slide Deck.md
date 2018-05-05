Slide Deck
========================================================
author: Aysegul Sonmez
date: 03 May, 2018
autosize: true
Introduction
========================================================


                        ***Data Science Capstone***
                     ***by Johns Hopkins University***


Mr. Jeff Leek, PhD, Mr. Roger D. Peng,PhD,Mr. Brian Caffo,
Associate Professors, Biostatistics Bloomberg School of Public Health 
 

--Project Goal

Create a usable application on natural language processing
The objective of the project is to build a functioning predictive text model. 
The data is from a corpus called 
[HC Corpora](https://web-beta.archive.org/web/20160930083655/http://www.corpora.heliohost.org/aboutcorpus.html), and,for this application, only the english datasets have been utilized.

[Johns Hopkins University](https://www.jhsph.edu/) (JHU) is
to create a usable application on natural language processing. This capstone project
is offered in collaboration with [SwiftKey](https://swiftkey.com/en).

For this project, the Text Mining packages **tm** and **text2vec** were used, along with the data manipulationpackage **dplyr** and the package **doParallel**. The app was created using the **shiny** package.


Predictive Model/ Algorithm

========================================================


To build the predictive model, 2.000.000 lines from all twitter, blogs and news datasets were sampled and worked on it.
dataset cleaned, by removing all non-ascii characters converted to lowercase letters and then by removing all contractions, punctuation, numbers, profanities, leftout letters and extra whitespaces.

It was very processor-intensive.Processing correct amount of word dictionaries are very sensitive to get correct estimation.Choosed *n* (for *n-gram*) equals to number of words plus one word.
Search for appropriate *n-grams* and order results from common (high frequency, or high probability) to rare.
All frequencies up to 6-grams were computed with sampled data. The top ten predictions displayed with back-off model,according to the user input.


The Shiny Application
========================================================
-Word Predict Applicasion User Manual
par(mfrow=c(2,3)) 

![Word Prediction Application](Capture.png)

![plot of chunk unnamed-chunk-1](Slide Deck-figure/unnamed-chunk-1-1.png)

========================================================







```
Error in (function (filename = "Rplot%03d.png", width = 480, height = 480,  : 
  unable to start png() device
```
