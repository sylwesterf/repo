#application showing alcohol consumption across some OECD countries
#plots the indicator for two countries and gives summary data
#data source: http://stats.oecd.org/

library(shiny)

#load data
data <- read.csv("./data/alcohol_consumption.csv", sep=";")

#create year vector
year <- 1960:2013
rownames(data) <- year

shinyServer(
  function(input, output) {

    #create plot of first country's alcohol consumption
    output$plot <- renderPlot({
      plot(year, data[,input$x], 
           type="s", xlab = "Year", ylab = "Alcohol consumption (liters per capita)", 
           col="blue", lwd = 3, ylim = c(1,21), 
           main = paste("Alcohol consumption in", input$x, "and", input$y))

      #add line for second country values
      lines(year, data[,input$y], col="red", lwd = 2)

      #legend adjusted to web version of app
      legend(2004,21,
             c(input$x,input$y),
             lty=c(1,1),
             lwd=c(2.5,2.5),col=c("blue","red")
             )    
    })
    
    #output summary data for first country
    output$stat.x <- renderPrint({
      summary(data[, input$x])      
    })
    
    #output summary data for second country    
    output$stat.y <- renderPrint({
      summary(data[, input$y])     
    })

    #output name for first country
    output$name.x <- renderText({
      input$x     
    })
    
    #output name for second country
    output$name.y <- renderText({
      input$y     
    })
    
  }
)
