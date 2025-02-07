
<!-- README.md is generated from README.Rmd. Please edit that file -->

# campfin <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/campfin)](https://cran.r-project.org/package=campfin)
[![Travis build
status](https://travis-ci.org/irworkshop/campfin.svg?branch=master)](https://travis-ci.org/irworkshop/campfin)
<!-- badges: end -->

## Overview

The `campfin` package was created to facilitate the work being done on
the [The Accountability Project](https://www.publicaccountability.org/),
a tool created by [The Investigative Reporting
Workshop](https://investigativereportingworkshop.org/) in Washington,
DC. The Accountability Project curates, cleans, and indexes public data
to give journalists, researchers and others a simple way to search
across otherwise siloed records.

The data focuses on people, organizations and locations. This package
was created specifically to help with state-level **camp**aign
**fin**ance data, although the tools included are useful in general
database exploration and normalization.

## Installation

The package is not yet on [CRAN](https://cran.r-project.org/) and must
be installed from GitHub.

``` r
if(!requireNamespace("remotes")) install.packages("remotes")
remotes::install_github("irworkshop/campfin")
```

Or you can install the development branch to get the latest features.

``` r
remotes::install_github("irworkshop/campfin", ref = "develop")
```

## Normalize

The package was originally built to normalize geographic data using the
`normal_*()` functions, which take the messy self-reported geographic
data of a contributor, vendor, candidate, or committee and return
[normalized text](https://en.wikipedia.org/wiki/Text_normalization) that
is more searchable. They are largely wrappers around the
[`stringr`](https://github.com/tidyverse/stringr) package, and can call
other sub-functions to streamline normalization.

  - `normal_address()` takes a *street* address and reduces
    inconsistencies.
  - `normal_zip()` takes [ZIP
    Codes](https://cran.r-project.org/web/packages/zipcode/) and aims to
    return a valid 5-digit code.
  - `normal_state()` takes US states and returns a [2 digit
    abbreviation](https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations).
  - `normal_city()` takes cities and reduces inconsistencies.
  - `normal_phone()` consistently fornats US telephone numbers.

Please see the vignette on normalization for an example of how these
functions are used to fix a wide variety of string inconsistencies and
make campaign finance data more consistent. In general, these functions
fix the following inconsistencies:

  - Capitalize with `str_to_upper()`
  - Replace hyphens and underscores with `str_replace()`
  - Remove remaining punctuation with `str_remove()`
  - Remove either numbers or letters (depending on data) with
    `str_remove()`
  - Remove excess white space with `str_trim()` and `str_squish()`
  - Replace abbreviations with `expand_abbrev()` (and
    `str_replace_all()`)
  - Remove invalid values with `na_out()` (and `str_which()`)

## Data

``` r
library(campfin)
library(zipcode)
library(tidyverse)
```

The campfin package contains a number of built in data frames and
strings used to help wrangle campaign finance data.

``` r
objects <- data(package = "campfin")$results[, "Item"]
cat(str_c("* ", "`", objects, "`"), sep = "\n")
```

  - `invalid_city`
  - `rx_phone`
  - `rx_state`
  - `rx_zip`
  - `usps_city`
  - `usps_state`
  - `usps_street`
  - `valid_city`
  - `valid_name`
  - `valid_state`
  - `valid_zip`
  - `vt_contribs`
  - `zipcodes`

The `/data-raw` directory contains the code used to create the objects.

### `zipcodes`

The `zipcodes` (plural) data frame is a normalized version of the
`zipcode` (singular) data frame from the
[`zipcode`](https://cran.r-project.org/web/packages/zipcode/) R package,
which itself is a version of the [CivicSpace US ZIP Code
Database](https://boutell.com/zipcodes/):

> This database was composed using ZIP code gazetteers from the US
> Census Bureau from 1999 and 2000, augmented with additional ZIP code
> information The database is believed to contain over 98% of the ZIP
> Codes in current use in the United States. The remaining ZIP Codes
> absent from this database are entirely PO Box or Firm ZIP codes added
> in the last five years, which are no longer published by the Census
> Bureau, but in any event serve a very small minority of the population
> (probably on the order of .1% or less). Although every attempt has
> been made to filter them out, this data set may contain up to .5%
> false positives, that is, ZIP codes that do not exist or are no longer
> in use but are included due to erroneous data sources.

The included `valid_city` and `valid_zip` vectors are sorted, unique
columns from the `zipcodes` data frame (although `valid_city` is being
updated to include more common neighborhoods and census-designated
places)

``` r
# zipcode version
data("zipcode")
sample_n(zipcode, 3)
#>     zip            city state latitude longitude
#> 1 62688         Tallula    IL 39.94426 -89.93366
#> 2 53928      Doylestown    WI 43.42694 -89.14912
#> 3 33321 Fort Lauderdale    FL 26.21112 -80.26310
class(zipcode)
#> [1] "data.frame"

# campfin version
sample_n(zipcodes, 3)
#> # A tibble: 3 x 3
#>   city    state zip  
#>   <chr>   <chr> <chr>
#> 1 ERATH   LA    70533
#> 2 ACWORTH GA    30102
#> 3 GILLHAM AR    71841
class(zipcodes)
#> [1] "tbl_df"     "tbl"        "data.frame"
```

### `usps_*` and `valid_*`

The `usps_*` data frames were scraped from the official United States
Postal Service (USPS) [Postal Addressing
Standards](https://pe.usps.com/text/pub28/28apc_002.htm). These data
frames are designed to work with the abbreviation functionality of
`normal_address()` and `normal_city()` to replace common abbreviations
with their full equivalent.

`usps_city` is a curated subset of `usps_state`, whose full version
appear at least once in the `valid_city` vector from `zipcodes`. The
`valid_state` and `valid_name` vectors contain the columns from
`usps_state` and include territories not found in R’s build in
`state.abb` and `state.name` vectors.

``` r
sample_n(usps_street, 3)
#> # A tibble: 3 x 2
#>   abb     full    
#>   <chr>   <chr>   
#> 1 CV      COVE    
#> 2 MOUNTIN MOUNTAIN
#> 3 TRLS    TRAIL
sample_n(usps_state, 3)
#> # A tibble: 3 x 2
#>   abb   full          
#>   <chr> <chr>         
#> 1 NH    NEW HAMPSHIRE 
#> 2 NC    NORTH CAROLINA
#> 3 IN    INDIANA
setdiff(valid_state, state.abb)
#>  [1] "AS" "AA" "AE" "AP" "DC" "FM" "GU" "MH" "MP" "PW" "PR" "VI"
```

### Other

The `invalid_city` vector contains, appropriately, common invalid city
names, which can be passed to `normal_city()`.

The `rx_zip` and `rx_state` character strings are useful regular
expressions for extracting geographic data from a single string address,
data which can then be passed to `normal_zip()` and `normal_state()`.

``` r
print(rx_zip)
#> [1] "\\d{5}(?:-\\d{4})?$"
print(rx_state)
#> [:alpha:]+(?=\s+\d{5}(?:-\d{4})?$)
```

``` r
white_house <- "1600 Pennsylvania Ave NW, Washington, DC 20500-0003"
str_extract(white_house, pattern = rx_zip)
#> [1] "20500-0003"
str_extract(white_house, pattern = rx_state)
#> [1] "DC"
```

The `rx_phone` character string is another useful regular expression to
match US telephone numbers in a wide variety of common formats.

``` r
str_trunc(rx_phone, width = 80, side = "center")
#> [1] "^(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2...(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?$"
str_detect(c("1-800-555-1234", "(800) 555-1234", "8005551234 x567"), rx_phone)
#> [1] TRUE TRUE TRUE
```
