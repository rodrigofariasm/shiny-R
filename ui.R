#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(dplyr)
library(shiny)
ano.atual <- read.csv("ano-atual.csv")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Gastos das cotas federais dos deputados"),
  
  plotOutput('distPlot'),
  
  hr(),
  
  fluidRow(
    column(3,
           h4("Quer filtrar os gastos por estado?"),
           selectInput("estado",
                       label = "Escolha um estado",
                       choices =  c("Todos", "AC","AL","AP","AM","BA", "CE", "DF", "ES","GO", "MA", "MG",
                                    "MS","MT", "PA", "PB", "PE", "PI","PR","RJ", "RO",
                                    "RN", "RR","RS","SC", "SE", "SP", "TO"),
                       selected = "Todos"),
           br()
    ),
    h4("Quer filtrar os gastos por tipo de gasto?"),
    column(4,
           selectInput("despesa",
                       label = "Escolha uma despesa",
                       choices =  c("Todas",
                                    levels(factor(ano.atual$txtDescricao))) ,
                       selected = "Todos")
      )
  )
))
