#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("wordpredict.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$text1 <- renderText({input$txt1})
  output$text2 <- renderText({
          predict_text(process_input(input$txt1))
  })
})
