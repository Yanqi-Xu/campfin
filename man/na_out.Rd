% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/counters.R
\name{na_out}
\alias{na_out}
\title{Remove Out}
\usage{
na_out(x, y)
}
\arguments{
\item{x}{A vector to check.}

\item{y}{A vector to compare against.}
}
\value{
The vector \code{x} missing any values not in \code{y}.
}
\description{
Remove the values of one vector that are not in another vector.
}
\concept{Simple Counting Wrappers
na_out(c("VT", "NH", "ZZ", "ME"), state.abb)
na_out(1:10, seq(1, 10, 2))}
