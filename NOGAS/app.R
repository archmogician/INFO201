# Load libraries
library(shinythemes)
library(shiny)

# Load in ui, server, and codes for visualization
# set the directory on NOGAS folder.
source("source/nogas_ui.R")
source("source/nogas_server.R")
source("source/visuals.R")

# Run the app
shinyApp(ui = nogas_ui, server = nogas_server)
