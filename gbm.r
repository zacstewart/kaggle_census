#!/usr/bin/env Rscript
library('gbm')

print('Loading datasets...')
census.data <- read.csv('data/training_filev1.csv')
test.census.data <- read.csv('data/test_filev1.clean.csv')

print('Converting types...')
for (i in 9:ncol(census.data)) {
  census.data[,i] = as.numeric(census.data[,i])
}

for (i in 9:ncol(test.census.data)) {
  test.census.data[,i] = as.numeric(test.census.data[,i])
}

predictors = c(names(census.data)[3],
               names(census.data)[9:(ncol(census.data)-2)])

gbm.census.formula = as.formula(paste('Mail_Return_Rate_CEN_2010 ~',
                                      paste(predictors, collapse=" + ")))

print('Training GBM...')
gbm.model <- gbm(gbm.census.formula, n.trees=7500, data=census.data,
             distribution='gaussian', interaction.depth=6,
             train.fraction=.8, cv.folds=5)

print('Predicting...')
gbm.best.iter <- gbm.perf(gbm.model, method='cv')
predictions <- predict(gbm.model, newdata=test.census.data, gbm.best.iter)
write.csv(predictions, 'predictions/r-gbm.csv', row.names=FALSE)
summary(gbm.model)
