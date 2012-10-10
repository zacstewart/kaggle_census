source('dataset.r')
library('gbm')
library('cvTools')


gbm.census.formula = as.formula(paste('Mail_Return_Rate_CEN_2010 ~',
                                      paste(predictors, collapse=" + ")))

set.seed(1234)
n <- nrow(census.data)
k <- 5
f <- cvFolds(n, K=k)

pass1.features = data.frame()
for (i in 1:k) {
  indices   <- f$which == i
  construct <- census.data[-indices,]
  cv        <- census.data[indices,]

  print('Training GBM...')
  cv.gbm.model <- gbm(gbm.census.formula, n.trees=7500, data=construct,
               distribution='gaussian', interaction.depth=6,
               train.fraction=.8, cv.folds=5)
  print('Predicting...')
  gbm.best.iter <- gbm.perf(cv.gbm.model, method='cv')
  cv.gbm.preds <- predict(cv.gbm.model, newdata=cv, gbm.best.iter)
  pass1.features <- rbind(pass1.features,
                          data.frame(targets     = cv$Mail_Return_Rate_CEN_2010,
                                     predictions = cv.gbm.preds,
                                     weight      = cv$weight))
}
cv.wmae <- wmae(pass1.features$targets, pass1.features$predictions, pass1.features$weight)
print(paste('CV WMAE:', cv.wmae))
write.csv(pass1.features, 'pass1features/r-gbm.csv', row.names=FALSE)

cv.gbm.model <- gbm(gbm.census.formula, n.trees=7500, data=census.data,
             distribution='gaussian', interaction.depth=6,
             train.fraction=.8, cv.folds=5)
gbm.best.iter <- gbm.perf(gbm.model, method='cv')
predictions <- predict(gbm.model, newdata=test.census.data, gbm.best.iter)
write.csv(predictions, 'predictions/r-gbm.csv', row.names=FALSE)
summary(gbm.model)
