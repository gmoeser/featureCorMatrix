#' Cramer's V
#'
#' \code{cv.test} returns the Cramer's V correlation coefficient
#'
#' The function calculates Cramer's V based on the results
#' of an Chi-Square-Test of Independence between two
#' categorical variables
#' @param x a vector (categorical or numerical values)
#' @param y a vector (categorical or numerical values)
#'
#' @return Cramer's V
#' @export
#'
#' @examples
#'cv.test(x = iris$Species, iris$Sepal.Length)

# Function Cramer's V ------------------------------------------------------

## Cramer's V is not implemented in R base package

# Update necessary: Violation of assumptions of Chi²-Test!
cv.test = function(x,y) {
  CV = sqrt(suppressWarnings(chisq.test(x, y, correct=FALSE))$statistic /
    (length(x) * (min(length(unique(x)),length(unique(y))) - 1)))
  return(as.numeric(CV))
}
