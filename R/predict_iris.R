

target_raw <- iris$Species
iris_levels <- levels(target_raw)
# target_int <- as.integer(target_raw) - 1
#
# total_matrix <- model.matrix(~.-1-Species, data = iris)
#
# dtrain <- xgb.DMatrix(data = total_matrix, label = target_int)
# watchlist = list(train = dtrain)
# param <- list(max_depth = 3, num_class = 3, eta = 0.05,
#               min_child_weight = 2, subsample = 0.5, colsample=1, silent = 1, nthread = 2,
#               objective = "multi:softprob", eval_metric = "merror")
# model_iris <- xgb.train(params = param, data = dtrain, nrounds = 400, watchlist = watchlist, print_every_n = 25)
#
# devtools::use_data(model_iris, iris_levels, internal = TRUE, overwrite = TRUE)

#' @export
predict_iris <- function(Sepal.Length = 0, Sepal.Width = 0, Petal.Length = 0, Petal.Width = 0) {
  data_pred <- c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
  data_pred <- matrix(data_pred, nrow = 1)
  prob <- predict(object = model_iris, newdata = data_pred)
  label = iris_levels[which.max(prob)]
  return(list(label = label, prob = prob))
}
