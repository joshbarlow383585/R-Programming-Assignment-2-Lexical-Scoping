# R-Programming-Assignment-2-Lexical-Scoping
Caching the Inverse of a Matrix

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

#create a matrix - m
> m <- matrix(c(5,4,8,9,7,8,2,1,0), ncol = 3, nrow = 3)

# quick check to view matrix
> m
     [,1] [,2] [,3]
[1,]    5    9    2
[2,]    4    7    1
[3,]    8    8    0

# use Cache function to create inverse matrix
> m2 <- makeCacheMatrix(m)
> cacheSolve(m2)
     [,1] [,2]    [,3]
[1,]  0.5   -1  0.3125
[2,] -0.5    1 -0.1875
[3,]  1.5   -2  0.0625
