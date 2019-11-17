intro_tab <- tabPanel(
  "Introduction",
  titlePanel("Problem situation"),
  p("abc"),
  hr(),
  h2("Research questions"),
  p("1."),
  p("2.")
)

performance_trends <- tabPanel(
  "Trends of cars' performance",
  titlePanel("Trends of automobile performance"),
  sidebarLayout(
    sidebarPanel(
      p("controls")
    ),
    mainPanel(
      p("plot"),
      p("Research questions and findings")
    )
  )
)

tech_trends <- tabPanel(
  "Trends of technology",
  titlePanel("Trends of fuel efficent technology")
)

emissions_trends <- tabPanel(
  "Trends of emmissions",
  titlePanel("Trends of emmisions from automobile")
)

visual_menu <- navbarMenu(
  "Visualizations",
  performance_trends,
  tech_trends,
  emissions_trends
)

conclusion_tab <- tabPanel(
  "Conclusions",
  titlePanel("Conclusions of our findings")
)

about_tech_tab <- tabPanel(
  "About the tech",
  titlePanel("Technology we used"),
  p("This is out link to the", a("technical report", href = ""))
)

about_team_tab <- tabPanel(
  "About us",
  titlePanel("Information of our team")
)

nogas_ui <- navbarPage(
  theme = shinytheme("cosmo"),
  "Project: NOGAS",
  intro_tab,
  visual_menu,
  conclusion_tab,
  about_tech_tab,
  about_team_tab
)