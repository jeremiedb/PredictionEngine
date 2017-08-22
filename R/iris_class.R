

# target_raw <- iris$Species
# levels(target_raw)
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
# devtools::use_data(model_iris, internal = TRUE, overwrite = TRUE)


#' @export
predict_iris <- function(v1=1, v2=1, v3=1, v4=1) {
  data_pred <- c(v1, v2, v3, v4)
  data_pred <- matrix(c(v1, v2, v3, v4), nrow=1)
  prediction <- predict(object = model_iris, newdata = data_pred)
}
