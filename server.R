library(shiny)

##Read data into application
temp <- tempfile()
url <- "http://apps.who.int/gho/athena/api/GHO/WHS2_138.csv?profile=verbose"
download.file(url, temp)
data <- read.csv(temp)
unlink(temp)

shinyServer(function(input, output) {
        
        output$table <- renderTable({
                subData <- data.frame(REGION..DISPLAY. = character(),
                                      YEAR..CODE. = character(), 
                                      Numeric = numeric())
                for(i in input$select) {
                        whereCountry <- data$COUNTRY..DISPLAY. == i
                        hereCountry <- data[whereCountry, c(14, 7, 17)]
                        hereCountry[, 1] <- as.character(hereCountry[, 1])
                        hereCountry[, 2] <- as.character(hereCountry[, 2])
                        if(input$mean == TRUE) {
                                meanCountry <- mean(hereCountry$Numeric)
                                meanRow <- list("Mean", 
                                                "",
                                                meanCountry)
                                hereCountry <- rbind(hereCountry, meanRow)
                        }
                        subData <- rbind(subData, hereCountry)
                }
                colnames(subData) <- c("Country", "Year", "Deaths per 100,000")
                subData
        }, NA.string = "NA", include.rownames = F)
        
       output$na <- renderText({
                subData <- data.frame(REGION..DISPLAY. = factor(),
                                      YEAR..CODE. = integer(), 
                                      Numeric = numeric())
                for(i in input$select) {
                        whereCountry <- data$COUNTRY..DISPLAY. == i
                        hereCountry <- data[whereCountry, c(14, 7, 17)]
                        subData <- rbind(subData, hereCountry)
                }
                if(is.na(sum(subData$Numeric))) {
                        "Missing values prevent graph."
                }
        })
        
        output$plot <- renderPlot({
                if(length(input$select) != 0) {
                subData <- data.frame(REGION..DISPLAY. = factor(),
                                      YEAR..CODE. = integer(), 
                                      Numeric = numeric())
                for(i in input$select) {
                        whereCountry <- data$COUNTRY..DISPLAY. == i
                        hereCountry <- data[whereCountry, c(14, 7, 17)]
                        subData <- rbind(subData, hereCountry)
                }
                mortMat <- numeric()
                for(i in input$select) {
                        whereCountry <- subData$COUNTRY..DISPLAY. == i
                        numCountry <- subData$Numeric[whereCountry]
                        mortMat <- c(mortMat, numCountry)
                }
                mat <- matrix(mortMat, 2, dimnames = list(c("2001", "2012"),
                                                          input$selected))
                if(!is.na(sum(subData$Numeric))) {
                        barNames <- character()
                        for(i in input$select) {
                                whereCountry <- data$COUNTRY..DISPLAY. == i
                                ctryCode <- data$COUNTRY..CODE.[whereCountry]
                                ctryCode <- unique(as.character(ctryCode))
                                barNames <- c(barNames, ctryCode)
                        } 
                        barplot(mat, names.arg = barNames,
                              beside = T, col = "lightblue", xlab = "Country",  
                              ylab = "Deaths per 100,000")
                }} else {}
        })
})