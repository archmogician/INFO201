# Load plotly here to avoid protential errors
library(plotly)

# Introduction
intro_tab <- tabPanel(
  "Introduction",
  titlePanel("Problem situation"),
  p("While rapid industrialization has improved our standard
    of living significantly, the pollution it produces has 
    detrimental effects on societies and ecosystems on a global 
    scale. Additionally, because of the widespread implementation
    of newfound technology, such as the invention of cars, almost
    every person on this planet not only contributes but is affected
    by this issue on a daily basis, making them a direct stakeholder"),
  hr(),
  h2("Research questions"),
  p("1.How has fuel efficiency and other attributes of automotive in the U.S.
    changed over time?"),
  p("2. What kind of correlation exists between the change in automotive technology and their 
    fuel efficiency and attributes?"),
  p("3. Are there any comparisons that can be made with fuel efficiency and the air quality?")
)

# Vis page 1
attributes_trends <- tabPanel(
  "Trends of cars' performance",
  titlePanel("Trends of automobile performance"),
  sidebarLayout(
    sidebarPanel(
      p("controls: Hover the graph for detai info, click on legends
        to seperate data, additional control on the top left corner")
    ),
    mainPanel(
      plotlyOutput("vis1"),
      p("Research questions and findings "),
      p("We can see that fuel efficiency improved, etc")
    )
  )
)

# Vis page 2
tech_trends <- tabPanel(
  "Trends of technology",
  titlePanel("Trends of fuel efficent technology"),
  sidebarLayout(
    sidebarPanel(
      selectInput("choice", "Choose a technology", c('Engine'))
    ),
    mainPanel(
      plotlyOutput("vis2"),
      p("Research questions and findings "),
      p("We can see that technology")
    )
  )
)

# Vis page 3
emissions_trends <- tabPanel(
  "Trends of emmissions",
  titlePanel("Trends of emmisions from automobile"),
  sidebarLayout(
    sidebarPanel(
      p("controls")
    ),
    mainPanel(
      p("Plot"),
      p("Research questions and findings "),
      p("We can see that technology")
    )
  )
)

# Vis menu
visual_menu <- navbarMenu(
  "Visualizations",
  attributes_trends,
  tech_trends,
  emissions_trends
)

# Conclusion page
conclusion_tab <- tabPanel(
  "Conclusions",
  titlePanel("Conclusions of our findings"),
  p("Base on our findings, we concluded that")
)

# About tech page1
R_tab <- tabPanel(
  "R language",
  titlePanel("Use of R language"),
  p("We uses shiny, dplr, etc")
)

# About tech page2
report_tab <- tabPanel(
  "Technical report",
  titlePanel("Technical Report"),
  p("This is out link to the",
    a("technical report",
      href = "https://github.com/xudav18/INFO201/wiki/Technical-Report"))
)

# About tech page3
dataset_tab <- tabPanel(
  "Dataset",
  titlePanel("Datasets we used"),
  p("Source, data wrangleing")
)

# About tech menu
about_tech_menu <- navbarMenu(
  "About the tech",
  R_tab,
  report_tab,
  dataset_tab
)

# About team page
about_team_tab <- tabPanel(
  "About us",
  titlePanel("Information of our team"),
  p("Project Code Name:NOGAS"),
  p("Team Members:Ye Ju Kim, David Xu,
  Kevin Zhao, Talin Hans"),
  p("Affiliation:
    Info-201: Technical Foundations of Informatics
    The Information School
    University of Washington
    Autumn 2019")
)

# the ui function with navigation bar
nogas_ui <- navbarPage(
  # using shinytheme
  theme = shinytheme("cosmo"),
  "Project: NOGAS",
  intro_tab,
  visual_menu,
  conclusion_tab,
  about_tech_menu,
  about_team_tab
)