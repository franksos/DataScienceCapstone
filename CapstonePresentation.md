Capstone Presentation: A Word Prediction Model
========================================================
author: Haifeng Yu
date: 2017-08-02
autosize: true

Overview
========================================================
This is the last course of the Coursera's Data Science specializaiton. In this course I need to develop an interactive web application which predicts the next word when user types in a natural language. I am provided a large corpus of texts from blogs, twitters and news to start with.

The project include below milestones:
- Explore and clean the data
- Model creation, validation and optimization
- Build an web based App using Shiny
- Write a report presentation

Data sampling and cleaning
========================================================
The original datasets are HUGE. I wjust use a sample of this dataset to build my model. Considering the computing power of my computer and the resource I have for the final web based Shiny APP, usning a small dataset and a simple model will ensure the app is responsive in a reasonable time.

The orignal data are then standardized and tokenized to N-gram phrases. I decided not to elimiate foul words because (1) that is part of the “natural” language and I need to rely on a dictonary to get rid of them. (2) There are only few such words that the impact is minimal.

Prediction Algorithm
========================================================
I run a simple algorithm with back-off N-gram model.
- Extract the last three words inputed by the user, if less than 3, extract all. 
- Use a 4-gram to see if user’s input fits the first three words. If yes, prediction is the fourth word of the most frequent 4-gram phrase. 
- If no 4-gram is matched, back-off to 3-gram model to match the last two words inputed by user.
- If no 3-gram is matched, back-off to 2-gram to match the last word user inputed. 
- Finally if no match found in 2-grams, random choose a word in 1-gram according to their frequency.

Final Product and Final Words
========================================================
The final APP is psoted on:
https://franksos.shinyapps.io/WordPredictionCapstone/

The codes for this project are available at:
https://github.com/franksos/DataScienceCapstone

Thank you professors - Jeff Leek, Roger Peng and Brian Caffo. I learned a lot in this specialization.

Thank you Google and Wikipedia - I used them a lot while doing this project and during my study.

Also thank you my peers - It was fun learning together with all of you.

Haifeng Yu 2017-08
