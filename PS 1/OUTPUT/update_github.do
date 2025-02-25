cd "C:\Users\jacop\OneDrive - Università Commerciale Luigi Bocconi\Documenti\GitHub\Microeconometrics\PS 1\OUTPUT"

use "C:\Users\jacop\OneDrive - Università Commerciale Luigi Bocconi\Documenti\GitHub\Microeconometrics\PS 1\OUTPUT\jtrain2.dta", clear

save "C:\Users\jacop\OneDrive - Università Commerciale Luigi Bocconi\Documenti\GitHub\Microeconometrics\PS 1\OUTPUT\jtrain2_modified.dta", replace

// Push changes to GitHub

shell git add .

shell git commit -m "Auto update: Latest changes from Stata"

shell git push origin main


*We will run different balance tests for the given covariates: age educ black hisp nodegree re74 re75.\\ In order to understand the balance between the treatment and control groups for these different regressors we need to look at the p-value for the t ratio of interest which analyses under the null the hypothesis of no significant difference between the means of the variables computed from the two groups (treatment and control).\\

ttest age, by(train)

ttest educ, by(train)

ttest black, by(train)

ttest hisp, by(train)

ttest nodegree, by(train)

ttest re74, by(train)

ttest re75, by(train)

*Following the different tests, we notice that for the variables age, educ, black, hisp, re74 and re75 the balance tests give us a p-value greater than any alpha percent level, thus for these variables we can state that the null hypothesis of equality of the means between the treatment and control group based on the regressor is confirmed.\\ There is only one variable which p-value drop estimate_trainre78
*is less than the 0.05 conventional alpha percent level, namely nodegree.\\ However, we can reasonably expect that when accounting for many regressors, one of them could result unbalanced between the groups as the tests are based on a sample of thw whole population and thus exact randomness of treatment and control cannot be assured for all variables. Despite this limitation, having that so many variables are balanced across  groups, we can say that generally the two groups are "as good as random".\\

regress re78 train
predict estimate_trainre78
predict se_trainre78, stdp

*We can observe that the coefficient of the treatment group on our outcome variable of interest re78 (real salaries in $) is positive and significant and its difference compared to the control group is of 1.79 rounded down. The constant term represents the coefficient of the control group, the people who did not receive the treatment and again it is significant at any confidence level.\\

