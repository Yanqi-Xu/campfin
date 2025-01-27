% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flag-dupes.R
\name{flag_dupes}
\alias{flag_dupes}
\title{Flag Duplicate Rows With New Column}
\usage{
flag_dupes(data, ...)
}
\arguments{
\item{data}{A data frame to flag.}

\item{...}{Arguments passed to \code{\link[dplyr:select]{dplyr::select()}} (needs to be at least
\code{\link[dplyr:everything]{dplyr::everything()}}).}
}
\value{
A data frame with a new \code{dupe_flag} logical variable.
}
\description{
This function uses \code{\link[dplyr:mutate]{dplyr::mutate()}} to create a new \code{dupe_flag}
logical variable with \code{TRUE} values for any record duplicated more than
once.
}
\examples{
flag_dupes(iris, dplyr::everything())
}
