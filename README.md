
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

Our package is the first package in cran that focus on analyzing the
market trend of Mercedes-Benz. This is a pilot project on streamlining
the data analysis process of used cars market. This package could serve
as the foundation for bigger projects in the future that extend the
scope beyond a single car brand and leverage web scrapping techniques to
enhance the dataset.

# Functions

The package contains the following functions:

1.  `plot_mercedes_price`: Plot a density plot of a Mercedes-Benz model
    to see where the current vehicle’s price falls for that same model
    in the market.

2.  `listing_search`: Retrieves the top listings that are within the
    budget range specified by the user.

3.  `predict_mercedes_price`: Predicts the price in USD of a
    Mercedes-Benz given the year, model, condition, and number of
    cylinders.

4.  `important_mercedes_features`: Returns the features (i.e. data
    columns) that are important to determining predicted mercedes
    pricing.

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

# Usage

This is a basic example which shows you how to solve a common problem:

``` r
library(mercedestrenzr)
#> Warning: replacing previous import 'dplyr::filter' by 'stats::filter' when
#> loading 'mercedestrenzr'
#> Warning: replacing previous import 'dplyr::lag' by 'stats::lag' when loading
#> 'mercedestrenzr'
#> Warning: replacing previous import 'dplyr::slice' by 'xgboost::slice' when
#> loading 'mercedestrenzr'

# load sample data from package
summary(mercedes_data)
#>       ...1        price_USD          condition         paint_color       
#>  Min.   :   0   Min.   :0.000e+00   Length:8553        Length:8553       
#>  1st Qu.:2138   1st Qu.:6.500e+03   Class :character   Class :character  
#>  Median :4276   Median :1.790e+04   Mode  :character   Mode  :character  
#>  Mean   :4276   Mean   :7.273e+05                                        
#>  3rd Qu.:6414   3rd Qu.:3.000e+04                                        
#>  Max.   :8552   Max.   :3.025e+09                                        
#>                                                                          
#>     model            odometer_mi           year      num_cylinders     
#>  Length:8553        Min.   :      0   Min.   :1929   Length:8553       
#>  Class :character   1st Qu.:  36525   1st Qu.:2011   Class :character  
#>  Mode  :character   Median :  68376   Median :2014   Mode  :character  
#>                     Mean   :  75356   Mean   :2013                     
#>                     3rd Qu.:  99838   3rd Qu.:2017                     
#>                     Max.   :9999999   Max.   :2021                     
#>                     NA's   :150                                        
#>      fuel           transmission          drive               size          
#>  Length:8553        Length:8553        Length:8553        Length:8553       
#>  Class :character   Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
#>                                                                             
#>                                                                             
#>                                                                             
#>                                                                             
#>      type              state               VIN            title_status      
#>  Length:8553        Length:8553        Length:8553        Length:8553       
#>  Class :character   Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
#>                                                                             
#>                                                                             
#>                                                                             
#>                                                                             
#>  description       
#>  Length:8553       
#>  Class :character  
#>  Mode  :character  
#>                    
#>                    
#>                    
#> 

# filter listings based on budget range of characteristics of interest
result <- listing_search(mercedes_data, budget=c(0, 30000), 
                         model = "any", sort_feature = "odometer_mi",
                         ascending = TRUE)
head(result[, 1:5], 5)
#> # A tibble: 5 × 5
#>   price_USD model    odometer_mi  ...1 condition
#>       <dbl> <chr>          <dbl> <dbl> <chr>    
#> 1         0 e-class            0  1599 excellent
#> 2         0 sl-class           0  3528 used     
#> 3      4999 c-class            0  2493 excellent
#> 4      4999 c-class            0  2494 excellent
#> 5     11900 m-class            0   686 excellent

# visualizing the price distribution
plot_mercedes_price('c-class', 30000, mercedes_data)
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

# predict how much a car would be using regression model 
# and show important features
price <- predict_mercedes_price("e-class", 2015, 55000, "fair", "silver")
price
#> # A tibble: 1 × 1
#>   predicted_price_USD
#>                 <dbl>
#> 1              11069.
```

## Code of Conduct

Please note that the mercedestrenzr project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## Contributing

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.
