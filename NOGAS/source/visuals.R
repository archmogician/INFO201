# Load libraries
library(dplyr)
library(plotly)

attributes_df <- read.csv("data/attributes.csv",
                          stringsAsFactors = FALSE)

emmision_df <- read.csv("data/emmision.csv",
                        stringsAsFactors = FALSE)

pollutants_df <- read.csv("data/pollutants.csv",
                          stringsAsFactors = FALSE)

air_quality_df <- full_join(emmision_df,pollutants_df, by = "year") %>%
  arrange(year)
  


attributes_df$mpg_percent <- attributes_df$mpg / max(attributes_df$mpg)
attributes_df$weight_percent <- attributes_df$weight /
  max(attributes_df$weight)
attributes_df$hp_percent <- attributes_df$hp / max(attributes_df$hp)
attributes_df$zero_60_percent <- attributes_df$zero_60 /
  max(na.rm = TRUE, attributes_df$zero_60)
attributes_df$co2_percent <- attributes_df$co2 / max(attributes_df$co2)

attributes_plot <- plot_ly(data = attributes_df) %>%
  add_trace(
    x = ~year,
    customdata = ~mpg,
    y = ~mpg_percent,
    name = "MPG",
    type = 'scatter',
    mode = 'lines',
    hovertemplate = 'Year: %{x}<br>MPG: %{customdata:.1f}<extra></extra>'
  ) %>%
  add_trace(
    customdata = ~weight,
    x = ~year,
    y = ~weight_percent,
    name = "Weight(lbs)",
    type = 'scatter',
    mode = 'lines',
    hovertemplate = 'Year: %{x}<br>Weight(lbs): %{customdata:.1f}<extra></extra>'
  ) %>%
  add_trace(
    customdata = ~hp,
    x = ~year,
    y = ~hp_percent,
    name = "Horsepower",
    type = 'scatter',
    mode = 'lines',
    hovertemplate = 'Year: %{x}<br>Horsepower: %{customdata:.1f}
    <extra></extra>'
  ) %>%
  add_trace(
    customdata = ~zero_60,
    x = ~year,
    y = ~zero_60_percent,
    name = "0 to 60mph(s)",
    type = 'scatter',
    mode = 'lines',
    hovertemplate = 'Year: %{x}<br>0 to 60mph(s): %{customdata:.1f}
    <extra></extra>'
  ) %>%
  add_trace(
    customdata = ~co2,
    x = ~year,
    y = ~co2_percent,
    name = "CO2(g/mile)",
    type = 'scatter',
    mode = 'lines',
    hovertemplate = 'Year: %{x}<br>CO2 per mile(g/mi): %{customdata:.1f}
    <extra></extra>'
  ) %>%
  layout(
    title = "Automotive Attributes vs. Years",
    yaxis = list(
      tickformat = "%",
      title = "Percentage"
  )
)

select_type<- function(auto_type) {
  filter(df2, type == auto_type)
}

graph2 <- plot_ly(
  data = df2,
  x = ~select_type("sedan/wagon")$year,
  y = ~select_type("sedan/wagon")$share,
  name = 'Sedan/wagon',
  type = 'scatter',
  mode = 'none',
  stackgroup = 'one',
  groupnorm = 'percent',
  fillcolor = '#F5FF8D') %>%
  add_trace(y = ~select_type("car_suv")$share,
            name = 'Car SUV',
            fillcolor = '#50CB86') %>%
  add_trace(y = ~select_type("truck_suv")$share,
            name = 'Truck SUV', fillcolor = '#4C74C9') %>%
  add_trace(y = ~select_type("van/minivan")$share,
            name = 'Van/minivan', fillcolor = '#700961') %>%
  add_trace(y = ~select_type("pickup")$share,
            name = 'Pickup', fillcolor = '#312F44') %>%
  layout(title = 'Market of different automobile types',
         xaxis = list(title = "Years",
                      showgrid = FALSE),
         yaxis = list(title = "Percentage of the market",
                      showgrid = FALSE,
                      ticksuffix = '%'))

