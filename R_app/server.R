library(shiny)

data <- read.csv("./data/alcohol_consumption.csv", sep=";")
year <- 1960:2013
rownames(data) <- year

shinyServer(
  function(input, output) {
    
    output$plot <- renderPlot({
      plot(year, data[,input$x], 
           type="s", xlab = "Year", ylab = "Alcohol consumption (liters per capita)", 
           col="blue", lwd = 3, ylim = c(1,21), 
           main = paste("Alcohol consumption in", input$x, "and", input$y))
      
      lines(year, data[,input$y], col="red", lwd = 2)
      
      legend(2004,21,
             c(input$x,input$y),
             lty=c(1,1),
             lwd=c(2.5,2.5),col=c("blue","red")
             )    
    })
    
  }
)
