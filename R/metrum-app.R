metrumApp <- function(...){
  
  filesToServe <- 
    data.frame(
      type = c("css",
               "js",
               "img",
               "img",
               "img"),
      name = c("metrum-app.css",
               "metrum-app.js",
               "favicon.ico",
               "metrum_new_logo.png",
               "logo_m.png")
    )
  
  
  
  if(!dir.exists('www')){
    dir.create('www')
  }
  
  for(i in 1:nrow(filesToServe)){
    
    if(!dir.exists(file.path('www', filesToServe$type[i]))){
      dir.create(file.path('www', filesToServe$type[i]))
    }
    
    file.copy(
      from = system.file(
        file.path(filesToServe$type[i], 
                  filesToServe$name[i]),
        package = "shinymetrum"
      ),
      to = file.path("www", filesToServe$type[i])
    )
  }
  
  shiny::tagList(
    shiny::tags$head(
      shiny::tags$meta(
        content="width=device-width, initial-scale=1.0",
        name="viewport"
      ),
      shiny::tags$link(
        rel = "shortcut icon",
        href = "img/favicon.ico"
      ),
      tags$link(rel="stylesheet", href = "css/metrum-app.css")# ,
      # tags$script(src = "js/metrum-app.js")
    ),
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
            src = "img/metrum_new_logo.png"
          )
        )
      )
    ),
    ...,
    shiny::tags$nav(
      class="navbar navbar-default",
      style = 'margin-bottom:0;',
      shiny::tags$div(
        class = "container-fluid",
        shiny::tags$a(
          class = "navbar-brand",
          href = "http://metrumrg.com/",
          style ='transform: translateX(-50%); left: 50%; position: absolute;padding-top:0;',
          target = "_blank",
          "Powered by ",
          shiny::tags$img(
            style = "height: 75%; padding-bottom: 5px;",
            alt = "Metrum Research Group",
            src = "img/metrum_new_logo.png"
          )
        )
      )
    )
  )
}
