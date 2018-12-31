

#' Title
#'
#' @param listCorMatrix
#'
#' @return
#' @export
#'
#' @examples
#'
plotFeatureCorMatrix <- function(listCorMatrix) {
  heatmap(listCorMatrix[[1]], Rowv = NA, Colv = "Rowv", scale = "none")
}
