## Put comments here that give an overall description of what your
## functions do

## function to create a vector with functions to get & set the value of a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {

  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
         setinverse = setinverse ,
         getinverse = getinverse)
}


## function to calculate the value of inverse if not already calculated, if  not null return the existing value

cacheSolve <- function(x, ...) {

  inverse <- x$getinverse()

  if(!is.null(inverse)) {
    print("getting cached data")
    return(inverse)
  }
  data <- x$get()
  print("setting cache now")
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
