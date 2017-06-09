metrumApp <- function(...){
  
  if(!dir.exists('www')){
    dir.create('www')
  }
  
  filesToServeWithApp <- c("metrum-app.css",
                           "metrum-app.js",
                           "favicon.ico",
                           "metrum_new_logo.png",
                           "logo_m.png")
  
  for(file.i in c(filesToServeWithApp))
    
    file.copy(
      from = system.file(file.i, package = "shinymetrum"),
      to = "www"
    )
  
  shiny::tagList(
    shiny::tags$head(
      shiny::tags$meta(
        content="width=device-width, initial-scale=1.0",
        name="viewport"
      ),
      shiny::tags$link(
        rel = "shortcut icon",
        href = "favicon.ico"
      ),
      tags$link(rel="stylesheet", href = "metrum-app.css"),
      tags$script(src = "metrum-app.js")
    ),
    shiny::tags$div(
      shiny::tags$nav(
        class = "navbar navbar-fixed-top",
        shiny::tags$div(
          class = "container-fluid",
          shiny::tags$a(
            class = "navbar-brand",
            href = "http://metrumrg.com/",
            target = "_blank",
            shiny::tags$img(
              id = "metrum-logo",
              alt = "Metrum Research Group",
              src = "metrum_new_logo.png"
            )
          )
        )
      ),
      ...
    )
  )
}
