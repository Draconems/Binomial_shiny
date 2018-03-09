library(shiny)

#INTERFACE DE USUARIO

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Aplicacion Binomial"),
  
  sidebarPanel(
    sliderInput("p", "Probabilidad. (p)", 
                min=0, max=1, value=0.5, step = 0.05),
    
    
    
    sliderInput("N", "Numero de ensayos. (n)", 
                min=10, max=100, value=1),
    
    
    
    sliderInput("x", "Numero de experimentos. (x)", 
                value = 5,min = 1, max = 100),
    
    checkboxInput("normal", "Activar la curva Normal", FALSE)
    
    
  ),
  
  
  
  
  mainPanel(
    tabsetPanel(
      tabPanel("Grafica", plotOutput("plot")), 
      tabPanel("Resumen", verbatimTextOutput("summary")), 
      tabPanel("Tabla", tableOutput("table"))
    )
  )
))