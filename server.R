library(shiny) 
library(UsingR)
library(manipulate) 
library(ggplot2)

lambda = 0.2
mns = NULL

shinyServer( 
  function(input, output) {
    output$myHist <- renderPlot({

      n <- input$n
      l <- input$lines
      sim <- input$sims
      
      for (i in 1 : sim) mns = c(mns, mean(rexp(n, lambda)))

      m = mean(mns)
      tm = 1/lambda
      sd = sd(mns)
      tsd = (1/lambda)/sqrt(40)
      
      g <- ggplot(data.frame(mns), aes(x =mns))
      g <- g + geom_histogram(aes(y=..density..), colour="black", fill = "white", binwidth = 0.3)
      g <- g + geom_density(colour="blue", size=1)
      if (!is.null(l)) {
        if ("1" %in% l)
          g <- g + stat_function(fun = dnorm, arg = list(mean = tm,sd = sd(mns)))
        if ("2" %in% l)
          g <- g + geom_vline(xintercept = tm, colour="green", linetype="longdash")
        if ("3" %in% l)
          g <- g + geom_vline(xintercept = m, colour="red", linetype="longdash")
      }
      print(g)
      
    })
  } )