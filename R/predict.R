# Author: Ty Andrews
# Date: 2023-01-21


#' Predicts the price in USD of a Mercedes-Benz.
#'
#' @param model the model of the mercedes
#' @param year the year the car was made
#' @param odometer_mi the odomoteter reading of the vehicle
#' @param condition the physical condition of the vehicle, must be one
#'    of 'new', 'like new', 'excellent', 'good', 'fair', 'salvage'
#' @param paint_color the color the car is painted
#' @param version the model version to use, format 'vX'
#'
#' @return the price of the car as a float
#' @export
#'
#' @examples
#' price <- predict_mercedes_price("e-class", 2015, 55000, "fair", "silver")
predict_mercedes_price <- function(model, year, odometer_mi, condition, paint_color, version="v1") {

}
