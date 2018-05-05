#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
#setwd("D:/Downloads/DataScience/Coursera/Capstone/NextwordPrediction/NextwordPrediction")
profanities <-  readLines('bad-words.txt')
#We used JQuery

library(shiny)
library(dplyr)
js_focus_back_on_input <- 
  '
$(document).ready(function() {
$("#predButton1,#predButton2,#predButton3,#predButton4,#predButton5,#predButton6,#predButton7,#predButton8,#predButton9,#predButton10").click(function(e) {
$("#string_input").focus();
});
});
'

#JQuery_alert <-
#'
#$('div').on('tap', function(event){
#  alert('element tapped ');
#});

#'

#$('p').css({"color":"green"});

#//float all divs with class .left




JQuery_Focus <-
'$(document).ready(function(){
    $("input").focus(function(){
        $(this).css("background-color", "red");
       });

        
    
    $("input").blur(function(){
        $(this).css("background-color", " White");
       
    });
});
'
JQuery_Hide <-
'
$(document).ready(function(){
    $("p").dblclick(function(){
        $(this).hide();
    });
});
'
shinythemes::themeSelector()
shinyUI(navbarPage("Next Word Prediction",#theme=shinythemes::shinytheme("lumen"),
                   #theme=shinythemes::shinytheme("journal") ,
                   #theme=shinythemes::shinytheme("united"),
                   #theme = "bootstrap.css" ,
                   theme="main.css",
                   tabPanel("NextWordPrediction",
                            tags$script(js_focus_back_on_input),
			                      tags$script(JQuery_Focus ),
			                       tags$script(JQuery_Hide),
			        
 mainPanel(h2("Word Prediction:"),
textInput("string_input","",placeholder="Please Enter your text here",label="",width="1000%")),

##mainPanel
mainPanel( h4("Predicted words:"),
#div("Here is some text inside the div", style = "color:green; font-size:20px; background-color: white; border: 1px solid #ccc; #border-radius: 3px; margin: 10px 0; padding: 10px; width: 700px", <input type='submit' value='Dismiss'/>),
           
          div(id="predButtons",style = "color:green; font-size:20px;,background-color: white;", 
                      
            uiOutput("predButton1"),  uiOutput("predButton2"),
            uiOutput("predButton3"),  uiOutput("predButton4"),
            uiOutput("predButton5"),  uiOutput("predButton6"),
            uiOutput("predButton7"),  uiOutput("predButton8"),
            uiOutput("predButton9"),  uiOutput("predButton10")),
          style = "color:green; font-size:20px;,background-color: white;",
             #style = "display: inline-block;",
            div(id="top_prediction",
            h4("Most Possible prediction:"),
            textOutput("best_prediction")
                              ),
plotOutput("resultWordCloud"))),
tabPanel("Algorithm",
mainPanel(
h2("Algorithm"),
h4("Data Cleaning"),

p("For cleaning the data I used regular expressions and TM Text Mining Package.I downloaded the data from:
''https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip''I got all of the statistics but I couldn't process all of the data so I decided to work with a sampled data source.I took 2,000,000 lines of sample data from ''Twitter, Blogs and News''
I created a clean train dataset saved it as the RDS format.'
The sample dataset was cleaned;removed non-ascii characters,emoji,ieing converted to lowercase letters and then by removing all contractions, punctuation, numbers, profanities,leftout letters and extra whitespaces.For data mining I split the data to four threads and started to build vocabulary.First I created unigram text2vect objects using a UNIGRAM, BIGRAM, TRIGRAM, QUADGRAM, PENTAGRAM, and ECTAGRAM text2vec objects."),

br(),
h4("Prediction Model"),

p("It was very processor-intensive, regardless of my 16G of RAM. I tried to work with whole data I have run many exploratory analyses to figure out the correct amount of word dictionaries to get 
correct estimation. Trying to generate the ''text2vec'' objects took about one week."),
p("The data was then tokenized to form the Maximum Likelihood Estimation (MLE) matrices of various n-grams."),
p("All frequencies up to 6-grams were computed. The top ten predictions, using 
a simple back-off model, are being calculated as predictions to the user input."),

p("How the backoff algorith is used:"),
p("The maximum amount of words tailed from the input text is five ngrams, which is searched in the six ngram data sets. 
According to the text you enter in the text box, the predictions of the next word will be shown according to the Maximum Likelihood Estimation (MLE) matrices of the 
various n-grams."), 
p("Ex.
If the input text has five words, then the application will split and search inside the six ngram datasets.
If the input text has four words, then the application will split and search inside the five ngram datasets.
If the input text has three words, then the application will split and search inside the four ngram datasets.
If the input text has two words, then the application will split and search inside the three ngram datasets.
If the input text has one word, then the application will split and search inside the two ngram datasets.
If the input text has zero words, then the application will split and search inside the one ngram datasets."),
br()                       )),
tabPanel("About", mainPanel(
       h2("About this project"),
       p("This project was completed during the Capstone Project of the Data Science Coursera Specialization,
        offered by Johns Hopkins University."),
       p("The instructors for this project were Brian Caffo, Roger D. Peng and Jeff Leek."),
        p("This project is a collaboration with SwiftKey, text prediction algorithm, predicting the next word from a sentence.")),    
mainPanel(
h2("About me"),
p("Hello this is Aysegul Sonmez please reach me out from linkedin by clicking Linkedin icon:"),
a(href="https://www.linkedin.com/in/aysegul-sonmez-883b065/",
img(src="http://icons.iconarchive.com/icons/custom-icon-design/pretty-social-media/48/Linkedin-icon.png",alt="Linkedin",height="36px",width="36px")),onclick ="location.href='https://www.linkedin.com/in/aysegul-sonmez-883b065/';" ,

p("If you want to reach ''The Prediction resources for the next word '' please click on github image:"),
a(href="https://github.com/aysegulson/Capstone",
  img(src="http://dimgkiokas.com/github-icon.png",alt="github-icon",height="36px",width="36px"))


)) )
)