

Welcome to Captone Next Word Prediction project 
========================================================
author: Aysegul Sonmez
date: 03 May, 2018
autosize: true   

Data Science Capstone
by Johns Hopkins University

========================================================                     
**Introduction**                    


Mr. Jeff Leek, PhD, Associate Professor, Biostatistics
Bloomberg School of Public Health
Roger D. Peng, PhD

Mr. Roger D. Peng, PhD, Associate Professor, Biostatistics
Bloomberg School of Public Health
Brian Caffo, PhD

Mr. Brian Caffo, PhD, Professor, Biostatistics
Bloomberg School of Public Health

****

**Project Goal**   

Create a usable application on natural language processing
The objective of the project is to build a functioning predictive text model. 
The data is from a corpus called 
[HC Corpora](https://web-beta.archive.org/web/20160930083655/http://www.corpora.heliohost.org/aboutcorpus.html), and,for this application, only the english datasets have been utilized.


[Johns Hopkins University]:(https://www.jhsph.edu/) (JHU) is
to create a usable application on natural language processing. This capstone project
is offered in collaboration with [SwiftKey](https://swiftkey.com/en).


For this project, the Text Mining packages **tm** and **text2vec** were used, along with the data manipulationpackage **dplyr** and the package **doParallel**. The app was created using the **shiny** package.


Predictive Model/ Algorithm
========================================================
<br>
<br>
To build the predictive model, 2.000.000 lines from all twitter, blogs and news datasets were sampled and worked on it.
dataset cleaned, by removing all non-ascii characters converted to lowercase letters and then by removing all contractions, punctuation, numbers, profanities, leftout letters and extra whitespaces.

It was very processor-intensive.Processing correct amount of word dictionaries are very sensitive to get correct estimation.Choosed *n* (for *n-gram*) equals to number of words plus one word.
Search for appropriate *n-grams* and order results from common (high frequency, or high probability) to rare.   


All frequencies up to 6-grams were computed with sampled data. The top ten predictions displayed with back-off model,according to the user input.   


Please access the URL of an R Pubs document describing my exploratory analysis with (http://rpubs.com/) 
 

<a href="http://rpubs.com/Aysegulsonmez/384922">Click here to access Milestone Project </a>



The Shiny Application
========================================================
-****For accessing to the next word prediction application ****
[Please Click here](https://aysegulzemnos.shinyapps.io/WordPrediction/).
![Word Prediction Application](Capture.png)

1.I used TabPanel for "Next Word Prediction", "Alorith","About"

2.In the Next Word Prediction please type your text and see your top ten prediction results and also best prediction.

3.You will see  wordcloud plot according to your prediction. 

4.**Please Wait for dictionary load.It  will take ~5 sec**.

5.Enter some text and explore results will show in one sec.

===================================================
![Word Prediction Application](Algo.png)
![Word Prediction Application](About.png)
