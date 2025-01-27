#' @title Glimpse Column Count Functions
#' @description Apply a counting summary function like [dplyr::n_distinct()] or
#'   [count_na()] to every column of a dataframe and return the results along
#'   with a _percentage_ of that value.
#' @param data A data frame to glimpse.
#' @param fun A function to map to each column.
#' @param print logical; Should all columns be printed as rows?
#' @return A tibble with a row for every column and new columns with count and
#'   proportion.
#' @examples
#' glimpse_fun(dplyr::storms, dplyr::n_distinct)
#' glimpse_fun(dplyr::storms, campfin::count_na)
#' @importFrom purrr map
#' @importFrom dplyr mutate select
#' @importFrom tibble enframe
#' @importFrom pillar new_pillar_type
#' @export
glimpse_fun <- function(data, fun, print = TRUE) {
  summary <- data %>%
    purrr::map_dbl({{ fun }}) %>%
    tibble::enframe(name = "col", value = "n") %>%
    dplyr::mutate(p = .data$n / nrow(data)) %>%
    dplyr::mutate(type = format(purrr::map(data, pillar::new_pillar_type))) %>%
    dplyr::select(.data$col, .data$type, .data$n, .data$p)
  if (print) {
    print(summary, n = length(data))
  }
}
