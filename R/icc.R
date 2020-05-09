#' Intraclass Correlation (ICC)
#'
#' \code{icc} returns the intraclass correlation coefficient
#'
#' The function calculates the Intraclass Correlation Coefficient
#' based on the results of the aov() function
#' @param depvar dependent variable, must be numeric
#' @param indvar independent variable, must be categorical
#'
#' @return returns the intraclass correlation coefficient (ICC)
#' @export
#'
#' @examples
#' icc(depvar = iris$Sepal.Length, indvar = iris$Species)

## Function to calculate the ICC based on an Analysis of Variance (aov)
icc <- function(depvar, indvar) {
  # depvar should be measurement level scale
  # indvar should be measurement level categorical
  formulaVar <- stats::formula(paste("depvar"," ~ ", "indvar"))
  sumSq <- stats::anova(stats::aov(formulaVar))$`Sum Sq`
  icc <- base::sqrt(sumSq[1]/sum(sumSq))
  return(icc)
  }

