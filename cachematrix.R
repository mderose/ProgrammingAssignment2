## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.
## The first function, makeVector creates a special "matrix", which is really a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse matrix
## get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {

  z <- NULL
  set <- function(y) {
    z <<- y
    x <<- NULL
  }
  get <- function() x
  setcachematrix <- function(solve) z <<- solve
  getcachematrix <- function() z
  list(set = set, get = get,
       setcachematrix = setcachematrix,
       getcachematrix = getcachematrix)
  
  
}


## The following function calculates the inverse of a "matrix" .
##it first checks to see if the inverse has already been calculated.
##If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and sets the value of the inverse in the cache via the setmean function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  z <- x$getcachematrix()
  #z <- NULL
    if(!is.null(z)) {
    message("getting cached data")
    return(z)
  }
  
  data <- x$get()
  
  z <- solve(data, ...)
  x$setcachematrix(z)
  z


}
