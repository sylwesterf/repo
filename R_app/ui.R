#application showing alcohol consumption across some OECD countries
#plots the indicator for two countries and gives summary data
#data source: http://stats.oecd.org/

library(shiny)

#read data to load name of the countries
data <- read.csv("./data/alcohol_consumption.csv", sep=";")

shinyUI(pageWithSidebar(
  
  headerPanel("Alcohol consumption analysis"),
  
  sidebarPanel(

    #select two countries for comparison
    selectInput('x', 'Choose country:', names(data), selected = "Australia"),
    br(),
    selectInput('y', 'Choose country for comparison:', names(data), selected = "Canada"),   
    br(),
    br(),
    
    #add some description
    p(
      "According to the", em("Dietary Guidelines for Americans"), "moderate alcohol consumption is defined 
      as having up to 1 drink per day for women and up to 2 drinks per day for men. This definition 
      is referring to the amount consumed on any single day and is not intended as an average over 
      several days."
    ),
    br(), 
    p("The", em("Dietary Guidelines"), "also state that it is not recommended that anyone begin 
      drinking or drink more frequently on the basis of potential health benefits because moderate 
      alcohol intake also is associated with increased risk of breast cancer, violence, drowning, 
      and injuries from falls and motor vehicle crashes."
    ),
    br(),
    p("Source:", br(a("http://www.cdc.gov/alcohol/faqs.htm"))
    )
  ),

  #output plot and summary data
  mainPanel(
    h4("Plot:"),
    plotOutput('plot'),
    
    h4("Summary data:"),
    textOutput('name.x'),
    verbatimTextOutput('stat.x'),
    br(),
    textOutput('name.y'),
    verbatimTextOutput('stat.y'),
    br(),
    
    h6("Source: OECD, 2014", align = "right")
    
  )
))
