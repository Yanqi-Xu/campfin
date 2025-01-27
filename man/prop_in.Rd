% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/counters.R
\name{prop_in}
\alias{prop_in}
\title{Proportion In}
\usage{
prop_in(x, y, na.rm = TRUE)
}
\arguments{
\item{x}{A vector to check.}

\item{y}{A vector to compare against.}

\item{na.rm}{logical; Should \code{NA} be ignored?}
}
\value{
The proprtion of \code{x} present in \code{y}.
}
\description{
Count total values of one vector in another vector.
}
\details{
\code{mean(x \%in\% y)}
}
\examples{
prop_in(c("VT", "NH", "ZZ", "ME"), state.abb)
}
\seealso{
Other Simple Counting Wrappers: \code{\link{count_diff}},
  \code{\link{count_in}}, \code{\link{count_na}},
  \code{\link{count_out}}, \code{\link{progress_table}},
  \code{\link{prop_na}}, \code{\link{prop_out}}
}
\concept{Simple Counting Wrappers}
