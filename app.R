library(shiny)
library(shinydashboard)
library(dplyr)
library(googlesheets)
library(shinyjs)


conservancy_list = c('Awer', 'Biliqo-Bulesa', 'Hanshak Nyogoro', 'Il Ngwesi',
                     'Ishaqbin-Hirola','Jaldesa','Kainuk','Kalama','Katilu','Kiunga','Lekurruki','Leparua',
                     'Lewa','Lochakula','Lokichar','Lower Tana Delta','Ltungai','Masol','Meibae','Melako','Naibunga','Nakuprat-Gotu',
                     'Namunyak','Nasuulu','Ndera','Ngare Ndare','Nkoteiya','Oldonyiro','Pate Island','Pellow','Ruko','Sera',
                     'Shurr','Songa','Westgate')

mandatory_inputs = c("input1", "input2", "input3", "input4", "input5", "input6",
                    "input7", "input8", "input9", "input10", "input11", "input12",
                    "input13", "input14", "input15", "input16", "input17", "input18",
                    "input19", "input20", "input21", "input22", "input23", "input24",
                    "input25", "input26", "input27", "input28", "input29", "input30",
                    "input31", "input32", "input33", "input34", "input35", "input36",
                    "input37", "input38", "input39", "input40", "input41", "input42", 
                    "input43", "input44", "input45", "input46", "input47", "input48",
                    "input49", "input50")


shinyApp(ui = function(request){dashboardPage(
  skin = "black",
  dashboardHeader(title = "NRT Governance Scores Survey"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    box(width = 12,
        #h2("Introduction"),
        p("This is a survey developed"),
        
        textInput("input1", "Please indicate your name:", width = "40%"),
        textInput("input2", "Please indicate your email address:", width = "40%"),
        selectInput("input3", "Please select your conservancy:", choices = c("", conservancy_list), width = "40%"),
        selectInput("input4", "Please select your role with the conservancy:",
                    choices = c("", "Conservancy Manager", "Conservancy Board Member", "Regional Coordinator"), 
                    width = "40%"),
        # AGMs,representation, participation
        #h4("Representation"),
        radioButtons("input5", "1. Does the conservancy host 2/3 gender representation on the board and other committees?", 
                     choices = c("No", "Yes"), selected = character(0)),
        radioButtons("input6", "2. How would you rate elder and youth representation on your conservancy board and committees?", 
                     choices = c("Poor", "Fair", "Good"), selected = character(0)),
        
        radioButtons("input7", "3. How would you rate the attendance of county government and partner ex officio in your conservancy's board meetings?", 
                     choices = c("Poor", "Fair", "Good"), selected = character(0)),
        
        radioButtons("input8", "4. Does your conservancy have an equitable and balanced participation of board members in meetings?",
                     choices = c("No", "Yes"), selected = character(0)),
        #h4("AGM"),
        radioButtons("input9", "5. Do you feel the conservancy manager and board made adequate pre-AGM preparations for last year's AGM?", choices = c("No", "Yes"), 
                     selected = character(0)),
        radioButtons("input10", "6. Was your conservancy's last AGM well attended by the community?", choices = c("No", "Yes"), 
                     selected = character(0)),
        
        radioButtons("input11", "7. How would you rate 2/3 gender attendance and representation in the last AGM?", 
                     choices = c("Poor", "Fair", "Good"), selected = character(0)),
        radioButtons("input12", "8. How would you rate 50% youth attendance and representation in the last AGM?", choices = c("Poor", "Fair", "Good"), 
                     selected = character(0)),
        radioButtons("input13", "9. How would you rate partners participation in your conservancy's last AGM?", choices = c("Poor", "Fair", "Good"),
                     selected = character(0)),
        radioButtons("input14", "10. Was your conservancy's annual operational plans presented at the last AGM?",
                              choices = c("No", "Yes"), selected = character(0)),
        radioButtons("input15", "11. Was your conservancy's financial audit presented at the last AGM?", choices = c("No", "Yes"),
                     selected = character(0)),
        radioButtons("input16", "12. Was your conservancy manager's report presented at the last AGM?", choices = c("No", "Yes"),
                     selected = character(0)),
        #h4("Sustainability"),
        textInput("input17", "13. Please indicate the amount (Ksh) of conservancy operational budget funded by commercial enterprises in the last financial year?", width = "80%"),
                     
        textInput("input18", "14. Please indicate the amount (Ksh) of conservancy operational budget funded by county government in the last financial year?", width = "80%"),
                     
        # Budget, finances
        textInput("input19", "15. Please indicate the amount (Ksh) of conservancy operational budget funded by NRT in the last financial year?", width = "80%"),
        textInput("input20", "16. Please indicate the amount (Ksh) of conservancy operational budget funded by other donors in the last financial year?", width = "80%"),
        radioButtons("input21", "17. Were your conservancy's Finance Committee meetings scheduled, displayed and conducted as per annual plan?", 
                     choices = c("No", "Yes"), selected = character(0)),
        
        radioButtons("input22", "18. Was your conservancy's annual audit finalized and approved by February?", choices = c("No", "Yes"), 
                     selected = character(0)),
        #h4("Planning"),
        radioButtons("input23", "19. Were your conservancy's monthly financial reports submitted to the conservancy's board and NRT on time in the last year?",
                     choices = c("No", "Mostly"  ,"Yes"), selected = character(0)),
        
        radioButtons("input24", "20. Did your conservancy have a detailed annual work plan that identified specific targets for achieving management objectives?",
                     choices = c("No", "Yes"), selected = character(0)),
        radioButtons("input25", "21. Did your conservancy develop and approve an annual workplan for the last financial year?",
                     choices = c("No", "Yes"), selected = character(0)),
        
        radioButtons("input26", "22. Did your conservancy schedule, display and conduct Grazing/Marine committee meetings as per your last annual workplan?", 
                      choices = c("No", "Yes"), selected = character(0)),
        radioButtons("input27", "23. Did your conservancy routinely incorporate the results of research and monitoring through Rangelands Reports into planning over the last year?", 
                     choices = c("No", "Yes"), selected = character(0)),
        radioButtons("input28", "24. Did your conservancy routinely incorporate the results of research and monitoring through Vegetation Reports into planning over the last year?",
                     choices = c("No", "Yes"), selected = character(0)),
        radioButtons("input29", "25. Did your conservancy document a grazing plan for the dry season in the last financial year?",
                          choices = c("No", "Yes"), selected = character(0)),
        radioButtons("input30", "26.Did your conservancy document a grazing plan for the wet season in the last financial year?",
                  choices = c("No", "Yes"), selected = character(0)),
        
       radioButtons("input31", "27. Was COMMS carried out on a regular basis, new data entered and updated in the last year?",
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input32", "28. Were COMMS reports generated and analyzed in the last year?", 
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input33", "29. Did your conservancy routinely incorporate the results of research and monitoring through Security Reports into planning over the last year?",
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input34", "30. Did your conservancy routinely incorporate the results of research and monitoring through Wildlife Reports into planning over the last year?", 
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input35", "31. Did your conservancy routinely incorporate the results of research and monitoring through Social COMMS Reports into planning over the last year?",
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input36", "32. Did your conservancy accurately monitor and record the legal and illegal uses of the protected area (core or non-livestock zones) in the last year?",
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input37", "33. Were the monthly conservancy reports completed accurately and in detail and submitted on time in the last year?",
                    choices = c("Never", "Sometimes", "Always"), selected = character(0)),
       
       radioButtons("input38", "34. Were the monthly finance reports and cashbooks completed accurately and in detail and submitted on time in the last year?",
                    choices = c("Never", "Sometimes", "Always"), selected = character(0)),
       radioButtons("input39", "35. Were your conservancy's reports available to the public at the conservancy's headquarters in the last year?", 
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input40", "36. Are CCDMP indicators established in your conservancy?", choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input41", "37. Were CCDMPS posted at your conservancy's headquarters over the last year?", 
                    choices = c("No", "Yes"), selected = character(0)),
       textInput("input42", "38. How many independently sourced organizations worked with the conservancy to achieve CCDMP objectives in the last financial year?", width = "80%"),
       textInput("input43", "39. How many NRT partner organizations worked with conservancy to achieve CCDMP objectives in the last financial year?", width = "80%"),
       radioButtons("input44", "40. Was your conservancy recognized as an entry point to the community in the last year?", choices = c("No", "Yes"), selected = character(0)),
       
       radioButtons("input45", "41. How would you describe the strength of your conservancy's partnership with NRT, tourism operators, programmatic NGOs, KWS, National Police, County Governments over the last year?", choices = c("No contact", "Contact, but no cooperation", "Contact and some cooperation", "Regular contact and significant cooperation"), selected = character(0)),
       radioButtons("input46", "42. How would you rate the relevant skills of your conservancy's board over the last year?", choices = c("Lack skills", "Low skills relative to needs", "Adequate but could do with improvement", "Skills aligned with needs"), selected = character(0)),
       
       radioButtons("input47", "43. How would you rate the relevant skills of your conservancy's staff over the last year?", choices = c("Lack skills", "Low skills relative to needs", "Adequate but could do with improvement", "Skills aligned with needs"), selected = character(0)),
       radioButtons("input48", "44. Has there been a democratic selection of your conservancy's board members in the past 3 years?", 
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input49", "45. Has your conservancy's organogram been updated with names and contacts of board, committee, management and team members for the past year?",
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input50", "46. Was there transparent hiring of management staff in your conservancy in the last year?", 
                    choices = c("No", "Yes"), selected = character(0)),
       radioButtons("input51", "47. Do you believe that the conservancy's management decision making was transparent in the last year?", choices = c("No", "Yes"), selected = character(0)),
       
       radioButtons("input52", "48. Was the conservancy's members database updated in the last year?", choices = c("No", "Yes"), selected = character(0)),
    
       bookmarkButton(label = "Save and complete later"),                 
       actionButton("submit", "Submit")
        
                     
                     
        ))
        )}, 
                     
    server = function(input, output){
      nrt_googlesheet = gs_key("1rpT-neD0f3HA3clz7UhfwJdVeOxHhVYQ4rEVpvLk6GI")
      
      user_inputs = reactive(c(input$input1, input$input2, input$input3, input$input4, input$input5, input$input6,
                               input$input7, input$input8, input$input9, input$input10, input$input11, input$input12,
                               input$input13, input$input14, input$input15, input$input16, input$input17, input$input18,
                               input$input19, input$input20, input$input21, input$input22, input$input23, input$input24,
                               input$input25, input$input26, input$input27, input$input28, input$input29, input$input30,
                               input$input31, input$input32, input$input33, input$input34, input$input35, input$input36,
                               input$input37, input$input38, input$input39,input$input40, input$input41, input$input42, 
                               input$input43, input$input44, input$input45, input$input46, input$input47, input$input48,
                               input$input49, input$input50, input$input51, input$input52, input$input53, input$input54,
                               input$input55))
      
      observe({
        # check if all mandatory fields have a value
        mandatory_filled <-
          vapply(mandatory_inputs,
                 function(x) {
                   !is.null(input[[x]]) && input[[x]] != ""
                 },
                 logical(1))
        mandatory_filled <- all(mandatory_filled)
        
        # enable/disable the submit button
        shinyjs::toggleState(id = "submit", condition = mandatory_filled)
      })
      
      observeEvent(input$submit,{ 
                   nrt_googlesheet %>%
                     gs_add_row(ws = 1, input = user_inputs())}
        )
      
                     },
  enableBookmarking = "url")


                     
