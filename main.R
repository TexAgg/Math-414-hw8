#Clear previous variables
rm(list=ls())

library(wavelets)

g = function(t) {
    b = 7/17
	if (t >= 0 && t < b) {
        return(0)
    } else if (t >= b && t < 1) {
        return(1-t^2)
    } else {
        return(NA)
    }
}

j = 7
k = seq(0,1,by=1/(2^j-2))

# Plot original function
plot(k, lapply(k,g),ylab="g",main="original function")