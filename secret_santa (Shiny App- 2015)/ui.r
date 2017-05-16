shinyUI(fluidPage(
  titlePanel("Secret Santa"),
  
  sidebarLayout(position = "left",
                sidebarPanel(h3("Setup"),
                             textInput('name','','Name'),
                             actionButton('add','Add Participant'),
                             br(),
                             actionButton('shuffle','Shuffle Participants'),
                             br(),
                             actionButton('reset', 'Reset'),
                             br(),
                             br(),
                             img(src = "santapic.jpg", height = 275, width = 275),
                             p("* Type a name into the box and click 'Add Participant' to add them to the list"),
                             p("* When all of the names have been added, click 'Shuffle Participants' to create the Secret Santa assignments. You can reshuffle as many times as you want."),
                             p("* The 'Reset' button will remove all names from the list"),
                             br(),
                             br(),
                             br(),
                             p("Tweet me any changes you want to see to the app or just give me a shout out!"),
                             p(a("-Emeka Nwosu", href = "https://twitter.com/Don_Meka"))
                             ),##sidebar panel
                
                mainPanel(h3("Result"),
                          verbatimTextOutput('namelist'),
                          dataTableOutput("ssdf")
                          )##Main Panel
  )

  
  
))