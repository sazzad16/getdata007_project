change.featurename <- function(x) {
    x <- sub("^t", "Time", x)
    x <- sub("^f", "Frequency", x)
    x <- sub("\\-mean\\()", "Mean", x)
    x <- sub("\\-std\\()", "StandardDeviation", x)
    x <- gsub("[-()]", "", x)
    x
}