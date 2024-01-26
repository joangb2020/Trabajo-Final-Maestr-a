#### Primeros Análisis ENSAYOS EK20203 SaberPro

library(readr)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(dplyr)
library(scales)
library(readxl)
library(data.table)
library(gridExtra)
library(viridis)
library(gsubfn)
install.packages("gsubfn")


Datos_EK20203_FA1 <- read_delim("C:/Users/Usuario/Desktop/Maestria2022/TrabajoDeGrado/Datos EK20203 FA1.txt", 
                       
                                         delim = "|", escape_double = FALSE, trim_ws = TRUE)
View(Datos_EK20203_FA1)

names(Datos_EK20203_FA1)


length(table(Datos_EK20203_FA1$CALIFICADOR.1)) # 444 Calificadores diferentes
sum(table(Datos_EK20203_FA1$NOTA.3) ) #585 Veces es necesario un tercer calificador
length(unique(Datos_EK20203_FA1$SNP))  #No hay SNP Repetidos

######################################################################################################################
######################################################################################################################
######################################################################################################################


train <- read_csv("C:/Users/Usuario/Desktop/Maestria2022/TrabajoDeGrado/NUEVOS_DATASETS/train.csv")
View(train)
str(train)
traindf <- as.data.frame(train)
traindt <- as.data.table(train)



nuevos_nombresFinal <- c("Titulo","ID","Nombres","Apellidos","Tipo_Documento","Num_Documento", "Tel", "Correo","InteresadoModuloCE", "Inconveniente","Descripcion_Inconveniente", "Tipo_Elemento", "Ruta_Acceso")
names(BaseFinal) <- nuevos_nombresFinal


#DIAGRAMAS DE TORTA


table(BaseFinal$InteresadoModuloCE, useNA = "if")

Basegroup <- BaseFinal %>% group_by(InteresadoModuloCE) %>% summarise (n = n()) %>% mutate("porcentaje"=n/sum(n))
Basegroup2 <- BaseFinal %>% group_by(Inconveniente) %>% summarise (n = n()) %>% mutate("porcentaje"=n/sum(n))


ggplot(Basegroup,aes(x="",y=porcentaje, fill=InteresadoModuloCE))+
  geom_bar(stat = "identity",
           color="white")+
  geom_text(aes(label=percent(porcentaje)),
            position=position_stack(vjust=0.7),color="white",size=5)+
  coord_polar(theta = "y") +
  theme_void()+
  labs(title="Interés en el Módulo de Comunicación Escrita")+
  theme(plot.title = element_text(hjust = 0.5))



ggplot(Basegroup2,aes(x="",y=porcentaje, fill=Inconveniente))+
  geom_bar(stat = "identity",
           color="white")+
  geom_text(aes(label=percent(porcentaje)),
            position=position_stack(vjust=0.7),color="white",size=5)+
  coord_polar(theta = "y") +
  theme_void()+
  labs(title="Presencia de Inconvenientes módulo CE") +
  theme(plot.title = element_text(hjust = 0.5))



#ANÁLISIS TEXTUAL https://rpubs.com/dsfernandez/649391*************************************************************
#install.packages("rsconnect")
library(tm)
library(SnowballC)
library(wordcloud2)
library(RColorBrewer)
library(RCurl)
library(XML)
library(rsconnect)
#install.packages("workcloud2")

# wordcloud function
rquery.wordcloud <- function(x, type=c("text", "url", "file"), 
                             lang="english", excludeWords=NULL, 
                             textStemming=FALSE, colorPalette="Dark2",
                             min.freq=3, max.words=200)
{ 
  library("tm")
  library("SnowballC")
  library("wordcloud")
  library("RColorBrewer") 
  
  if(type[1]=="file") text <- readLines(x)
  else if(type[1]=="url") text <- html_to_text(x)
  else if(type[1]=="text") text <- x
  
  # Load the text as a corpus
  docs <- Corpus(VectorSource(text))
  # Convert the text to lower case
  docs <- tm_map(docs, content_transformer(tolower))
  # Remove numbers
  docs <- tm_map(docs, removeNumbers)
  # Remove stopwords for the language 
  docs <- tm_map(docs, removeWords, stopwords(lang))
  # Remove punctuations
  docs <- tm_map(docs, removePunctuation)
  # Eliminate extra white spaces
  docs <- tm_map(docs, stripWhitespace)
  # Remove your own stopwords
  if(!is.null(excludeWords)) 
    docs <- tm_map(docs, removeWords, excludeWords) 
  # Text stemming
  if(textStemming) docs <- tm_map(docs, stemDocument)
  # Create term-document matrix
  tdm <- TermDocumentMatrix(docs)
  m <- as.matrix(tdm)
  v <- sort(rowSums(m),decreasing=TRUE)
  d <- data.frame(word = names(v),freq=v)
  # check the color palette name 
  if(!colorPalette %in% rownames(brewer.pal.info)) colors = colorPalette
  else colors = brewer.pal(8, colorPalette) 
  # Plot the word cloud
  set.seed(1234)
  wordcloud(d$word,d$freq, min.freq=min.freq, max.words=max.words,
            random.order=FALSE, rot.per=0.35, 
            use.r.layout=FALSE, colors=colors , scale=c(3,0.2))
  
  invisible(list(tdm=tdm, freqTable = d))
}
# html_to_text function

html_to_text<-function(url){
  library(RCurl)
  library(XML)
  # download html
  html.doc <- getURL(url)  
  #convert to plain text
  doc = htmlParse(html.doc, asText=TRUE)
  # "//text()" returns all text outside of HTML tags.
  # We also don’t want text such as style and script codes
  text <- xpathSApply(doc, "//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)]", xmlValue)
  # Format text vector into one character string
  return(paste(text, collapse = " "))
}


#require(devtools)
#install_github("lchiffon/wordcloud2")


res <- rquery.wordcloud(traindf$full_text, type ="text",
                        lang = "english",
                       excludeWords = c( "of", "for", "with", "the", "my", "you", "your", "at","on","in","by", "and", "or"),
                        textStemming = FALSE,
                        colorPalette = "Dark2",
                        min.freq = 4,
                        max.words = 200)

#save(Base2, file="baseArreglada.RData")
library(wordcloud2)
save(res, file="tablaFreq.RData")

a <-wordcloud2(res$freqTable)
library("htmlwidgets")

saveWidget(a,"tmp2Final.html",selfcontained = FALSE)


######################################################################################################################
######################################################################################################################
######################################################################################################################

sum(is.na(traindt)) #   No hay datos faltantes

sum(duplicated(traindt)) #No hay duplicados considerando todas las columnas

sum(duplicated(traindt[,'full_text'])) # No hay textos repetidos.

######################################################################################################################
######################################################################################################################
######################################################################################################################

shapiro.test(train$conventions)
shapiro.test(rnorm(100, mean = 5, sd = 3))




