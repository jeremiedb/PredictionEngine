# Data prep

# target_raw <- iris$Species
# iris_levels <- levels(target_raw)
# target_int <- as.integer(target_raw) - 1
#
# total_matrix <- model.matrix(~.-1-Species, data = iris)
#
# dtrain <- xgboost::xgb.DMatrix(data = total_matrix, label = target_int)
# watchlist = list(train = dtrain)
# param <- list(max_depth = 3, num_class = 3, eta = 0.05,
#               min_child_weight = 2, subsample = 0.5, colsample=1, silent = 1, nthread = 2,
#               objective = "multi:softprob", eval_metric = "merror")
# model_iris <- xgboost::xgb.train(params = param, data = dtrain, nrounds = 400, watchlist = watchlist, print_every_n = 25)
#
# # Serialize DCGAN model
# G_sym <- mxnet::mx.symbol.load("C:/Data/GitHub/gan_example/models/G_sym_model_v1.json")
# G_arg_params <- mxnet::mx.nd.load("C:/Data/GitHub/gan_example/models/G_arg_params_v1.params")
# G_aux_params <- mxnet::mx.nd.load("C:/Data/GitHub/gan_example/models/G_aux_params_v1.params")
#
# dcgan_model <- list()
# dcgan_model[['symbol_json']] <- G_sym$as.json()
# dcgan_model[['arg.params']] <- lapply(G_arg_params, as.array)
# dcgan_model[['aux.params']] <- lapply(G_aux_params, as.array)
#
# devtools::use_data(model_iris, iris_levels, internal = TRUE, overwrite = TRUE)
