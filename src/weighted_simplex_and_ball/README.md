# Description of Scripts

## Projecton onto a weighted simplex

wsortscan.jl, wmichelot.jl, and wcondat.jl provide 6 projection methods (for a weighted simplex) based on serail sort and scan, parallel sort and scan, serial Michelot's method, parallel Michelot's method, serial Condat's method
and parallel Condat's method. 

### Example to use them

```julia
> include("wsortscan.jl") #load 7 methods from the script
> using Random, Distributions, Base.Threads
> data = rand(N(0, 1), 1_000_000) #generate a random input vector i.i.d. $N(0, 1)$ with size of $10^6$
> w = rand(1_000_000) #generate a random weight vector i.i.d. $U[0, 1]$ with size of $10^6$
> wsortscan_s(data, w, 1) #use serial sort and scan method to project input vector data onto a weighted simplex with scaling factor 1
> wmichelot_p(data, w, nthreads()) #use parallel Michelot's method to project input vector data onto a weighted simplex with scaling factor 1, and nthreads() return the number of available threads
```
