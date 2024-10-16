library(shiny)
library(ggplot2)

# Dati di esempio
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 5)
data <- data.frame(x = x, y = y)

# Definizione dell'applicazione Shiny
ui <- fluidPage(
  titlePanel("OLS"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("intercept", "Intercetta:", min = -3, max = 3, value = 0, step = 0.2),
      sliderInput("beta", "Beta:", min = -3, max = 3, value = 1, step = 0.2),
      checkboxInput("showResiduals", "Mostra residui sul grafico", value = FALSE)
    ),
    
    mainPanel(
      plotOutput("regressionPlot"),
      textOutput("rssOutput")
    )
  )
)

server <- function(input, output) {
  output$regressionPlot <- renderPlot({
    intercept <- input$intercept
    beta <- input$beta
    
    # Calcolare y_pred e residui
    data$y_pred <- intercept + beta * data$x
    data$residuals <- data$y - data$y_pred
    
    # Grafico con ggplot2
    p <- ggplot(data, aes(x = x, y = y)) +
      geom_point(size = 3) + # Punti osservati
      geom_abline(intercept = intercept, slope = beta, size = 1) + # Retta di regressione
      labs(
        x = "X", y = "Y",
        title = paste("Modello: y =", round(intercept, 2), "+", round(beta, 2), "* x")
      ) +
      theme_minimal() +
      xlim(c(0, 6)) +
      ylim(c(0, 6))
    
    # Aggiungi residui se selezionato
    if (input$showResiduals) {
      p <- p + geom_segment(aes(xend = x, yend = y_pred), linetype = "dotted", color = "red")
    }
    
    p
  })
  
  # Calcolo e output di RSS
  output$rssOutput <- renderText({
    intercept <- input$intercept
    beta <- input$beta
    
    # Calcolare y_pred e residui
    data$y_pred <- intercept + beta * data$x
    data$residuals <- data$y - data$y_pred
    
    # Calcolare RSS
    rss <- sum(data$residuals^2)
    paste("SSE (Error Sum of Squares) =", round(rss, 3))
  })
}

# Lancio dell'applicazione
shinyApp(ui = ui, server = server)