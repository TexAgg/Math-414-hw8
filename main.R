#Clear previous variables
rm(list=ls())

g = function(t) {
    if (t >= 0 && t < 7/17) {
        return(0)
    } else if (t >= 7/17 && t < 1) {
        return(1-t^2)
    } else {
        return(NA)
    }
}

t = seq(0,1,by=0.01)

# Plot original function
plot(t, lapply(t,g),ylab="g",main="original function")