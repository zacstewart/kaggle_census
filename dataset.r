wmae <- function(a, p, w) {
    return(sum(abs(a-p)*w)/sum(w))
}

appendNAs <- function(dataset, cols) {
  #append_these = data.frame( is.na(dataset[, cols] ))
  #names(append_these) = paste(names(append_these), "NA", sep = "_")
  #dataset = cbind(dataset, append_these)
  dataset[is.na(dataset)] = -1
  return(dataset)
}

print('Loading datasets...')
census.data <- read.csv('data/training.clean.csv')
test.census.data <- read.csv('data/test.clean.csv')

print('Converting types...')
for (i in 9:ncol(census.data)) {
  census.data[,i] = as.numeric(census.data[,i])
}

for (i in 9:ncol(test.census.data)) {
  test.census.data[,i] = as.numeric(test.census.data[,i])
}

predictors = c(names(census.data)[3],
               names(census.data)[9:(ncol(census.data)-2)])

print('Interpolating NA values and appended NA bools...')
census.data <- appendNAs(census.data, 9:ncol(census.data))
test.census.data <- appendNAs(test.census.data, 9:ncol(test.census.data))
