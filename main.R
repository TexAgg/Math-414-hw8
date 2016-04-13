#Clear previous variables
rm(list=ls())

library(wavelets)

#' Haar scaling function
#' 
#' @param A real number
#' @return phi(\{x})
phi = function(x){
	if (x>=0 & x<1){
		return(1)
	}
	else{
		return(0)
	}
}

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
k = seq(0, 1-1/2^7, by=1/(2^j-1))
y = as.numeric(lapply(k,g))

# Plot original function
plot(k, y,ylab="g",main="original function")

# New dwt object
# I'm not doing this right
hello = dwt(y ,n.levels=6, filter="haar")

g_j = function(x) {
	m = hello@W$W1
	y = 0 
	len = length(m[,1])
	for (k in 1:len) {
		y = y + m[k,] * phi(2^6 * x - k)
	}
	return(y)
}

y_hat = as.numeric(vapply(k, g_j, FUN.VALUE=numeric(1)))
plot(k,y_hat)
