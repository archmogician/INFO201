# Load libraries
library(dplyr)
library(plotly)

# df for first visual
attributes_df <- read.csv("data/attributes.csv",
  stringsAsFactors = FALSE
)
# df for the second visual
auto_tech_df <- read.csv("data/auto_tech.csv",
  stringsAsFactors = FALSE
)
# third visual part1
emmision_df <- read.csv("data/emmision.csv",
  stringsAsFactors = FALSE
)
# third visual part2
pollutants_df <- read.csv("data/pollutants.csv",
  stringsAsFactors = FALSE
)
# third visual df combined
air_quality_df <- full_join(emmision_df, pollutants_df, by = "year") %>%
  arrange(year)


# data wrangleing for vis 1
attributes_df$mpg_percent <- attributes_df$mpg / max(attributes_df$mpg)
attributes_df$weight_percent <- attributes_df$weight /
  max(attributes_df$weight)
attributes_df$hp_percent <- attributes_df$hp / max(attributes_df$hp)
attributes_df$zero_60_percent <- attributes_df$zero_60 /
  max(na.rm = TRUE, attributes_df$zero_60)
attributes_df$co2_percent <- attributes_df$co2 / max(attributes_df$co2)

# vis1
attributes_plot <- plot_ly(data = attributes_df) %>%
  add_trace(
    x = ~year,
    customdata = ~mpg,
    y = ~mpg_percent,
    name = "MPG",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>MPG: %{customdata:.1f}<extra></extra>"
  ) %>%
  add_trace(
    customdata = ~weight,
    x = ~year,
    y = ~weight_percent,
    name = "Weight(lbs)",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>Weight(lbs): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~hp,
    x = ~year,
    y = ~hp_percent,
    name = "Horsepower",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>Horsepower: %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~zero_60,
    x = ~year,
    y = ~zero_60_percent,
    name = "0 to 60mph(s)",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>0 to 60mph(s): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~co2,
    x = ~year,
    y = ~co2_percent,
    name = "CO2(g/mile)",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>CO2 per mile(g/mi): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  layout(
    title = "Automotive Attributes vs. Years",
    yaxis = list(
      tickformat = "%",
      title = "Percentage"
    )
  )


# Choosing the right sub plot for vis 2
tech_plots <- function(type) {
  if (type == "Engine") {
    tech_plot_engine
  } else if (type == "Transmission") {
    "p(graph2)"
    # df <- auto_tech_df[,c(1,8:13)]
  } else {
    "p(graph2)"
    # df <- auto_tech_df[,c(1,14:16)]
  }
}

# Engine tech plot
tech_plot_engine <- plot_ly(
  data = auto_tech_df[, 1:7],
  x = ~year,
  y = ~carb,
  name = "Carburetor",
  type = "scatter",
  mode = "none",
  stackgroup = "one",
  groupnorm = "percent",
  fillcolor = "#F5FF8D"
) %>%
  add_trace(
    y = ~gdi,
    name = "Gas. direct injection",
    fillcolor = "#50CB86"
  ) %>%
  add_trace(
    y = ~port,
    name = "Port injection",
    fillcolor = "#4C74C9"
  ) %>%
  add_trace(
    y = ~tbi,
    name = "Throttle body injection",
    fillcolor = "#700961"
  ) %>%
  add_trace(
    y = ~electric,
    name = "Electric",
    fillcolor = "red"
  ) %>%
  add_trace(
    y = ~fcv,
    name = "Fuel cell eletric",
    fillcolor = "black"
  ) %>%
  layout(
    title = "Market Shares of Different Engine Technology",
    xaxis = list(
      title = "Years",
      showgrid = FALSE
    ),
    yaxis = list(
      title = "Percentage of the market",
      showgrid = FALSE,
      ticksuffix = "%"
    )
  )
