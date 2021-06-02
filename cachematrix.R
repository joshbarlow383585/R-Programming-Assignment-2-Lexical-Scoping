## This function creates a special matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solvemat) m <<- solvemat
        getinv <- function() m
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}

## This function computes the inverse of the special matrix created above
## and if necessary, retrieves the inverse from the cache
## This assignment assumes the matrix supplied is always invertible.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinv(m)
        m
}

# create a matrix to test functions
m <- matrix(c(5,4,8,9,7,8,2,1,0), ncol = 3, nrow = 3)

# view matrix
m

# create cache matrix
m2 <- makeCacheMatrix(m)

# create inverse matrix
cacheSolve(m2)
