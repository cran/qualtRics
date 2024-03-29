% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checks.R
\name{checkarg_datetime}
\alias{checkarg_datetime}
\title{Title Check date-time-like inputs and convert them to ISO8601 (with time
zone)}
\usage{
checkarg_datetime(date_arg, time_zone = NULL, endofday = FALSE)
}
\arguments{
\item{date_arg}{Date, POSIX(c/l)t date/time, or parseable string in
YYYY(/-)MM(/-)DD format, optionally with a space and HH:MM:SS in 24 hour
time.  Intended to be converted to ISO8601 string for use in Qualtrics API
call}

\item{time_zone}{Optional arg for time zone specification, defaults to system
local timezone.}

\item{endofday}{Boolean. If TRUE, if the entry has no time information (only
date), then result will have 23:59:59 (end of day) versus the implicit
00:00:00 (start).  Intended for, e.g., 'end_date' argument in
fetch_survey(). This allows the intuitive expectation where entering
end_date = 2022/05/05 includes rather than excludes cases on 05/05 itself.}
}
\value{
single string date/time formatted in ISO8601
}
\description{
Title Check date-time-like inputs and convert them to ISO8601 (with time
zone)
}
\keyword{internal}
