## Put comments here that give an overall description of what your
## functions do

## Using the sample provided helped immensely.  
## The functions created get_matrix, get_matrix_inv,set_matrix,set_matrix_inv

makeCacheMatrix <- function(x=matrix()) {
  m <- NULL
  set_matrix <- function(y=matrix()) {
    x <<- y
    m <<- NULL
  }
  get_matrix <- function() x
  set_matrix_inv <- function(solve) m <<- solve
  get_matrix_inv <- function() m
  list(set_matrix = set_matrix, get_matrix = get_matrix,
       set_matrix_inv = set_matrix_inv,
       get_matrix_inv = get_matrix_inv)
}

## Write a short comment describing this function

cachesolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$get_matrix_inv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get_matrix()
  m <- solve(data, ...)
  x$set_matrix_inv(m)
  m
}
