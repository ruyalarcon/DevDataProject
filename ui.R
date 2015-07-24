library(shiny) 
shinyUI(
  pageWithSidebar(
    headerPanel("Analyzing the exponential function"), 
    sidebarPanel(
      checkboxGroupInput("lines", "Add information", 
                         c("Show normal distribution" = "1",
                           "Show theoretical mean" = "2",
                           "Show mean" = "3")),
      numericInput('n', 'Number of exponentials', 40, min = 30, max = 60, step = 2),
      sliderInput('sims', 'Number of Simulations',value = 1000, min = 500, max = 10000, step = 500,) ),
    mainPanel( plotOutput('myHist')
    )
  ))