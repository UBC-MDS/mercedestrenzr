# Author: Spencer Gerlach
# Date: 2023-01-21

#' Return features important to the determination of predicted mercedes pricing.
#'
#' @param data input data with columns (i.e. "features"). Should be the same data used to train the prediction model.
#' @param model model used to create the predicted mercedes price.
#' @param ascending when ascending=FALSE, feature importances are returned from highest to lowest importance.
#'
#' @return a visualization chart/table of sorted feature importances.
#' @export
#'
#' @examples feature_importance_plot <- important_mercedes_features(X_train, model_XGboost)
important_mercedes_features <- function(data, model, ascending = FALSE) {

}
