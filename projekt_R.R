#Generowanie liczb z zadanych rozkładów oraz Metody Monte Carlo
install.packages("MASS") 
library(MASS)

# Funkcja do generowania liczb pseudolosowych z rozkładu Wisharta
generateWishart <- function(d, Sigma, n) {
  # Sprawdzenie warunków n > d + 1 > 1
  if (!(n > d + 1 && d > 1)) {
    stop("Warunki n > d + 1 > 1 nie są spełnione.")
  }
  
  #Wygenerowanie macierzy o wymiarach d x n ze standardowego rozkładu normalnego
  Z <- matrix(rnorm(d * n), nrow = d, ncol = n)
  
  #Faktoryzacja macierzy Z w celu uzyskania macierzy kowariancji
  S <- Z %*% t(Z)
  
  #Przeskalowanie macierzy kowariancji przez macierz Sigma
  W <- Sigma %*% S %*% solve(Sigma)
  
  return(W)
}

# Przykładowe użycie funkcji
set.seed(123)
d <- 3  # wymiar
n <- 5  # liczba stopni swobody
df <- n  # liczba stopni swobody dla rWishart
Sigma <- matrix(c(1, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 1), nrow = d, ncol = d)  # macierz kowariancji

# Generowanie przykładowej macierzy z rozkładu Wisharta przy użyciu funkcji własnej
wishart_sample <- generateWishart(d, Sigma, n)

# Generowanie przykładowej macierzy z rozkładu Wisharta przy użyciu funkcji referencyjnej
wishart_sample_ref <- rWishart(1, df, Sigma)  # 1 to liczba losowanych macierzy, df to liczba stopni swobody

# Porównanie wyników
print("Wyniki z funkcji własnej:")
print(wishart_sample)

print("Wyniki z funkcji referencyjnej:")
print(wishart_sample_ref)

# Sprawdzenie różnicy między wynikami
diff <- sum(abs(wishart_sample - wishart_sample_ref[,,1])[lower.tri(wishart_sample)])
print(paste("Suma różnic między wynikami: ", diff))

# Sprawdzenie różnicy między wynikami
diff_matrix <- wishart_sample - wishart_sample_ref[,,1]

print("Różnica między wynikami:")
print(diff_matrix)

#_________________________________________________________________________
#Zadanie 3
#Monte Carlo dla całki koła
monte_carlo_pi_integral <- function(m) {
  x <- runif(m, -1, 1)
  y <- runif(m, -1, 1)
  
  inside_circle <- sum(x^2 + y^2 <= 1)
  
  pi_approx_1 <- 4 * inside_circle / m
  
  return(pi_approx_1)
}


#Monte Carlo dla stosunku powierzchni koła do kwadratu
monte_carlo_pi_ratio <- function(m) {
  x <- runif(m)
  y <- runif(m)
  
  inside_circle <- sum(x^2 + y^2 <= 1)
  
  pi_approx_2 <- 4 * inside_circle / m
  
  return(pi_approx_2)
}

m <- 10000

result_integral <- monte_carlo_pi_integral(m)
print(result_integral)

result_ratio <- monte_carlo_pi_ratio(m)
print(result_ratio)


#Metoda igły
montecarlo_igla = function(iteracje, l, d) {
  przeciecia = 0
  
  for (i in 1:iteracje) {
    x <- runif(1, 0, d / 2)
    kat <- runif(1, 0, pi/2)
    
    if (x <= l * sin(kat)) {
      przeciecia <- przeciecia + 1
    }
  }
  
  return((2 * l * iteracje) / (przeciecia * d))
}

iteracje = 1000000
wynik_igla = montecarlo_igla(iteracje, 7, 10)
wynik_integral = monte_carlo_pi_integral(iteracje)
wynik_ratio = monte_carlo_pi_ratio(iteracje)

# Rzeczywista wartość liczby π
real_pi = pi

# Porównanie z rzeczywistą wartością π
print(paste("Przybliżona wartość π (metoda całki koła):", wynik_integral, ", Błąd:", abs(wynik_integral - real_pi), "\n"))
print(paste("Przybliżona wartość π (metoda stosunku powierzchni):", wynik_ratio, ", Błąd:", abs(wynik_ratio - real_pi), "\n"))
print(paste("Przybliżona wartość π (metoda igły):", wynik_igla, ", Błąd:", abs(wynik_igla - real_pi), "\n"))



