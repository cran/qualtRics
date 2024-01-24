## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  library(qualtRics)
#  
#  qualtrics_api_credentials(api_key = "<YOUR-QUALTRICS_API_KEY>",
#                            base_url = "<YOUR-QUALTRICS_BASE_URL>",
#                            install = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  surveys <- all_surveys()

## ----eval=FALSE---------------------------------------------------------------
#  mysurvey <- fetch_survey(surveyID = surveys$id[6],
#                           verbose = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  mysurvey <- fetch_survey(surveys$id[4],
#                           start_date = "2018-10-01",
#                           end_date = "2018-10-31",
#                           label = FALSE)

## ----eval=FALSE---------------------------------------------------------------
#  mysurvey <- fetch_survey(surveys$id[4],
#                           last_response = "R_3mmovCIeMllvsER",
#                           label = FALSE,
#                           verbose = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  # what are the questions in a certain survey?
#  questions <- survey_questions(surveyID = surveys$id[6])
#  
#  # download that survey, filtering for only certain questions
#  mysurvey <- fetch_survey(surveyID = surveys$id[6],
#                           save_dir = tempdir(),
#                           include_questions = c("QID1", "QID2", "QID3"),
#                           verbose = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  mysurvey <- fetch_survey(surveyID = surveys$id[6],
#                           save_dir = "/users/Julia/Desktop/",
#                           verbose = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  mysurvey <- readRDS(file = "/users/Julia/Desktop/mysurvey.rds")

## ----eval=FALSE---------------------------------------------------------------
#  mysurvey <- read_survey("/users/Julia/Desktop/mysurvey.csv")

## ----echo=FALSE, out.width="80%"----------------------------------------------
knitr::include_graphics("qualtricsdf.png")

