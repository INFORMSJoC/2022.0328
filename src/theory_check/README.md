# Descript of scripts

## average_active.jl

This script calculates the number of active terms in simplex projection for different sizes $n$ of the input vector, where $n$ is between $10^6$ and $10^7$. Then compare these numbers with series $\sqrt{2n}$. To get the plot result, see the following example.

```julia
> include("average_active.jl")
```
![average_active.png](/results/average_active.png)

## filter_result.jl

This script calculates the number of active terms after applying Filter technique the input vector, where the input vector has different sizes between $10^6$ and $10^7$. Then compare these numbers with series $(2.2n)^{\frac{2}{3}}$. To get the plot result, see the following example.

```julia
> include("filter_result.jl")
```
![filter_result.png](/results/filter_result.png)
