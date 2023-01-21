
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mercedestrenzr

<!-- badges: start -->
<!-- badges: end -->

The goal of mercedestrenzr is to inspect and analyze used Mercedes Benz
car prices. The package helps users to get simple answers on how to
choose the used Mercedes Benz car in the market. The package also
includes useful visualization tool and trained model to serve buyers and
sellers.

# Collaborators

Kelly Wu, Morris Zhao, Spencer Gerlach, Ty Andrews

# R ecosystem

Our package is unique in the r package ecosystem. It provides an easy
way to investigate used Mercedes Benz car prices. It provide people a
big picture about the market. The package is rely on the real market
data set to plot, filter and predict. It also gives advice to buyers and
seller when they try to make a decision.

# Functions

The package contains the following functions:

1.  `load_sample_mercedes_listings`: Retrieves a data frame that
    containing sample data of used Mercedez Benz vehicles.

2.  `plot_mercedes_price`: Plot a density plot of a Mercedes-Benz model
    to see where the current vehicle’s price falls for that same model
    in the market.

3.  `listing_search`: Retrieves the top listings that are within the
    budget range specified by the user.

4.  `predict_mercedes_price`: Predicts the price in USD of a
    Mercedes-Benz given the year, model, condition, and number of
    cylinders.

# Package dataset

The package contains a static dataset for Craiglist used-car listings
that were previously web scraped. Several key attributes about the
used-car are available in the dataset, such as vehicle prices, models,
car conditions, odometer readings, VINs, regions and transmission. The
package’s dataset was adapted from verison 10 of the raw dataset created
by [AustinReese](https://github.com/AustinReese/UsedVehicleSearch).

# Installation

You can install the development version of mercedestrenzr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/mercedestrenzr")
```

# Usage (TO BE COMPLETED once the function codes are added)

This is a basic example which shows you how to solve a common problem:

``` r
#library(mercedestrenzr)
## basic example code

# load sample data from package

# filter listings based on budget range of characteristics of interest
#listing_search(data, budget=c(0, 30000), model = "any", sort_feature = "odometer", ascending = TRUE)

# visualizing the price distribution

# predict how much a car would be using regression model
```

# Contributing

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.
