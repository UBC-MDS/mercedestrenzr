% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict.R
\name{predict_mercedes_price}
\alias{predict_mercedes_price}
\title{Predicts the price in USD of a Mercedes-Benz.}
\usage{
predict_mercedes_price(
  model,
  year,
  odometer_mi,
  condition,
  paint_color,
  version = "v1"
)
}
\arguments{
\item{model}{the model of the mercedes, character}

\item{year}{the year the car was made, integer}

\item{odometer_mi}{the odomoteter reading of the vehicle, integer}

\item{condition}{the physical condition of the vehicle, must be one
of 'new', 'like new', 'excellent', 'good', 'fair', 'salvage', character}

\item{paint_color}{the color the car is painted, character}

\item{version}{the model version to use, format 'vX', character}
}
\value{
the price of the car as a numeric
}
\description{
Predicts the price in USD of a Mercedes-Benz.
}
\examples{
price <- predict_mercedes_price("e-class", 2015, 55000, "fair", "silver")
}
