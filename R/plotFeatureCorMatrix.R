

#' Title
#'
#' @param listCorMatrix list with matrix values and matrix type
#'
#' @return
#' @export
#'
#' @examples
#'
plotFeatureCorMatrix <- function(listCorMatrix) {
  heatmap(listCorMatrix[[1]], Rowv = NA, Colv = "Rowv", scale = "none")
}
