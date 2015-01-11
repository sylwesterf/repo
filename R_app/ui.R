library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Alcohol consumption analysis"),
  
  sidebarPanel(
    
    selectInput('x', 'Choose country:', names(data), selected = "Australia"),
    br(),
    selectInput('y', 'Choose country for comparison:', names(data), selected = "Canada")
    
  ),
  
  mainPanel(
    plotOutput('plot'),
    h6("Source: OECD, 2014", align = "right")
  )
))