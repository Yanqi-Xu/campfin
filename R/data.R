#' @title US City, state, and ZIP
#' @description This tibble is the third version of a popular zipcodes database.
#'   The original CivicSpace US ZIP Code Database was created by Schuyler Erle
#'   using ZIP code gazetteers from the US Census Bureau from 1999 and 2000,
#'   augmented with additional ZIP code information from the Census Bureau’s
#'   TIGER/Line 2003 data set. The second version was published as the
#'   `zipcode::zipcode` dataframe object. This version has dropped the latitude
#'   and longitude, reorganized columns, and normalize the city values with
#'   [normal_city()].
#' @format A tibble with 44,336 rows of 3 variables:
#' \describe{
#'   \item{city}{Normalized city name.}
#'   \item{state}{Two letter state abbreviation.}
#'   \item{zip}{Five-digit ZIP Code.}
#'   ...
#' }
#' @source Daniel Coven's federalgovernmentzipcodes.us web site and the
#'   CivicSpace US ZIP Code Database written by Schuyler Erle
#'   <schuyler@@geocoder.us>, 5 August 2004. Original CSV files available from
#'   \url{http://federalgovernmentzipcodes.us/free-zipcode-database-Primary.csv},
#'   \url{http://www.boutell.com/zipcodes/}, and
#'   \url{http://mappinghacks.com/data/}.
"zipcodes"

#' @title USPS Street Abbreviations
#' @description A tibble containing common street suffixes or suffix
#'   abbreviations and their full equivalent. Useful as the `add_abbs` argument
#'   of [normal_address()].
#' @format A tibble with 325 rows of 3 variables:
#' \describe{
#'   \item{full}{Primary Street Suffix.}
#'   \item{abb}{Commonly Used Street Suffix or Abbreviation.}
#'   ...
#' }
#' @source USPS Appendix
#'    [C1 Street Abbreviations](https://pe.usps.com/text/pub28/28apc_002.htm).
"usps_street"

#' @title USPS City Abbreviations
#' @description A currated and edited subset of [usps_street] containing the
#'   USPS abbreviations found in city names. Useful as the `geo_abbs` argument
#'   of [normal_city()].
#' @format A tibble with 154 rows of 2 variables:
#' \describe{
#'   \item{full}{Primary Street Suffix}
#'   \item{abb}{Commonly Used Street Suffix or Abbreviation}
#'   ...
#' }
#' @source USPS Appendix C1,
#'    [Street Abbreviations](https://pe.usps.com/text/pub28/28apc_002.htm)
"usps_city"

#' @title USPS State Abbreviations
#' @description A tibble containing the USPS.
#' @format A tibble with 62 rows of 2 variables:
#' \describe{
#'   \item{full}{Primary Street Suffix}
#'   \item{abb}{Commonly Used Street Suffix or Abbreviation}
#'   ...
#' }
#' @source USPS Appendix B,
#'    [Two–Letter State Abbreviations](https://pe.usps.com/text/pub28/28apb.htm)
"usps_state"

#' @title US State Names
#' @description The `state` column of the `usps_state` tibble.
#' @details Contains 12 more names than [datasets::state.name].
#' @format A vectory of state names (length 62).
"valid_name"

#' @title US State Abbreviations
#' @description The `abb` column of the `usps_state` tibble.
#' @format A vector of 2-digit abbreviations (length 62).
"valid_state"

#' @title US City Names
#' @description The `city` column of the `zipcodes` tibble.
#' @format A sorted vector of unique city names (length 19,083).
"valid_city"

#' @title Invalid City Names
#' @description A custom vector containing common invalid city names.
#' @format A vector of length 54.
"invalid_city"

#' @title Almost all of the valid USA ZIP Codes
#' @description The `zip` column of the `geo` tibble.
#' @format A sorted vector of 5-digit ZIP codes (length 44334).
"valid_zip"

#' @title ZIP code regex
#' @description The regex string to extract ZIP code from the end of address.
#' @format A character string (length 1).
"rx_zip"

#' @title State regex
#' @description The regex string to extract state string preceding ZIP code.
#' @format A character string (length 1).
"rx_state"

#' @title Phone number regex
#' @description The regex string to match US phone numbers in a variety of
#'   common formats.
#' @format A character string (length 1).
"rx_phone"

#' @title URL regex
#' @description The regex string to match valid URLs.
#' @format A character string (length 1).
"rx_url"

#' @title Example Vermont Contributions
#' @description This randomly generated data frame shows some of the many
#'   formatting problems politicans, journalists, and political scientists will
#'   likely face when processing state level campaign finance data. Missing or
#'   invalid values, duplicate rows, negative amounts, questionable dates, and
#'   incredibly inconsistent string formatting. The functions in this package
#'   have been created to help import, explore, and clean this kind of data to
#'   increase public accountability.
#' @format A tibble with 10 rows of 10 variables:
#' \describe{
#'   \item{id}{A unique contribution ID.}
#'   \item{cand}{The reporting candidate.}
#'   \item{date}{The contribution date.}
#'   \item{amount}{The contribution amount.}
#'   \item{first}{The contributor's first name}
#'   \item{last}{The contribution's last name}
#'   \item{address}{The contributor's address}
#'   \item{city}{The contributor's city}
#'   \item{state}{The contributor's state}
#'   \item{zip}{The contributor's zip}
#'   ...
#' }
"vt_contribs"
