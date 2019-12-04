# Load libraries
library(dplyr)
library(markdown)
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

# vis1 -- comparing trends in automotive attributes.
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
    tech_plot_trans
  } else {
    tech_plot_drive
  }
}

# Choosing the right texts for the right vis2 graph.
tech_findings <- function(type) {
  if (type == "Engine") {
    text <- "<p>There are 2 noticeable changes of trends in this graph regarding
             engine technologies. One happened around mid 80s, when carburetor
             started to phase out, and port injection and throttle body
             injection began to gain huge market shares. Another one was around
             late 2000s, when direct injection began to rise in popularity.
             These 2 findings correlate to the trends we observed in the first
            visualization, the trends of automotive attributes.</p>"
  } else if (type == "Transmission") {
    text <- "<p>There are 2 noticeable changes of trends in this graph regarding
             transmission technology as well. One happened around mid 80s,
             when automatic without lock up feature started to phase out,
             manual started to decrease, and automatic with lock up started
             its way of gaining huge market shares. Another one was around
             2000s, when continuously variable transmission began to gain
             market shares. These 2 findings correlate to the trends we
             observed in the first visualization, the trends of automotive
             attributes</p>"
  } else {
    text <- "<p>From this graph, we could see that the front wheel drivetrain
             occupied a large market shares, and FWD vehicles generally have
             better fuel economy <a href=\"https://www.usautosales.info/blogs
             /1924/the-perfect-car/front-wheel-drive-vs-rear-wheel-drive/\">
             [2]</a>. The gaining popularity of all wheel drive vehicles in
             recent years shows that despite the slightly poor fuel efficiency
             associated with AWD, the improvement in technology is likely to
             continue to offset the negativity of AWD systems.</p>"
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

# Transmission tech plot
tech_plot_trans <- plot_ly(
  data = auto_tech_df[, c(1, 8:13)],
  x = ~year,
  y = ~manual,
  name = "Manual",
  type = "scatter",
  mode = "none",
  stackgroup = "one",
  groupnorm = "percent",
  fillcolor = "#F5FF8D"
) %>%
  add_trace(
    y = ~auto_lockup,
    name = "Automatic w/ lockup",
    fillcolor = "#50CB86"
  ) %>%
  add_trace(
    y = ~auto_nolock,
    name = "Automatic w/o lockup",
    fillcolor = "#4C74C9"
  ) %>%
  add_trace(
    y = ~cvt_hybrid,
    name = "CVT w/ Hybrid Engine",
    fillcolor = "#700961"
  ) %>%
  add_trace(
    y = ~cvt,
    name = "CVT w/o Hybrid Engine",
    fillcolor = "red"
  ) %>%
  add_trace(
    y = ~other,
    name = "Other",
    fillcolor = "black"
  ) %>%
  layout(
    title = "Market Shares of Different Transmission Technology",
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

# Drivetrain tech plot
tech_plot_drive <- plot_ly(
  data = auto_tech_df[, c(1, 14:16)],
  x = ~year,
  y = ~fwd,
  name = "Front Wheel Drive",
  type = "scatter",
  mode = "none",
  stackgroup = "one",
  groupnorm = "percent",
  fillcolor = "#F5FF8D"
) %>%
  add_trace(
    y = ~rwd,
    name = "Rear Wheel Drive",
    fillcolor = "#50CB86"
  ) %>%
  add_trace(
    y = ~awd,
    name = "All Wheel Drive",
    fillcolor = "#700961"
  ) %>%
  layout(
    title = "Market Shares of Different Drivetrain Technology",
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

# Compute percentage from the earlist available year.
compute_per_change <- function(col) {
  result <- c()
  i <- 1
  x <- col
  base <- NA
  for (val in x) {
    current <- x[i]
    if (is.na(base) & !is.na(current)) {
      base <- current
    }
    value <- (current - base) / base
    i <- i + 1
    result <- append(result, value)
  }
  return(result)
}

# Adding percent change columns to the dataframe for vis3.
air_quality_df$co_change <- compute_per_change(air_quality_df$co)
air_quality_df$nox_change <- compute_per_change(air_quality_df$nox)
air_quality_df$pm10_change <- compute_per_change(air_quality_df$pm10)
air_quality_df$pm2.5_change <- compute_per_change(air_quality_df$pm2.5)
air_quality_df$so2_change <- compute_per_change(air_quality_df$so2)
air_quality_df$voc_change <- compute_per_change(air_quality_df$voc)
air_quality_df$nh3_change <- compute_per_change(air_quality_df$nh3)

# Vis3 -- line graph comparing percent changes.
emission_plot <- plot_ly(data = air_quality_df) %>%
  add_trace(
    x = ~year,
    y = ~miles,
    name = "Vehicles Miles Traveled",
    type = "scatter",
    mode = "lines",
    connectgaps = TRUE,
    hovertemplate = "Year: %{x}<br>Miles traveled percent change: %{y:.2f}
                    <extra></extra>"
  ) %>%
  add_trace(
    x = ~year,
    y = ~population,
    name = "Population",
    type = "scatter",
    mode = "lines",
    connectgaps = TRUE,
    hovertemplate = "Year: %{x}<br>Population percent change: %{y:.2f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~co,
    x = ~year,
    y = ~co_change,
    name = "Carbon Monoxide",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>CO: %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~nox,
    x = ~year,
    y = ~nox_change,
    name = "Nitrogen Oxides",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>NOx(thousands of tons): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~pm10,
    x = ~year,
    y = ~pm10_change,
    name = "PM10",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>PM 10(thousands of tons): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~pm2.5,
    x = ~year,
    y = ~pm2.5_change,
    name = "PM2.5",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>PM 2.5(thousands of tons): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~so2,
    x = ~year,
    y = ~so2_change,
    name = "Sulfur dioxide",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>SO2(thousands of tons): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~voc,
    x = ~year,
    y = ~voc_change,
    name = "Volatile organic compounds",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>VOC(thousands of tons): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  add_trace(
    customdata = ~nh3,
    x = ~year,
    y = ~nh3_change,
    name = "Ammonia",
    type = "scatter",
    mode = "lines",
    hovertemplate = "Year: %{x}<br>NH3(thousands of tons): %{customdata:.1f}
    <extra></extra>"
  ) %>%
  layout(
    title = "Percent changes of growth and pollutants",
    yaxis = list(
      tickformat = "%",
      title = "Percent Change"
    )
  )