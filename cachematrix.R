# Object oriented programming is all about mutating (the "set" calls) and 
# accessing (the "get" calls) objects. Here, we use lexical scoping to imitate
# OOP on making a matrix and getting its inverse. This exercise is all about 
# making processes in R faster and more efficient by using "caching".

## Create a special matrix object.

makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
        set <- function(y){
                y <<- x
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Now, calculate the inverse of the above matrix and cache it
## OR retrieve the cached inverse.

cacheSolve <- function(x, ...) {
                inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}
