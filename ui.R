library(shiny)
shinyUI(fluidPage(
    titlePanel("Probability of menarche among adolescent girls in Warsaw, 1965"),
    sidebarLayout(
        sidebarPanel(
            h5("Slide to the age you want to see cumulative probability of menarche"),
            sliderInput("men_Age", "What is the age of menarche?", 
                        9, 18, value = 12)
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                 tabPanel("Data", br(),        
                    plotOutput("plot1"),
                    h3("Cumulative probability of menarche:"),
                    textOutput("pred1")
                ),
                tabPanel("Documentation", br(), p("This is a Shiny app for the course 
                        project in Developing Data Products. The data is based 
                        on a study of adolescent girls in Warsaw in 1965 and 
                        at what age they had already achieved menarche. Use the
                        slider to choose an age, and the output will generate
                        the probability that the girl had achieved menarche."),
                         br(),
                        p("Source code for server.R and ui.R are available at 
                          https://www.github.com/JDSBlueDevl/menarche_data"))
    )
))))