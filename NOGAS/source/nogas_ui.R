# Load plotly here to avoid protential errors
library(plotly)

# Introduction
intro_tab <- tabPanel(
  "Introduction",
  titlePanel("Problem situation"),
  p('While rapid industrialization has improved our standard of living
    significantly, the pollution it produces has detrimental effects on
    societies and ecosystems on a global scale. Additionally, because of
    the widespread implementation of newfound technology, such as the
    invention of cars, almost every person on this planet not only
    contributes but is affected by this issue on a daily basis, making
    them a direct stakeholder. Despite the complications this brings to
    our progression as a civilization, many remain conflicted when weighing
    the convenience of such industrialization with the dangerous long-term
    effects it leaves. Even with its unethical reasoning, society holds fast
    onto harmful technology that could potentially cause harm to the
    environment for its short-term benefits. Using the envisioning cards,
    we can discuss specific ones such as "Untargeted Use", "Future
    Stakeholders" and "Indirect Stakeholders". Although these technologies
    were\'t intentionally designed to harm the environment, ultimately,
    future generations become an indirect and future stakeholder since
    their future home\'s living conditions become threatened. Another indirect
    stakeholder would be wildlife and marine animals because although they
    don\'t necessarily use these technologies, their habitats are affected by
    the harmful effects of them. Numerous other studies on the climate and fuel
    efficiency have been conducted by other companies and organizations.
    These works are helpful towards us as we are able to use them as
    inspiration/reference when visualizing the datasets. We are motivated to
    work on this issue, and care about it as this is an existential issue that
    has the ability to wipe out our entire species, but it seems that many do
    not care due to the fact that it is happening slowly and not
    instantaneously. It is up to our generation to amend the problems and
    evolves to rely on cleaner, greener technology.'),
  hr(),
  h2("Research questions"),
  p("1.How has fuel efficiency and other attributes of automotive in the U.S.
    changed over time?"),
  p("2. What kind of correlation exists between the change in automotive
  technology and their
    fuel efficiency and attributes?"),
  p("3. Are there any comparisons that can be made with fuel efficiency
    and the air quality?")
)

# Vis page 1
attributes_trends <- tabPanel(
  "Trends of auto. attributes",
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
      p("controls: Hover the graph for detai info, click on legends
        to seperate data, additional control on the top left corner")
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
  titlePanel("Conclusions of our findings"),
  p("Base on our findings, we were successfully able to answer ur reserach 
    questions as well as learnt alot which we weren't aware of earlier.
    \n We found these answers to our research questions:
    \n
    <b>How has fuel efficiency and other attributes of automotive in the 
      U.S. changed over time?</b>
    Base on the graph, we could see a few trends among automotive attributes
    from 1975. From 1975 to early 1980, the fuel economy increased 
    dramatically. However, the increase MPG came at the costs of engine power
    and weight. Combine this observation and the oil crisis during that period,
    [1](https://en.wikipedia.org/wiki/1970s_energy_crisis)  We infer that the 
    car manufactures scrambled to lower weight and engine power to achieve a 
    high fuel efficiency. Then, the weight and engine power started to recover
    while MPG increased slightly. Base on our observation from the second 
    visualization page--the market share of automotive technology,  we conclude
    that new technology was developed to increase the engine performance
    without costing a heavy toll on the fuel economy. Engine power, car weight, 
    and acceleration continued to increase throughout the 90s, however, the 
    fuel economy was decreasing at a relatively slow rate, about 3% every 5 
    years. Then around 2005, things changed once again. The weight started to
    level out, engine power and acceleration continued to increase, while fuel
    economy started to climb up once again at a relatively quick rate, around
    10% each 5 years. We infer that new technology played an important role in
    this change, and this trend is likely to be continued into the future.\n
    <br>
    <b>What kind of correlation exists between the change in automotive
    technology and their fuel efficiency and other attributes?</b>
    <br>
    <ul>
      <li>There are 2 noticeable changes of trends in this graph regarding
      engine technologies. One happened around mid 80s, when carburetor started
      to phase out, and port injection and throttle body injection began to 
      gain huge market shares. Another one was around late 2000s, when direct
      injection began to rise in popularity. These 2 findings correlate to the
      trends we observed in the first visualization, the trends of automotive
      attributes.</li>
      <li>There are 2 noticeable changes of trends in this graph regarding
      transmission technology as well. One happened around mid 80s, when
      automatic without lock up feature started to phase out, manual started
      to decrease, and automatic with lock up started its way of gaining huge
      market shares. Another one was around 2000s, when continuously variable
      transmission began to gain market shares. These 2 findings correlate to
      the trends we observed in the first visualization, the trends of 
      automotive attributes</li>
      <li>From this graph, we could see that the front wheel drivetrain
      occupied a large market shares, and FWD vehicles generally have better
      fuel economy[2] (https://www.usautosales.info/blogs/1924/the-perfect-car/front-wheel-drive-vs-rear-wheel-drive/).
      The gaining popularity of all wheel drive vehicles in recent years shows
      that despite the slightly poor fuel efficiency associated with AWD, the
      improvement in technology is likely to continue to offset the negativity
      of AWD systems.</li>
    </ul>")
)

# About tech page1
r_tab <- tabPanel(
  "R language",
  titlePanel("Use of R language"),
  p("We uses shiny, dplr, etc")
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
  p("Source, data wrangleing")
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