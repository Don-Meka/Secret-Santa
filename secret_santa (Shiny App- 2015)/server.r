shinyServer(function(input, output, session) {
  
  ##add button
  myValues <- reactiveValues()
  observe({
    if(input$add > 0){
      myValues$alist <- c(isolate(myValues$alist), isolate(input$name))
    }
  })
  
  ##name list output
  output$namelist <- renderPrint({
    myValues$alist
  })
  
  ##shuffle button
  observe({
    if(input$shuffle > 0){
      output$ssdf <- renderDataTable(data.frame(secret_santa(names = myValues$alist )),
                                     options = list(paging = FALSE, searching = FALSE))
    }
  })
  
  ##reset button
  observe({
    if(input$reset > 0){
      myValues$alist <- NULL
    }
  })
  
  ##Secret Santa FUnction
  secret_santa <- function(names) {
    ##"names" variable should be a character vector of the names of the participants
    Givers <- sample(names)
    poop <- sample(names)
    Receivers <- c()
    
    for (i in seq_along(Givers)) {
      pReceivers <- poop[Givers[i] != poop]
      Receivers[i] <- sample(pReceivers)[1] 
      poop <- poop[grepl(Receivers[i], poop) == F] 
    }
    cbind(Givers, Receivers)
  }  
  
  
})