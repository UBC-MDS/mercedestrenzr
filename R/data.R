# Author: Kelly Wu
# Date: 2023-01-20

#' Return the top listings that are within the budget specified by the user.
#' The results are filtered by an optional input, model, and sorted by ascending price and another the specified feature in the sort_feature parameter.

#' @param data data.frame The input dataframe containing listing and car attributes
#' @param budget number or numeric vector of length 2 The maximum budget, or the range of budget when passing a list.
#' @param model character The model of the car that the user is interested in. The default is to include listings of any model.
#' @param sort_feature character The numeric variable that the user is interested in using to sort the result. The default value is to sort by odometer value.
#' @param ascending bool Boolean value that indicate whether the sort is ascending. The default value is True.
#'
#' @return data.frame A data frame of the sorted listings that matches user's expected budget range.
#'
#' @examples
#' listing_search(data, budget=c(0, 30000), model = "any", sort_feature = "odometer", ascending = TRUE)
#' listing_search(data, budget=50000, model = "gls", sort_feature = "year", ascending = FALSE)

listing_search <- function(data, budget=c(0, Inf), model = "any", sort_feature = "odometer", ascending = TRUE) {

}
