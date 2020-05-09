# featureMatrix
R package Feature Correlation Matrix

Status: First version (0.4.0) ready to get pushed to CRAN, minor changes under development already !

Authors:
Dr. Guido Möser/ Ilja Muhl (in alphabetical order)

Notes:
If you want to run the featureMatrix()-function, the two other functions, cv.test() and icc(), have to be available! 

What it does:
Estimates the correlation between categorical and numerical features (and the target variable)

Parameter:
- both variables numerical: Product-Moment-Correlation by Bravais-Pearson
- both variables categorical: Cramer's V (based on the Chi²-Test of Independence)
- one variable categorical and the other numerical: ICC (Intra-Class-Correlation) based on classical ANOVA by Fisher
