#' Feature Correlation Matrix.
#'
#' \code{featureCorMatrix} returns a correlation matrix between all features
#'
#' The function selects automatically the appropriate correlation
#' coefficient regarding the storage type of both variables
#' If both variable are numerical ones, the PM correlation coefficient will be chosen
#' If both variables are categorical, Cramer's V will be used
#' If one variable is a numerical and the other a categorical one, the ICC will be calculated

# Function Feature Matrix  ------------------------------------------------------

# some important notes:
# warnings due to violation of assumptions in Chi²-Test are suppressed (in cv.test()-function)
# cor()-function is used with setting: use = "pairwise.complete.obs"
# these settings can be changed in coming versions

featureCorMatrix <- function(dataframe, absoluteValues = FALSE) {
  ## data set is stored in object df
  df <- dataframe

  ## check if object is data.frame
  if (!is.data.frame(df)) {
    warning("argument is not a data.frame")
    return(NA_real_)
  }

  ## define some objects
  # number of features
  numFeature <- ncol(df)
  # empty matrix for Type of Correlation
  corrTypeMatrix <- matrix(nrow = numFeature, ncol = numFeature)
  # empty matrix for value
  correlationMatrix <- matrix(nrow = numFeature, ncol = numFeature)
  # row and column names
  rowName <- names(df)
  colName <- names(df)

  ## processing correlation and type matrices
  for (row in 1:numFeature) {
    for (col in 1:numFeature) {
      rowFeature <- df[[row]]
      colFeature <- df[[col]]
      if (is.numeric(rowFeature)) {
        if (is.numeric(colFeature)) {
          correlationMatrix[row,col] <- cor(rowFeature,colFeature,use = "pairwise.complete.obs")
          corrTypeMatrix[row,col] <- "cor"
        }
        else { # num row, cat col
          correlationMatrix[row, col] <- icc(depvar = df[[row]], indvar = df[[col]])
          corrTypeMatrix[row,col] <- "icc"
        }
      }
      else {
        if (is.numeric(colFeature)) {
          correlationMatrix[row, col] <- icc(depvar = df[[col]], indvar = df[[row]])
          corrTypeMatrix[row,col] <- "icc"
        }
        else {
          cramersv <- cv.test(rowFeature,colFeature)
          correlationMatrix[row,col] <- cramersv
          corrTypeMatrix[row,col] <- "cramersV"
        }
      }
    }
  }

  ## set column names
  # correlation matrix
  colnames(correlationMatrix) <- colName
  rownames(correlationMatrix) <- rowName
  # type matrix
  colnames(corrTypeMatrix) <- colName
  rownames(corrTypeMatrix) <- rowName

  ## return absolute values?
  if (absoluteValues) {
    correlationMatrix <- abs(correlationMatrix)
  }

  ## return results in a list
  featureMatrix.list <- list(correlationMatrix = correlationMatrix, corrTypeMatrix = corrTypeMatrix)

  }
