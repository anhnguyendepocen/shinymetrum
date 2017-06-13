metrumApp <- function(..., logo_location = "img/metrum_new_logo.png"){
  
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
    
    fileTypeName.i <- file.path(filesToServe$type[i], 
                                filesToServe$name[i])
    
    
    # Check if file exists and remove
    if(file.exists(file.path("www", fileTypeName.i))){
      file.remove(
        file.path("www", fileTypeName.i) 
      )
    }
    
    file.copy(
      from = system.file(fileTypeName.i, package = "shinymetrum"),
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
      tags$link(rel="stylesheet", href = "css/metrum-app.css"),
      tags$script(src = "js/metrum-app.js")
    ),
    shiny::tags$img(
      id = "metrum-app-loading-image",
      style = " 
      position: absolute;
      left: 50%;
      top: 50%; 
      margin-left: -210px;
      margin-top: -100px;",
      alt = "Metrum Research Group",
      src = "img/metrum_new_logo.png"#
    ),
    shiny::tags$div(
      id = "metrum-app-content",
      style = "visibility:hidden;",
      shiny::tags$nav(
        class = "navbar navbar-default navbar-fixed-top",
        shiny::tags$div(
          class = "container-fluid",
          shiny::tags$img(
            class = "navbar-brand",
            id = "metrum-logo",
            alt = "Metrum Research Group",
            src = logo_location
          )
        )
      ),
      ...,
      shiny::tags$nav(
        class="navbar navbar-default navbar-fixed-bottom",
        id = "bottom-nav",
        style = 'display:none',
        shiny::tags$div(
          class = "container-fluid",
          shiny::tags$a(
            class = "navbar-brand",
            href = "http://metrumrg.com/",
            style ='transform: translateX(-50%); left: 50%; position: absolute;',
            target = "_blank",
            shiny::tags$img(
              alt = "Metrum Research Group",
              src = "img/metrum_new_logo.png"
            )
          )
        )
      )
    )
  )
}
