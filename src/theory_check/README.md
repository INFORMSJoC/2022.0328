# Descript of scripts

## average_active.jl

This script calculates number of active terms in simplex projection for different sizes $n$ of the input vector, where $n$ between $10^6$ and $10^7$. Then compare these numbers with series $\sqrt{2n}$. To get the plot result, see the following example.

```julia
> include("average_active.jl")
```
![average_active.png](/results/average_active.png)

