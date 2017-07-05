metrumApp <- function(..., logo_location = "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/metrum_new_logo.png", include_footer = TRUE){
  
  if(include_footer){
    
    metrumAppFooter <- 
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
              src = "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/metrum_new_logo.png"
            )
          )
        )
      )
  } else {
    metrumAppFooter <- shiny::tags$div()
  }
  
  shiny::tagList(
    shiny::tags$head(
      shiny::tags$meta(
        content="width=device-width, initial-scale=1.0",
        name="viewport"
      ),
      shiny::tags$link(
        rel = "shortcut icon",
        href = "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/favicon.ico"
      ),
      includeCSS("https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/css/metrum-app.css"),
      includeScript("https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/js/metrum-app.js")
    ),
    shiny::tags$img(
      id = "metrum-app-loading-image",
      alt = "Loading",
      src = logo_location
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
      metrumAppFooter
    )
  )
}
