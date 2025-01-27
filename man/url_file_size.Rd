% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/url-file-size.R
\name{url_file_size}
\alias{url_file_size}
\title{Check URL File Size}
\usage{
url_file_size(url, format = FALSE)
}
\arguments{
\item{url}{The URL of the file to query.}

\item{format}{logical; Whether to format as byte measurment and symbol.}
}
\value{
The size of a file to be downloaded.
}
\description{
Call \code{\link[httr:HEAD]{httr::HEAD()}} and return the number of bytes in the file
to be downloaded.
}
\examples{
url_file_size("https://campaignfinance.cdn.sos.ca.gov/dbwebexport.zip", format = TRUE)
}
