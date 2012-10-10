source('dataset.r')
library('randomForest')
library('cvTools')

set.seed(1234)
n <- nrow(census.data)
k <- 5
f <- cvFolds(n, K=k)

pass1.features = data.frame()
for (i in 1:k) {
  indices   <- f$which == i
  construct <- census.data[indices,]
  cv        <- census.data[-indices,]

  print('Training cv random forest...')
  cv.rf.model <- randomForest(construct[,9:(ncol(construct)-2)],
                              construct$Mail_Return_Rate_CEN_2010,
                              sampsize=nrow(construct)*.75,
                              ntree=500, do.trace=TRUE)

  cv.rf.preds <- predict(cv.rf.model, newdata=cv)
  pass1.features <- rbind(pass1.features,
                          data.frame(targets     = cv$Mail_Return_Rate_CEN_2010,
                                     predictions = cv.rf.preds,
                                     weight      = cv$weight))
}
cv.wmae <- wmae(pass1.features$targets, pass1.features$predictions, pass1.features$weight)
print(paste('CV WMAE:', cv.wmae))
write.csv(pass1.features, 'pass1features/r-random_forest.csv', row.names=FALSE)

print('Training random forest..')
rf.model <- randomForest(census.data[,9:(ncol(census.data)-2)],
                         census.data$Mail_Return_Rate_CEN_2010,
                         sampsize=nrow(census.data)*.75,
                         ntree=500, do.trace=TRUE)

print('Predicting...')
predictions <- predict(rf.model, newdata=test.census.data)
write.csv(predictions, 'predictions/r-random_forest.csv', row.names=FALSE)
