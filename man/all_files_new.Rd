% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/all-files-new.R
\name{all_files_new}
\alias{all_files_new}
\title{Check if All Files are New}
\usage{
all_files_new(path, glob = NULL, ...)
}
\arguments{
\item{path}{The path to a directory to check.}

\item{glob}{A pattern to search for files (e.g., "*.csv").}

\item{...}{Arguments to be passed to \code{fs::dir_ls()}}
}
\value{
logical; whether \emph{all} files in the directory have a modification
date equal to today.
}
\description{
This function tests whether all the files in a directory have a
modification date equal to the system date. Useful when repeatedly running
code with a lengthy download stage. Many state databases are updated daily,
so new data can be helpful but not always neccesary. Set this function in
an \code{if} statement.
}
\examples{
if (!all_files_new(tempdir())) {
  download.file(
    url = "http://212.183.159.230/5MB.zip",
    destfile = tempfile()
  )
}
}
