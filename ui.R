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
            plotOutput("plot1"),
            h3("Cumulative probability of menarche:"),
            textOutput("pred1")
        )
    )
))