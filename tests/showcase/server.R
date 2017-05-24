function(input, output) {
  
  # Data tab ----------------------------
  selected_data <- reactive({
    app_data %>% 
      filter(
        model %in% input$carModels
      )
  })
  
  output$selectedData <- renderDataTable({
    selected_data() %>% 
      datatable(
        rownames = FALSE,
        class = 'display compact cell-border'
      )
  })
  
  # Visualization tab -------------------
  output$selectedDataPlot <- renderPlot({
    selected_data() %>% 
      ggplot(
        aes(
          x = mpg,
          group = cyl,
          fill = cyl
        )
      ) +
      geom_density(
        alpha = .7
      )
  })
}



