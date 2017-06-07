metrumJS <- function(session, code){
  session$sendCustomMessage(type = "metrumJS", message = code)
}
