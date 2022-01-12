## makeCacheMatrix will create a special matrix object. This will be a list of functions that can cache its inverse. 
makeCacheMatrix <- function(x = numeric()) {
## nothing is cached at first so we set N to NULL
N <- NULL
## next store a matrix
setMatrix <- function(newValue) {
x <<- newValue
## since the matrix is assigned a new value, flush the cache N
N <<- NULL
}
## this will return the stored matrix
getMatrix <- function() {
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
list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}
## cacheSolve function will solve for the inverse of the matrix if it does not exist
cacheSolve <- function(y, ...) {
## here we take the cached value and if the inverse is found the value is returned
inverse <- y$getInverse()
if(!is.null(inverse)) {
message("getting cached data")
return(inverse)
}
## if the inverse is not found we take the matrix and solve for the value
data <- y$getMatrix()
inverse <- solve(data)
y$cacheInverse(inverse)
inverse
}
