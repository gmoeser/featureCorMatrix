

#' Title
#'
#' @param listCorMatrix list with matrix values and matrix type
#'
#' @return heatmap plot corresponding to the matrix values
#' @export
#'
#' @examples
#'
plotFeatureCorMatrix <- function(listCorMatrix) {
  # transforms matrix to data.frame
  dt_corMatrix <- data.table::melt(result[[1]])
  # plot columns of data.frame
  ggplot2::ggplot(dt_corMatrix, ggplot2::aes(Var1, Var2, value)) +
    # plot rectangles
    ggplot2::geom_tile(ggplot2::aes(fill = value)) +
    # no background and plot boarder
    ggplot2::theme_bw() +
    # use nice colors
    ggplot2::scale_fill_gradient(low="white", high="darkgreen") +
    # start in the up left cornor (by reversing the y-axis)
    ggplot2::scale_y_discrete(limits = rev(levels(dt_corMatrix$Var2)))
}
