
library(shinythemes)
library(shiny)
source("source/nogas_ui.R")
source("source/nogas_server.R")
 
shinyApp(ui = nogas_ui, server = nogas_server)
