
#' @export
dcgan <- function(digit = 0, samples = 1, ctx = mxnet::mx.cpu()) {

  digit <- mxnet::mx.nd.array(rep(digit, times = 64))
  data <- mxnet::mx.nd.one.hot(indices = digit, depth = 10)
  data <- mxnet::mx.nd.reshape(data = data, shape = c(1,1,-1, 64))

  exec_G <- mxnet::mx.simple.bind(symbol = dcgan_symbol, data = c(1, 1, 10, 64), ctx = ctx, grad.req = "null")
  mxnet::mx.exec.update.arg.arrays(exec_G, dcgan_arg.params, match.name=TRUE)
  mxnet::mx.exec.update.arg.arrays(exec_G, list(data=data), match.name=TRUE)
  mxnet::mx.exec.update.aux.arrays(exec_G, dcgan_aux.params, match.name=TRUE)

  mxnet::mx.exec.forward(exec_G, is.train=F)

  img <- as.array(exec_G$ref.outputs$G_sym_output)[,,,1]

  return(plot(imager::as.cimg(img), axes=F))
}
