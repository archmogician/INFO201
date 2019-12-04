# server function mainly for visualizations
nogas_server <- function(input, output) {
  output$vis1 <- renderPlotly(
    attributes_plot
  )
  output$vis2 <- renderPlotly(
    tech_plots(input$choice)
  )
  output$vis3 <- renderPlotly(
    emission_plot
  )
  output$vis2_text <- renderText(
    tech_findings(input$choice)
  )
}
