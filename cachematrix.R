## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# makeCacheMatrix creates a special matrix object that can cache its inverse 
# which is really a list containing a function to
# set the value of the vector
# get the value of the vector
# set the value of the inverse
# get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#calculates the inverse of the special "matrix" created with the above function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
