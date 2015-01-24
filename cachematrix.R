## Assignment 2 for submission.

## To Run the script, use :
#     > source("cachematrix.R")
#     > mat = matrix(c(1,2,3,4), 2,2)
#     > matM = makeCacheMatrix(mat)
#     > cacheSolve(matM)  



## makeCacheMatrix(x) takes the matrix to return object of 'makeCacheMatrix' type.
## Sample Usage Snippet  
#     > mat = matrix(c(1,2,3,4), 2,2)
#     > matM = makeCacheMatrix(mat)
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## cacheSolve(x) takes object of type 'makeCacheMatrix' to calculate inverse.
## Sample usage example:
#     > cacheSolve(matM)  
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
  
}
