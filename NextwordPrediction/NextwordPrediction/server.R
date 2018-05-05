#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#rsconnect::showLogs()
#a few times I had issue and I Thank you Ian Pylvainen 
#setwd("D:/Downloads/DataScience/Coursera/Capstone/NextwordPrediction/NextwordPrediction")

library(shiny)
library(dplyr)
library(tm)
#library(stringi)
#library(stringdist)
library(wordcloud)
library(RColorBrewer)




shinyServer(function(input, output,session) {
  uni_df <- readRDS("./ngrams/unigrams.Rdata")
  bi_df <- readRDS("./ngrams/bigrams.Rdata")
  tri_df <- readRDS("./ngrams/trigrams.Rdata")
  quad_df <- readRDS("./ngrams/quadgrams.Rdata")
  penta_df <- readRDS("./ngrams/pentagrams.Rdata")
  ecta_df <- readRDS("./ngrams/ectagrams.Rdata")
  
   source("GetMyFunctions.R")
  theprediction <- reactive({sbo_predict(input$string_input,uni_df,bi_df,tri_df,quad_df,penta_df,ecta_df,profanities)})
  output$best_prediction <- renderText({
    theprediction()[1]
  })
  output$predButton1 <- renderUI({
    actionButton("predButtona1", label = theprediction()[1])
  })
  output$predButton2 <- renderUI({
    actionButton("predButtona2", label = theprediction()[2])
  })
  output$predButton3 <- renderUI({
    actionButton("predButtona3", label = theprediction()[3])
  })
  output$predButton4 <- renderUI({
    actionButton("predButtona4", label = theprediction()[4])
  })
  output$predButton5 <- renderUI({
    actionButton("predButtona5", label = theprediction()[5])
  })
  output$predButton6 <- renderUI({
    actionButton("predButtona6", label = theprediction()[6])
  })
  output$predButton7 <- renderUI({
    actionButton("predButtona7", label = theprediction()[7])
  })
  output$predButton8 <- renderUI({
    actionButton("predButtona8", label = theprediction()[8])
  })
  output$predButton9 <- renderUI({
    actionButton("predButtona9", label = theprediction()[9])
  })
  output$predButton10 <- renderUI({
    actionButton("predButtona10", label = theprediction()[10])
  })
  
 # output$table <- renderTable(iris)
  
  
  
 # output$resultTable <- DT::renderDataTable({
#  prediction.result <- theprediction()[1:30]
#  DT::datatable(prediction.result, options=list(lengthMenu=c(10, 25, 100),
 #                                               pageLength=10,
#                                                searching=F))
 # })
  
  
  
  
  output$resultWordCloud <- renderPlot({
    prediction.result <- theprediction()[1:30]
    wordcloud_rep <- repeatable(wordcloud)
   # d <- data.frame(word =  prediction.result[,1])
    
    suppressWarnings(
      wordcloud_rep(theprediction()[1:30],
                    seq(100, 1, length.out=row_number(prediction.result)),
                                 random.color=F, random.order=F,
                                colors=brewer.pal(8, "Spectral")
#wordcloud(theprediction()[1:30],
 # seq(100, 1, length.out=row_number(prediction.result)),
  #              random.color=F, random.order=F,
   #             colors=brewer.pal(8, "Spectral")
                #colors=brewer.pal(6, "Dark2"),
                #family = "mono",font = 3,
                #rot.per=0, 
                #fixed.asp=F
               #, scale=c(3, 6)
  )
    )
  })
  
   observeEvent(input$predButtona1,{
    if (input$string_input!=""){
      new_input <- paste(input$string_input,theprediction()[1])
    }
    else{
      new_input <- theprediction()[1]
    }
    updateTextInput(session, "string_input", value = new_input)
  })
  observeEvent(input$predButtona2,{
    if (input$string_input!=""){
      new_input <- paste(input$string_input,theprediction()[2])
    }
    else{
      new_input <- theprediction()[2]
    }
    updateTextInput(session, "string_input", value = new_input)
  })
  observeEvent(input$predButtona3,{
    if (input$string_input!=""){
      new_input <- paste(input$string_input,theprediction()[3])
    }
    else{
      new_input <- theprediction()[3]
    }
    updateTextInput(session, "string_input", value = new_input)
  })
  
})