# Author: Ty Andrews
# Date: 2023-01-28


# Test that the model returns numeric values
test_that("Expected exception was not raised", {
  expect_type(
    predict_mercedes_price(
      model = "e-class",
      year = 1979,
      odometer_mi = 10000,
      condition = "new",
      paint_color = "red"
    )[[1]], "double")
  expect_type(
    predict_mercedes_price(
      "e-class",
      1979,
      10000,
      "new",
      "red"
    )[[1]], "double")
})

# Test when model is an integer, the function will throw an error
test_that("Expected exception was not raised", {
  expect_error(
    predict_mercedes_price(
      model = 12345,
      year = 1979,
      odometer_mi = 10000,
      condition = "new",
      paint_color = "red"
    ), "The first input should be a character contain the specific model")
  expect_error(
    predict_mercedes_price(
      12345,
      1979,
      10000,
      "new",
      "red"
    ), "The first input should be a character contain the specific model")
})

# Test when year is not a number
test_that("Expected exception was not raised", {
  expect_error(
    predict_mercedes_price(
      model = "e-class",
      year = "not-a-number",
      odometer_mi = 10000,
      condition = "new",
      paint_color = "red"
    ), "The second input should be the year of the car as a whole number, e.g. 1979")
  expect_error(
    predict_mercedes_price(
      "e-class",
      "not-a-number",
      10000,
      "new",
      "red"
    ), "The second input should be the year of the car as a whole number, e.g. 1979")
})

# Test when odometer_mi is not a number
test_that("Expected exception was not raised", {
  expect_error(
    predict_mercedes_price(
      model = "e-class",
      year = 1979,
      odometer_mi = "not-a-number",
      condition = "new",
      paint_color = "red"
    ),"The third input should be the miles on the odometer as whole number.")
  expect_error(
    predict_mercedes_price(
      "e-class",
      1979,
      "not-a-number",
      "new",
      "red"
    ), "The third input should be the miles on the odometer as whole number.")
})

# Test when condition is not a character
test_that("Expected exception was not raised", {
  expect_error(
    predict_mercedes_price(
      model = "e-class",
      year = 1979,
      odometer_mi = 10000,
      condition = 123,
      paint_color = "red"
    ),"The forth input should be the condition of the car as characters, one of salvage, used, fair, good, excellent, like new, new")
  expect_error(
    predict_mercedes_price(
      "e-class",
      1979,
      10000,
      123,
      "red"
    ), "The forth input should be the condition of the car as characters, one of salvage, used, fair, good, excellent, like new, new")
})

# Test when conditions is not a valid value
test_that("Expected exception was not raised", {
  expect_error(
    predict_mercedes_price(
      model = "e-class",
      year = 1979,
      odometer_mi = 10000,
      condition = "dummy",
      paint_color = "red"
    ),"The forth input should be one of salvage, used, fair, good, excellent, like new, new")
  expect_error(
    predict_mercedes_price(
      "e-class",
      1979,
      10000,
      "dummy",
      "red"
    ), "The forth input should be one of salvage, used, fair, good, excellent, like new, new")
})

# Test when paint_color is not a character
test_that("Expected exception was not raised", {
  expect_error(
    predict_mercedes_price(
      model = "e-class",
      year = 1979,
      odometer_mi = 10000,
      condition = "used",
      paint_color = 123
    ),"The fifth input should be the color of the car as a character, e.g. 'red'")
  expect_error(
    predict_mercedes_price(
      "e-class",
      1979,
      10000,
      "used",
      123
    ), "The fifth input should be the color of the car as a character, e.g. 'red'")
})

# Test when odometer_mi is negative
test_that("Expected exception was not raised", {
  expect_error(
    predict_mercedes_price(
      model = "e-class",
      year = 1979,
      odometer_mi = -10000,
      condition = "used",
      paint_color = "red"
    ),"The odometer_mi must be greater than 0")
  expect_error(
    predict_mercedes_price(
      "e-class",
      1979,
      -10000,
      "used",
      "red"
    ), "The odometer_mi must be greater than 0")
})



