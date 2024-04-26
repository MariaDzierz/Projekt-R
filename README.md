# Generating numbers from given distributions and Monte Carlo methods
## Task 1
Using the algorithm below, write a function to generate numbers pseudorandom from the d-dimensional Wishart distribution 𝑊 𝑑(𝛴, 𝑛) for 𝑛 > 𝑑 + 1 > 1. Check the accuracy of the results obtained.   
   
The “generateWishart” function generates pseudorandom numbers from the Wishart distribution with dimension d, the Sigma covariation matrix and the number of degrees of freedom n, checking whether the conditions n>d+1>1 are met.   
Then, a d x n matrix is generated from a normal distribution.   
Matrix factorization to obtain the covariance matrix S (factorization - the process of decomposition into prime factors).   
Rescaling the covariance matrix by the Sigma matrix to obtain the matrix from the Wishart distribution.   
“set.seed()” - sets the seed of the pseudorandom number generator.    
“wishart_sample” - generates a sample matrix from the Wishart distribution using our own function.   
“wishart_sample_ref” - generates a sample matrix from the Wishart distribution using the rWishart reference function.   
“diff” - calculates the sum of the differences between the results for the lower triangle of the matrix.   
“diff_matrix” - calculates the differences between all elements of two matrices.   
## Task 2
Propose two methods for approximating the number π using Monte Carlo methods and compare their effectiveness.   
   
The function generates random numbers "x" and "y" from a uniform distribution in the range [-1, 1].   
“inside_circle” is the number of points that landed inside a unit circle with radius 1 and centered at (0,0).   
“pi_approx_1” is an approximation of pi, obtained as the ratio of the number of points inside the circle to the total number of points.   
This function generates random numbers "x" and "y" from a uniform distribution in the range [0, 1].   
“inside_circle” is the number of points that landed inside a unit circle with radius 1 and centered at (0,0).   
“pi_approx_2” is an approximation of pi, obtained as the ratio of the number of points inside the circle to the total number of points.   
