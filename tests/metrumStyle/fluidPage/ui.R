shiny::shinyUI(
  shiny::fluidPage(
    tags$script(
      
      '
$(document).ready(function(){
             Shiny.addCustomMessageHandler("arbJS",
                function(arbJSCode) {
                   eval(arbJSCode);
                });
                  })
                '
    ),
    shiny::tags$h2("Telephones by region"),
    shiny::fluidRow(
      shiny::column(
        width = 4,
        shiny::wellPanel(
          shiny::selectInput(
            "region", "Region:", 
            choices=colnames(datasets::WorldPhones)
          ),
          shiny::helpText("Data from AT&T (1961) The World's Telephones."),
          textInput('alertWindowT', 'Alert')
        )
      ),
      shiny::column(
        width = 7,
        shiny::plotOutput("phonePlot")
      )
    )
  )
)
