## makeCacheMatrix will create a special matrix object. This will be a list of functions that can cache its inverse. 
makeCacheMatrix <- function(x = numeric()) {
## nothing is cached at first so we set N to NULL
N <- NULL
## next store the inverse of the matrix
set <- function(Inverse) {
x <<- Inverse
N <<- NULL
}
## this will return the inverse of the matrix
getInverse <- function() {
x
}
cacheInverse <- function(solve) {
N <<- solve
}
## next we take the cached value
getInverse <- function() {
N
}
## return a list
## each element is a function for the matrix
list(set = set, getInverse = getInverse, cacheInverse = cacheInverse)
}
## solve function will solve for the inverse of the matrix if it does not exist
solve <- function(a, ...) {
## here we take the cached value and if the inverse is found the value is returned
inverse <- a$getInverse()
if(!is.null(inverse)) {
message("retrieving inverse")
return(inverse)
}
## if the inverse is not found we take the matrix and solve for the value
data <- a$getInverse()
inverse <- solve(data)
a$cacheInverse(inverse)
inverse
}
