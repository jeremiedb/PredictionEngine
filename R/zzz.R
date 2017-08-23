
.onLoad <- function(libname, pkgname){
  dcgan_symbol <<- mxnet::mx.symbol.load.json(dcgan_model$symbol_json)
  dcgan_arg.params <<- lapply(dcgan_model$arg.params, mxnet::mx.nd.array)
  dcgan_aux.params <<- lapply(dcgan_model$aux.params, mxnet::mx.nd.array)
}
