#' Load a Matrix
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the row names and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kept.
#'
#' @param infile Path to the input file
#' @return A matrix of the input file
#' @export
load_mat <- function(infile){
  in.dt <- data.table::fread(infile, header = TRUE)
  in.dt <- in.dt[!duplicated(in.dt[, 1]), ]
  in.mat <- as.matrix(in.dt[, -1, with = FALSE])
  rownames(in.mat) <- unlist(in.dt[, 1, with = FALSE])
  in.mat
}
