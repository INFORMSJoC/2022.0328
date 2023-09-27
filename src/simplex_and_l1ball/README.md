# Description for all Scripts

## simplex_wrap.jl

This script builds seven methods to project a vector onto a simplex: serial sort and scan (sortscan_s), parallel sort and scan (sortscan_p), parallel sort and partial scan (sortPscan_p), serial Michelot's method (michelot_s),
parallel Michelot's method (michelot_p), serial Condat's method (condat_s), and parallel Condat's method (condat_p).

### Example to use them

```julia
> include("simplex_wrap.jl")
> using Random, Distributions
> data = rand(N(0, 1), 1_000_000) #generate a random input vector i.i.d. $N(0, 1)$ with size of $10^6$
> sortscan_s(data, 1) #use serial sort and scan method to project input vector data onto a simplex with scaling factor 1
```
