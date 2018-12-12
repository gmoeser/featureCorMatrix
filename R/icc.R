#' Intraclass Correlation (ICC)
#'
#' \code{icc} returns the intraclass correlation coefficient
#'
#' The function calculates the Intraclass Correlation Coefficient
#' based on the results of the aov() function

## Function to calculate the ICC based on an Analysis of Variance (aov)
icc <- function(depvar, indvar) {
  # depvar should be measurement level scale
  # indvar should be measurement level categorical
  formulaVar <- formula(paste("depvar"," ~ ", "indvar"))
  sumSq <- anova(aov(formulaVar))$`Sum Sq`
  icc <- sqrt(sumSq[1]/sum(sumSq))
  return(icc)
  }

