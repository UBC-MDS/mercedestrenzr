# Author: Kelly Wu
# Date: 2023-01-28

#' Return the top listings that are within the budget specified by the user.
#' The results are filtered by an optional input, model, and sorted by ascending price and another the specified feature in the sort_feature parameter.
#'
#' @param data data.frame The input dataframe containing listing and car attributes
#' @param budget number or numeric vector of length 2 The maximum budget, or the range of budget when passing a list.
#' @param model character The model of the car that the user is interested in. The default is to include listings of any model.
#' @param sort_feature character The numeric variable that the user is interested in using to sort the result. The default value is to sort by odometer value.
#' @param ascending bool Boolean value that indicate whether the sort is ascending. The default value is True.
#' @param price_col character Character value that indicate the column name of price column.
#' @param model_col character Character value that indicate the column name of model column.

#' @return data.frame A data frame of the sorted listings that matches user's expected budget range.
#' @importFrom  dplyr filter arrange mutate rename
#' @import rlang
#' @export
#' @examples
#' sample_data <- data.frame(condition = c("good", "average", "average", "new"),
#' price_USD = c(50000, 20000, 80000, 90000),
#' model = c("s-class", "glk", "gls", "gls"),
#' odometer_mi = c(12000, 30000, 35000, 150000),
#' year = c(2016, 2015, 2020, 2010))
#' listing_search(sample_data, budget=c(0, 30000), model = "any",
#' sort_feature = "odometer_mi", ascending = TRUE)
#' listing_search(sample_data, budget=50000, model = "gls",
#' sort_feature = "year", ascending = FALSE)

listing_search <- function(data, budget=c(0, Inf), model = "any",
                           sort_feature = "odometer_mi", ascending = TRUE,
                           price_col = "price_USD", model_col = "model") {

  # ===== Input checks =====
  # check input data is a dataframe
  if(!inherits(data, 'data.frame')){
    stop("The input dataset is not of R DataFrame format")
  }

  # check budget is a numeric value or a numeric vector of length 2
  if(!is.numeric(budget) | (length(budget) > 2)){
    stop("The budget should be a numeric value or a vector of 2 numeric values.")
  }

  # model= parameter input should be a string
  if(!is.character(model)){
    stop("The model parameter should have a string as the input")
  }

  # The string should correspond to a specific car model in the model column
  if(!(model %in% unique(data$model) | model == "any")){
    stop("The specified car model does not exist in the dataframe provided")
  }

  # sort_feature should be a string
  if(!is.character(sort_feature) | length(sort_feature) != 1){
    stop("The input value for sort_feature parameter should be a character value")
  }

  # sort_feature should indicate a numeric column in the provided data frame
  numeric_cols <- sapply(data, is.numeric)
  if(!sort_feature %in% names(numeric_cols)){
    stop("The specified sort_feature should be a numeric column in the provided dataframe.")
  }

  # ascending is either true or false
  if(!is.logical(ascending)){
    stop("Please specify TRUE or FALSE in the ascending parameter")
  }

  # price_col string
  if(!is.character(price_col)){
    stop("Please specify the price column name using a string, or use the default value.")
  }

  # model_col string
  if(!is.character(model_col)){
    stop("Please specify the model column name using a string, or use the default value.")
  }



  # ==== FUNCTION ====
  # filter by budget
  if(length(budget) == 1){ # max budget specified
    temp_df <- data |> dplyr::filter(!!sym(price_col) <= budget)
  }else{
    temp_df <- data |> dplyr::filter(!!sym(price_col) >= budget[[1]] & !!sym(price_col) <= budget[[2]])
  }

  # filter by model
  if(model != "any"){
    temp_df <- temp_df[temp_df[,model_col] == model,]
  }

  # sort by sort_feature & price
  if(ascending==TRUE){
    temp_df <- temp_df |> dplyr::arrange(!!sym(sort_feature), !!sym(price_col))
  }
  else{
    temp_df <- temp_df |> dplyr::arrange(desc(!!sym(sort_feature)), !!sym(price_col))
  }

  # order output
  priority_order <- c(price_col, model_col, sort_feature)
  remaining <- setdiff(names(data),priority_order)
  all_col <- c(priority_order,remaining)
  result <- temp_df[,all_col]

  result

  }



