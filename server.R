library(shiny)
library(MASS)
data(menarche)
shinyServer(function(input, output) {
    mprob <- glm(cbind(Menarche, Total-Menarche) ~ Age, 
                 family = binomial(link = probit), data = menarche)
    modelPred <- reactive({
        menInput <- input$men_Age
        x <- predict(mprob, newdata = data.frame(Age = menInput))
        pnorm(x)
    })
    output$plot1 <- renderPlot({
        menInput <- input$men_Age
        plot(menarche$Age, menarche$Menarche / menarche$Total, 
             xlab = "Age of menarche onset", ylab = "Pr(Menarche)",
             bty = "n", pch = 16, xlim = c(8,18))
        lines(menarche$Age, mprob$fitted, type = "l", col = "blue", lwd=2)
        points(menInput, modelPred(), pch = 16, col = "blue", cex = 2)
    })
    output$pred1 <- renderText({
      modelPred()
    })
})
