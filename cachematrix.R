## Put comments here that give an overall description of what your
## functions do

## Using the sample provided helped immensely.  
## The functions created get_matrix, get_matrix_inv,set_matrix,set_matrix_inv
## Each of these function performed actions on the matrix
## set_matrix - can be used to provide a matrix like diag(2,8)
## get_matrix - print the matix
## get_matrix_inv = will calculate the inverse by calling cachesolve 
## set_matirx_inv - sets the matirx to be cached

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

## Cachesolve first checks if he matrix is already cached
## if cached get it, if not perform a solve. Solve is basically
## inverting a matrix.

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
