library(ggplot2)
library(dplyr)
library(shiny)
library(shinymetrum)

ui <-
  navbarPage(
    # title = "Default",
    metrumStyle(),
    tabPanel(
      "inputs",
      fluidRow(
        column(
          width = 3,
          offset = 1,
          sliderInput(
            inputId = "slider_id",
            label = "Slider Input Example",
            value = 10,
            min = 5,
            max = 15
          ),
          numericInput(
            inputId = "numeric_id",
            label = "Sample Size",
            value = 10
          ),
          actionButton(
            inputId = "button_id",
            label = "Button"
          )
        ),
        column(
          width = 3,
          checkboxInput(
            inputId = "checkbox_id",
            label = "Checkbox example"
          ),
          textInput(
            inputId = "text_id",
            label = "Example"
          ),
          radioButtons(
            inputId = "radiobuttons_id",
            label = "RadioButtons",
            choices = c("A", "B", "C")
          )
        ),
        column(
          width = 3,
          checkboxGroupInput(
            inputId = "checkboxgroup_id",
            label = "Checkbox group example",
            choices = c("Check A", "Check B", "Check C")
          ),
          selectInput(
            inputId = "selectInput_id",
            label = "Example Select",
            choices = c("Select A", "Select B", "Select C")
          )
        )
      )
    ),
    tabPanel(
      "Card",
      fluidRow(
        column(
          width = 10,
          offset = 1,
          wellPanel(
            tags$h3("Metrum Research Plots"),
            plotOutput('plot_out'),
            plotOutput('plot_out2'),
            plotOutput('plot_out3')
          )
        )
      )
    )
  )


server <- function(input, output){
  plot_data <- reactive({
    input$randomize
    mtcars[sample(1:nrow(mtcars), input$numeric_id), ]
  })
  
  observeEvent(input$slider_id, {
    message(input$slider_id)
  })
  observeEvent(input$numeric_id, {
    message(input$numeric_id)
  })
  observeEvent(input$randomize,{
    message(input$randomize)
  })
  observeEvent(input$checkbox_id, {
    message(input$checkbox_id)
  })
  observeEvent(input$text_id, {
    message(input$text_id)
  })
  observeEvent(input$radiobuttons_id, {
    message(input$radiobuttons_id)
  })
  observeEvent(input$checkboxgroup_id, {
    message(input$checkboxgroup_id)
  })
  observeEvent(input$selectInput_id, {
    message(input$selectInput_id)
  })
  
  
  
  output$plot_out <- renderPlot({
    plot_data() %>%
      group_by(
        cyl
      ) %>%
      summarise(
        mean_mpg = mean(mpg)
      ) %>%
      ggplot(
        aes(
          x = cyl,
          y = mean_mpg,
          fill = as.factor(cyl)
        )
      ) +
      geom_bar(
        stat = "identity",
        alpha = .75
      )
  })
  
  output$plot_out2 <- renderPlot({
    ggplot(
      plot_data(),
      aes(
        x = mpg
      )
    ) +
      geom_density(
        alpha = .5,
        fill = 'green'
      )
  })
  output$plot_out3 <- renderPlot({
    ggplot(
      plot_data(),
      aes(
        x = wt,
        y = mpg
      )
    ) +
      geom_point(
        alpha = 1
      ) +
      geom_smooth(
        method = "lm",
        se = FALSE,
        color = 'red'
      )
  })
}

shinyApp(ui = ui, server = server)
