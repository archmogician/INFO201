# Load plotly here to avoid potential errors
library(plotly)
library(markdown)

# Introduction
intro_tab <- tabPanel(
  "Introduction",
  includeMarkdown("introduction.md")
)

# Vis page 1
attributes_trends <- tabPanel(
  "Trends of auto. attributes",
  titlePanel("Trends of automobile performance"),
  sidebarLayout(
    sidebarPanel(
      p("controls: Hover the graph for detailed info, click on legends
        to separate data, additional control on the top left corner")
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
  titlePanel("Trends of fuel efficient technology"),
  sidebarLayout(
    sidebarPanel(
      selectInput("choice", "Choose a technology", c("Engine",
                                                     "Transmission",
                                                     "Drivetrain"))
    ),
    mainPanel(
      plotlyOutput("vis2"),
      p("Research questions and findings"),
      textOutput("vis2_text")
    )
  )
)

# Vis page 3
emissions_trends <- tabPanel(
  "Trends of emissions",
  titlePanel("Trends of emissions from automobile"),
  sidebarLayout(
    sidebarPanel(
      p("controls: Hover the graph for detailed info, click on legends
        to separate data, additional control on the top left corner")
    ),
    mainPanel(
      plotlyOutput("vis3"),
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
  includeMarkdown("conclusions.md")

)

# About tech page 1
r_tab <- tabPanel(
  "R language",
  includeMarkdown("aboutr.md")
)

# About tech page2
report_tab <- tabPanel(
  "Technical report",
  titlePanel("Technical Report"),
  p(
    "This is out link to the",
    a("technical report",
      href = "https://github.com/xudav18/INFO201/wiki/Technical-Report"
    )
  )
)

# About tech page3
dataset_tab <- tabPanel(
  "Dataset",
  titlePanel("Datasets we used"),
  p("Source, data wrangling")
)

# About tech menu
about_tech_menu <- navbarMenu(
  "About the tech",
  report_tab,
  r_tab,
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
