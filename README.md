click on cachematrix.R file to view code



Sample input and output:

 m <- matrix(c(5,4,8,9,7,8,2,1,0), ncol = 3, nrow = 3)
> m
     [,1] [,2] [,3]
[1,]    5    9    2
[2,]    4    7    1
[3,]    8    8    0
> m2 <- makeCacheMatrix(m)
> cacheSolve(m2)
     [,1] [,2]    [,3]
[1,]  0.5   -1  0.3125
[2,] -0.5    1 -0.1875
[3,]  1.5   -2  0.0625
