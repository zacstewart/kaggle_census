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
