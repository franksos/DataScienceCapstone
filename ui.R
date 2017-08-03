# Capstone task by Haifeng Yu
# 2017-08-01
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Word Prediction Project"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("txt1", label = "Please start typing...")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       p('Your input is:'),
       textOutput('text1'),
       p(),
       p('Predicted next word is:'),
       textOutput('text2')
    )
  )
))
