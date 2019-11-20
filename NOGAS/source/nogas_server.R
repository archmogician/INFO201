nogas_server <- function(input, output) {
  output$vis1 <- renderPlotly(
    graph1
  )
}