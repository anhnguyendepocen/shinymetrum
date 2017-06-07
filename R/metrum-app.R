# metrumApp <- function(...){
#   
#   shiny::tagList(
#     shiny::tags$head(
#       metrumStyle(),
#       includeMetrum('metrum-js', 'js')
#     ),
#     shiny::tags$nav(
#       class = "navbar navbar-default navbar-static-top",
#       shiny::tags$div(
#         class = "container-fluid",
#         shiny::tags$div(
#           class = "navbar-header",
#           shiny::tags$span(
#             class = "navbar-brand"
#           )
#         )
#       )
#     ),
#     ...
#   )
#   
# }
metrumApp <- function(...){
  shiny::tagList(
    shiny::tags$head(
      shiny::tags$meta(
        content="width=device-width, initial-scale=1.0",
        name="viewport"
      ),
      shiny::tags$link(
        rel = "shortcut icon",
        href = "https://metrumrg-soft.s3.amazonaws.com/shinyapps/shinymetrum/favicon.ico"
      ),
      bootstrapLib(),
      includeMetrum("metrum-app", "css"),
      includeMetrum("metrum-js", "js")
    ),
    shiny::tags$header(
      shiny::tags$nav(
        class = "navbar navbar-fixed-top",
        shiny::tags$div(
          class = "container-fluid",
          shiny::tags$div(
            class = "navbar-header",
            shiny::tags$a(
              class = "navbar-brand",
              href = "http://metrumrg.com/",
              target = "_blank",
              shiny::tags$img(
                alt = "Metrum Research Group",
                src = "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/logoDark.png",
                height = "150%"
              )
            )
          )
        )
      )
    ),
    ...
  )
}
