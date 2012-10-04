#!/usr/bin/env Rscript
source('dataset.r')

library('gbm')

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
