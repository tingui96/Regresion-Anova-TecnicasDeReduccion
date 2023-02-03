# Regresion-Anova-TecnicasDeReduccion

In this research project we aim to put into practice knowledge
learned during the statistics course. For this we use linear regression techniques.
multiple, analysis of variance (anova), principal component analysis. To bring about
the task, we have a dataset that contains information on direct marketing campaigns
from a Portuguese banking institution.

# Anova

First, we perform an analysis of variance (ANOVA) to identify how they influence certain factors that we will explain in the duration of the campaigns.
Our null hypothesis will be that all duration means are equal. We will work with the 3 marital statuses, married, single and divorced.
We use as variables Marital, Age, Job, Education and Balance, which are the most influential (blocks).

# Classification Techniques

For this analysis we will use cluster techniques, first the hierarchical cluster and then the k-means algorithm.
When loading the data of our dataset we realized that it was very large and had a high computational cost, so we reduced the sample by ¼.

# Linear regression

What you want to find out is if the balance of the contact has any relationship with the variables age and job.
We will use the method backward. The first thing would be to make a scatter plot to be sure that it makes sense to do a linear regression.
In addition, we can calculate the correlation matrix of the data, in case that the diagram is not enough.

# Let's interpret the output of Regression R Residuals

● Residuals: Here you can see the summary of the residuals, the error between the prediction of the model and actual results.
The smaller the waste, the better.
● Coefficients: For each independent variable and the intercept we have:
○ Estimate: Estimated. This is the value of the 𝛽𝑗
○ Std. Error: Standard Error. It gives us the precision of the estimator. Useful for calculating the t-value.
○ t-value and Pr(>[t]): It is really important since it is a way to measure if the variable in question or the intercept contribute something
significant to the model. The t-value is calculated by dividing the coefficient by the standard error and then is used to pose a hypothesis test
where it measures whether the coefficient is different from 0. If it is not significant, then the coefficient is not contributing
nothing to the model so the variable could be removed, and this is one of the ways to remove variables from the model. For Pr(>[t]) to be significant
it has to be less than 0.05.
● Performance Measures: As the name indicates, they show how good the line is of regression.
○ Residual Standard Error: Standard error of the residuals The smaller the better.
○ Multiple / Adjusted R-Square: When we work with a single variable independent does not matter the distinction between the R-square or R-square. Is
measure tells us the amount of variation explained in the model. The R-squared adjusted takes into account the number of independent variables,
therefore it is the most used in multiple regression. The closer this value is to one, the it will be better. If it is below 0.70 then the model is very bad,
which meets our model.
○ F-Statistic: The F test says if at least one of the 𝛽𝑗 is significantly different from zero. This is a global hypothesis test to be able to assess the
model. If the p-value is not significant (that is, it is greater than 0.05) then our model is not doing anything. It gives us a value of 4.883e-09, so
it is very significant.

# Analyzing the Residues
In general we have to analyze four issues regarding waste.
● The mean of the errors is zero and the sum of the errors is zero
● Errors have normal distribution
● Errors are independent
● The variance of the errors is constant (Homoscedasticity)
