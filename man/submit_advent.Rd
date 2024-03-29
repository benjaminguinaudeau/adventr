% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/submit_advent.R
\name{submit_advent}
\alias{submit_advent}
\title{submit_advent}
\usage{
submit_advent(answer, day, level, cookie = NULL, year = 2022)
}
\arguments{
\item{answer}{Answer to the problem}

\item{day}{Numeric indicating which day needs to be read}

\item{level}{Numeric indicating the problem to be solved. 1 for the first daily problem and 2 for the second one.}

\item{cookie}{Not required if coookie set as an environment variable. A session cookie retrieved as shown in the readme.}

\item{year}{Year of the problem. By default 2021}
}
\description{
Submit your answer to the Advent of Code
}
\examples{
\dontrun{
# Feed your cookie as environment variable
Sys.setenv("ADVENT_COOKIE" = "<paste_your_cookie>")
submit_advent(answer = 25, day = 1, level = 1)

# Feed the cookie as a parameter
cookie <- "<paste_your_cookie>"
read_advent(answer = 25, day = 1, level = 1, cookie = cookie)
}
}
