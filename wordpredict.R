# Below line is necessary to load rJava library on my Mac
# dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(stringi)
library(NLP)
library(tm)
library(rJava)
library(openNLP)
library(RWeka)
library(dplyr)
library(stringr)

load('ngram.RData')

process_input <- function (input_text) {
        # perform some basic data cleaning
        input_text <- removeNumbers(input_text)
        input_text <- removePunctuation(input_text)
        input_text <- stripWhitespace(input_text)
        input_text <- tolower(input_text)
        wordcount <- str_count(input_text, '\\w+')
        # obtain the last three words for prediction
        if (wordcount > 3) {
                input_text <- word(input_text, -3, -1)
        }
        
        return(input_text)
}

predict_text <- function (input_text4) {
        pred4g <- filter(quadgram, stem == input_text4)
        pred <- pred4g$pred[1]
        if (is.na (pred)) {
                input_text3 <- word(input_text4, -2, -1)
                pred3g <- filter(trigram, stem == input_text3)
                pred <- pred3g$pred[1]
                if (is.na (pred)) {
                        input_text2 <- word(input_text4, -1)
                        pred2g <- filter(bigram, stem == input_text2)
                        pred <- pred2g$pred[1]
                        if (is.na (pred)) {
                                # If no previous words can be used to predict, then random
                                # generate a word base on the unigram density
                                pred <- as.character(sample(unigram$unigram, 1, prob = unigram$Freq))
                        }
                }
        }
        
        return (pred)
}