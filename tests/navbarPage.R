library(datasets)
library(shiny)
library(shinymetrum)

ui <- 
  navbarPage(
    # title = "default style",
    metrumStyle(),
    tabPanel(
      title = "Example",
      tags$h2(
        "Telephones by region"
      ),
      fluidRow(
        column(
          width = 4,
          wellPanel(
            selectInput(
              "region",
              "Region:",
              choices = colnames(WorldPhones)
            ),
            helpText(
              "Data from AT&T (1961) The World's Telephones."
            )
          )
        ),
        column(
          width = 7,
          plotOutput("phonePlot")
        )
      )
    ),
    tabPanel(
      title = "Inputs",
      fluidRow(
        column(
          width = 3,
          offset = 1,
          br(),
          sliderInput(
            inputId = "slider_id",
            label = "Slider Input",
            value = 10,
            min = 5,
            max = 15
          ),
          br(),
          br(),
          numericInput(
            inputId = "numeric_id",
            label = "Numeric Input",
            value = 10
          ),
          br(),
          br(),
          actionButton(
            inputId = "button_id",
            label = "Button"
          )
        ),
        column(
          width = 3,
          br(),
          checkboxInput(
            inputId = "checkbox_id",
            label = "Checkbox"
          ),
          br(),
          br(),
          textInput(
            inputId = "text_id",
            label = "Text Input"
          ),
          br(),
          br(),
          radioButtons(
            inputId = "radiobuttons_id",
            label = "Radio Buttons",
            choices = c("A", "B", "C")
          )
        ),
        column(
          width = 3,
          br(),
          checkboxGroupInput(
            inputId = "checkboxgroup_id",
            label = "Checkbox Group",
            choices = c("Check A", "Check B", "Check C")
          ),
          br(),
          br(),
          selectInput(
            inputId = "selectInput_id",
            label = "Select Input",
            choices = c(
              "Select A",
              "Select B",
              "Select C"
            )
          )
        )
      )
    )
  )

server <- function(input, output) {
  
  # Example tab
  output$phonePlot <- renderPlot({
    barplot(
      WorldPhones[,input$region] * 1000, 
      main=input$region,
      ylab="Number of Telephones",
      xlab="Year"
    )
  })
  
  # Inputs tab
  observeEvent(input$slider_id, {
    message(input$slider_id)
  })
  observeEvent(input$numeric_id, {
    message(input$numeric_id)
  })
  observeEvent(input$button_id, {
    message(input$button_id)
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
}

shinyApp(ui = ui, server = server)
