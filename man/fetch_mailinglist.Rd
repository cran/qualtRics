% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fetch_mailinglist.R
\name{fetch_mailinglist}
\alias{fetch_mailinglist}
\title{Download a mailing list from Qualtrics}
\usage{
fetch_mailinglist(mailinglistID)
}
\arguments{
\item{mailinglistID}{String. Unique ID for the mailing list you want to download. Returned as \code{id} by the \link[qualtRics]{all_mailinglists} function.}
}
\description{
Download a mailing list from Qualtrics
}
\examples{
\dontrun{
# Register your Qualtrics credentials if you haven't already
qualtrics_api_credentials(
  api_key = "<YOUR-API-KEY>",
  base_url = "<YOUR-BASE-URL>"
)

# Retrieve a list of all mailing lists
mailinglists <- all_mailinglists()

# Retrieve a single mailing list
mailinglist <- fetch_mailinglist(mailinglists$id[1])
}

}
