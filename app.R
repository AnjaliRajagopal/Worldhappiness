library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram
happiness=read.csv("https://raw.githubusercontent.com/AnjaliRajagopal/happinessdata/main/world-happiness-report-2021.csv")
ui <- fluidPage(
    #UI(fluidPage(
    titlePanel('Ladder scores of happiness Vs Indicators of happiness regression'),
    sidebarLayout(
        sidebarPanel(
            selectInput('xcol', 'Select a type of Crime to visualize its relation to percentage of urban population', names(happiness)[c(7,8,9,10,11,12)],
                        selected=names(happiness)[[1]]),
            
            h1(""),
            
            tableOutput('table1'),
            
            
        ),
        mainPanel(
            
            
            h5("The chart shows Ladder score of happiness in all countries vs the six indicators of happiness."),
            h5("Source: 'World happiness report 2021' dataset from kaggle.com."),
            h5("A linear regression model is calculated for each indicator of happiness."),
            plotOutput("plot1"),
            h4("summary of regression"),
            verbatimTextOutput(outputId = "RegSum"),
            
            
        )
    )
)

server <- (function(input, output) {
    
    
    
    selectedData <- reactive({
        happiness[, c(input$xcol, "Ladder.score")]
    })
    
    lm1 <- reactive({lm(reformulate("Ladder.score", input$xcol), data = happiness)})
    
    model1 <- lm(Ladder.score ~Logged.GDP.per.capita , data = happiness)
    model2 <- lm(Ladder.score ~Social.support , data = happiness)
    model3 <- lm(Ladder.score ~Healthy.life.expectancy , data = happiness)
    model4 <- lm(Ladder.score ~Freedom.to.make.life.choices , data = happiness)
    model5 <- lm(Ladder.score ~Generosity , data = happiness)
    model6 <- lm(Ladder.score ~Perceptions.of.corruption , data = happiness)
    
    output$plot1 <- renderPlot({
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData())
        if(input$xcol=='Logged.GDP.per.capita'){
            ggplot(happiness,aes(y=Ladder.score, x = Logged.GDP.per.capita))+
                geom_point()+
                geom_smooth(method="gam", se=FALSE)}
        if(input$xcol=='Social.support'){
            ggplot(happiness,aes(y=Ladder.score,x=Social.support))+geom_point()+geom_smooth(method="lm")}
        
        if(input$xcol=='Healthy.life.expectancy'){
            ggplot(happiness,aes(y=Ladder.score,x=Healthy.life.expectancy))+geom_point()+geom_smooth(method="lm",se=FALSE)}
        if(input$xcol=='Freedom.to.make.life.choices'){
            ggplot(happiness,aes(y=Ladder.score,x=Freedom.to.make.life.choices))+geom_point()+geom_smooth(method="lm",se=FALSE)}
        if(input$xcol=='Generosity'){
            ggplot(happiness,aes(y=Ladder.score,x=Generosity))+geom_point()+geom_smooth(method="lm",se=FALSE)}
        
        if(input$xcol=='Perceptions.of.corruption'){
            ggplot(happiness,aes(y = Ladder.score, x = Perceptions.of.corruption))+geom_point()+geom_smooth(method="lm",se=FALSE)}
        
        
    })
    
    
    output$table1 <- renderTable({
        head(selectedData(),9)
        
    })
    output$RegSum <- renderPrint({summary(lm1())})
    
    
    
    
    
})
shinyApp(ui = ui, server = server)
