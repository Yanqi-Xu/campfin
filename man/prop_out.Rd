% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/counters.R
\name{prop_out}
\alias{prop_out}
\title{Proportion Out}
\usage{
prop_out(x, y, na.rm = TRUE)
}
\arguments{
\item{x}{A vector to check.}

\item{y}{A vector to compare against.}

\item{na.rm}{logical; Should \code{NA} be ignored?}
}
\value{
The proprtion of \code{x} absent in \code{y}.
}
\description{
Find proportion of values of one vector not in another vector.
}
\details{
\code{mean(x \%out\% y)}
}
\examples{
prop_out(c("VT", "NH", "ZZ", "ME"), state.abb)
}
\seealso{
Other Simple Counting Wrappers: \code{\link{count_diff}},
  \code{\link{count_in}}, \code{\link{count_na}},
  \code{\link{count_out}}, \code{\link{progress_table}},
  \code{\link{prop_in}}, \code{\link{prop_na}}
}
\concept{Simple Counting Wrappers}
