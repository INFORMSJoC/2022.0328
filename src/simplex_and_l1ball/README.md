# Description of Scripts

## simplex_wrap.jl

This script builds seven methods to project a vector onto a simplex: serial sort and scan (sortscan_s), parallel sort and scan (sortscan_p), parallel sort and partial scan (sortPscan_p), serial Michelot's method (michelot_s),
parallel Michelot's method (michelot_p), serial Condat's method (condat_s), and parallel Condat's method (condat_p).

### Example to use them

```julia
> include("simplex_wrap.jl") #load 7 methods from the script
> using Random, Distributions, Base.Threads
> data = rand(N(0, 1), 1_000_000) #generate a random input vector i.i.d. $N(0, 1)$ with size of $10^6$
> sortscan_s(data, 1) #use serial sort and scan method to project input vector data onto a simplex with scaling factor 1
> sortscan_p(data, 1, nthreads()) #use serial sort and scan method to project input vector data onto a simplex with scaling factor 1, and nthreads() return the number of available threads
> spa = 0.001 #sparsity rate, which is used to terminate parallel computing earlier
> michelot_p(data, 1, nthreads(), spa) #use serial sort and scan method to project input vector data onto a simplex with scaling factor 1
```

### subfiles to support simplex_wrap.jl

sort_scan.jl, michelot.jl, and condat.jl separately build necessary functions to help simplex_wrap.jl to develop the 7 aforementioned projection methods.

## l1ball_wrap.jl

This script builds seven methods to project a vector onto a l1 ball: serial sort and scan (l1ball_sortscan_s), parallel sort and scan (l1ball_sortscan_p), parallel sort and partial scan (l1ball_sortPscan_p), serial Michelot's method (l1ball_michelot_s), parallel Michelot's method (l1ball_michelot_p), serial Condat's method (l1ball_condat_s), and parallel Condat's method (l1ball_condat_p).

### Example to use them

```julia
> include("l1ball_wrap.jl") #load 7 methods from the script
> using Random, Distributions, Base.Threads
> data = rand(N(0, 1), 1_000_000) #generate a random input vector i.i.d. $N(0, 1)$ with size of $10^6$
> l1ball_sortscan_s(data, 1) #use serial sort and scan method to project input vector data onto a simplex with scaling factor 1
> l1ball_sortscan_p(data, 1, nthreads()) #use serial sort and scan method to project input vector data onto a simplex with scaling factor 1, and nthreads() return the number of available threads
> spa = 0.001 #sparsity rate, which is used to terminate parallel computing earlier
> l1ball_michelot_p(data, 1, nthreads(), spa) #use serial sort and scan method to project input vector data onto a simplex with scaling factor 1
```

### subfiles to support l1ball_wrap.jl

simplex_wrap.jl is a necessary script in running l1ball_wrap.jl.
