includeMetrum <- function(fileName, fileType){
  
  acceptableTypes <- c("js", "css")
  
  fileNameType <- paste0(fileName, ".", fileType)
  
  if(fileType == "js"){
    shiny::includeScript(
      system.file(
        fileNameType,
        package = "shinymetrum"
      )
    )
  } else if(fileType == "css"){
    shiny::includeCSS(
      system.file(
        fileNameType,
        package = "shinymetrum"
      )
    )
  } else {
    stop(paste0("File Type not in: ", paste(acceptableTypes, collapse = ", ")))
  }
}