shiny::shinyServer(
  function(input, output) {
    output$phonePlot <- shiny::renderPlot({
      barplot(
        datasets::WorldPhones[,input$region]*1000, 
        main=input$region,
        ylab="Number of Telephones",
        xlab="Year"
      )
    })
  }
)