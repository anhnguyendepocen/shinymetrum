# 
# runArbJSUI <- function(input, output, session, jsCode) {
#   session$sendCustomMessage("arbJS", jsCode)
# }
# 
# runArbJS <- function(session, jsCode){
#   callModule(module = runArbJSUI, id = "runArbJS", session = session, jsCode = jsCode);
# }


shiny::shinyServer(
  function(input, output, session) {
    
    observeEvent(input$alertWindowT, {
      req(input$alertWindowT)
      # runArbJS(session, paste0("alert('", input$alertWindowT, "');"))
      session$sendCustomMessage("js", paste0("alert('", input$alertWindowT, "');"));
    })
    
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