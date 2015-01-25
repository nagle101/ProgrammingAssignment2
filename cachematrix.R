## first wrote a function to create a matrix which cache its inverse and then created a cace function which computes the 
## inverse if it has nt been done earlier or retrieves the cache value.
## makeCacheMatrix -- creates a matrix which can cache the inverse
makeCacheMatrix <- function(x = matrix()) {   
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatrix <- function(solve) m <<- solve
        getmatrix <- function() m
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}
## Solve-- will compute the inverse of the matrix
cacheSolve <- function(x, ...) {
        m <- x$getmatrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setmatrix(m)
        m
}
## 'mat' is the matrix to store the function and then set the value.
mat <- makeCacheMatrix ()
mat$set (matrix (c(11,15,25,51,4,17,8,22,31),3,3, byrow = T))
cacheSolve(mat)
