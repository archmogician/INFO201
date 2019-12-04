# Load plotly here to avoid potential errors
library(plotly)
library(markdown)

# Introduction
intro_tab <- tabPanel(
  "Introduction",
  includeMarkdown("source/introduction.md")
)

# Vis page 1
attributes_trends <- tabPanel(
  "Trends of auto. performance",
  titlePanel("Trends of automobile performance"),
  sidebarLayout(
    sidebarPanel(
      p("controls: Hover the graph for detailed info, click on legends
        to separate data, additional control on the top left corner")
    ),
    mainPanel(
      plotlyOutput("vis1"),
      h4("Research question:"),
      p("How has fuel efficiency and other attributes of automotive in the
        U.S. changed over time?"),
      h4("Findings"),
      p("Base on the graph, we could see a few trends among automotive
      attributes from 1975. From 1975 to early 1980, the fuel economy
      increased dramatically. However, the increase MPG came at the costs
      of engine power and weight. Combine this observation and the oil
      crisis during that period", a("[1]", href =
      "https://en.wikipedia.org/wiki/1970s_energy_crisis"), "We infer that
      the car manufactures scrambled to lower weight and engine power to
      achieve a high fuel efficiency. Then, the weight and engine power
      started to recover while MPG increased slightly. Base on our
      observation from the second visualization page--the market share
      of automotive technology,  we conclude that new technology was
      developed to increase the engine performance without costing a
      heavy toll on the fuel economy. Engine power, car weight, and
      acceleration continued to increase throughout the 90s, however,
      the fuel economy was decreasing at a relatively slow rate, about
      3% every 5 years. Then around 2005, things changed once again.
      The weight started to level out, engine power and acceleration
      continued to increase, while fuel economy started to climb up
      once again at a relatively quick rate, around 10% each 5 years.
      We infer that new technology played an important role in this
      change, and this trend is likely to be continued into the future.")
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
      htmlOutput("vis2_text")
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
  includeMarkdown("source/conclusions.md")

)

# About tech page 1
r_tab <- tabPanel(
  "Usage of R",
  includeMarkdown("source/aboutr.md")
)

# About tech page2
report_tab <- tabPanel(
  "Technical Report",
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
  "Dataset Usage",
  includeMarkdown("datasets.md")
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
  "About Us",
  includeMarkdown("teamabout.md")
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
