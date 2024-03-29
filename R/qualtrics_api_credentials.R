#' Install Qualtrics credentials in your `.Renviron` file for repeated use
#'
#' @description This function adds your Qualtrics API key and base URL to your
#' `.Renviron` file so it can be called securely without being stored in
#' your code. After you have installed these two credentials, they can be
#' called any time with `Sys.getenv("QUALTRICS_API_KEY")` or
#' `Sys.getenv("QUALTRICS_BASE_URL")`. If you do not have an
#' `.Renviron` file, the function will create one for you. If you already
#' have an `.Renviron` file, the function will append the key to your
#' existing file, while making a backup of your original file for disaster
#' recovery purposes.
#' @param api_key The API key provided to you from Qualtrics formatted in quotes.
#' Learn more about Qualtrics API keys at <https://api.qualtrics.com/>
#' @param base_url The institution-specific base URL for your Qualtrics account,
#' formatted in quotes, without the protocol (do not include `https://`). Find
#' your base URL at <https://api.qualtrics.com/>
#' @param install If TRUE, will install the key in your `.Renviron` file
#' for use in future sessions.  Defaults to FALSE (single session use).
#' @param overwrite If TRUE, will overwrite existing Qualtrics
#' credentials that you already have in your `.Renviron` file.
#' @param report If TRUE, ignores other arguments and outputs credentials as a
#' 2-element named vector.
#' @examples
#'
#' \dontrun{
#' qualtrics_api_credentials(
#'   api_key = "<YOUR-QUALTRICS_API_KEY>",
#'   base_url = "<YOUR-QUALTRICS_BASE_URL>",
#'   install = TRUE
#' )
#' # Reload your environment so you can use the credentials without restarting R
#' readRenviron("~/.Renviron")
#' # You can check it with:
#' Sys.getenv("QUALTRICS_API_KEY")
#'
#' # If you need to overwrite existing credentials:
#' qualtrics_api_credentials(
#'   api_key = "<YOUR-QUALTRICS_API_KEY>",
#'   base_url = "<YOUR-QUALTRICS_BASE_URL>",
#'   overwrite = TRUE,
#'   install = TRUE
#' )
#' # Reload your environment to use the credentials
#' }
#' @export

qualtrics_api_credentials <-
  function(api_key,
           base_url,
           overwrite = FALSE,
           install = FALSE,
           report = FALSE) {

    checkarg_isboolean(report)

    if(report){
      creds <- c(
        api_key = Sys.getenv("QUALTRICS_API_KEY"),
        base_url = Sys.getenv("QUALTRICS_BASE_URL")
      )
      return(creds)
    }

    checkarg_isboolean(overwrite)
    checkarg_isboolean(install)
    checkarg_isstring(api_key)

    base_url <- checkarg_base_url(base_url)

    if (install) {

      home <-
        Sys.getenv("HOME")
      renv <-
        file.path(home, ".Renviron")

      # If needed, backup original .Renviron before doing anything else here.
      if (file.exists(renv)) {
        file.copy(renv, file.path(home, ".Renviron_backup"))
      }

      if (!file.exists(renv)) {
        file.create(renv)
      } else {
        if (isTRUE(overwrite)) {
          message("Your original .Renviron will be backed up and stored in your R HOME directory if needed.")
          oldenv <- readLines(renv)
          newenv <- oldenv[-grep("QUALTRICS_API_KEY|QUALTRICS_BASE_URL", oldenv)]
          writeLines(newenv, renv)
        }
        else {
          tv <- readLines(renv)
          if (any(grepl("QUALTRICS_API_KEY|QUALTRICS_BASE_URL", tv))) {
            stop("Qualtrics credentials already exist. You can overwrite them with the argument overwrite=TRUE", call. = FALSE)
          }
        }
      }

      keyconcat <- paste0("QUALTRICS_API_KEY = '", api_key, "'")
      urlconcat <- paste0("QUALTRICS_BASE_URL = '", base_url, "'")
      # Append credentials to .Renviron file
      write(keyconcat, renv, sep = "\n", append = TRUE)
      write(urlconcat, renv, sep = "\n", append = TRUE)
      message('Your Qualtrics key and base URL have been stored in your .Renviron.  \nTo use now, restart R or run `readRenviron("~/.Renviron")`')
    } else {
      message("To install your credentials for use in future sessions, run this function with `install = TRUE`.")
      Sys.setenv(
        QUALTRICS_API_KEY = api_key,
        QUALTRICS_BASE_URL = base_url
      )
    }
  }
