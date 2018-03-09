library(shiny)

shinyServer(function(input, output) {
  data <- reactive({rbinom(input$x,input$N,input$p)})
  
  output$plot <- renderPlot({
    
    n<-input$N
    p<-input$p
    x<-input$x
    
    hist(data(), 
         main=paste('N = ', n, ',','p =',p, sep=''),xlab = "Ocurrencias",ylab = "Numero de experimentos",,freq=FALSE,col='skyblue',breaks=20)
    if (input$normal == TRUE){
      curve(dnorm(x,mean=n*p,sd = sqrt(n*p*(1-p))),add=TRUE)
    }
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$summary <- renderPrint({
    summary(data())
  })
  
  
  # Genera una tabla HTML para la visualizacion de la informacion
  output$table <- renderTable({
    data.frame(x=data())
  })
})