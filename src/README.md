# Description for all Scripts

## Folder simplex_and_l1ball

See [README.md (in simplex_and_l1ball)](simplex_and_l1ball/README.md) for more details.

## Folder theory_check

See [README.md (in theory_check)](theory_check/README.md) for more details.

## Folder weighted_simplex_and_ball

See [README.md (in weighted_simplex_and_ball)](weighted_simplex_and_ball/README.md) for more details.

## fairness_test.jl

This script uses macro @benchmark to compare runtimes between serial methods (sort and scan, Michelot's method, Condat's method) vs. their corresponding parallel methods with only 1 core separately. We wan to use this experiment
to show that we build code for both serial and parallel methods fairly.

Use the following command in your console, then you can get the test result.

```julia
> include("fairness_test.jl")
```

## l1ball_runtime_benchmark.jl

This script uses macro @benchmark to test runtimes of 3 serial methods (sort and scan, Michelot's method, Condat's method) and 4 parallel methods (sort and scan, sort and partial scan, Michelot's method, Condat's method) in different numbers of cores (8, 16, 24, 32, 40, 48, 56, 64, 72, 80).

Use the following command in your console, then you can get the test result.

```julia
> include("l1ball_runtime_benchmark.jl")
> res_sortscan, res_sortPscan, res_michelot, res_condat = get_result()
> res_sortscan #this list includes [serial sort and scan's runtime, parallel sort and scan's runtime in 8, 16, 24, 32, 40, 48, 56, 64, 72, 80 cores]
```

## parity_polytope.jl and paritypolytope_runtime_benckmark.jl

parity_polytope.jl builds two functions for serial and parallel methods separately. There is a function argument to determine which simplex projection method to use in parity polytope projection.

```julia
> include("parity_polytope.jl")
> using Random, Distributions
> data = rand(1_000_000 - 1). + 1 #generate an input vector i.i.d. U[1, 2] with size of 999999
> parity_s(sort_scan_s, data) #using serial sort and scan to finish the projection onto a parity polytope
> spa = 0.0001 #set a sparsity rate to terminate parallel computing early
> parity_s(michelot_p, data, spa) #using parallel Michelot's method to finish the projection onto a parity polytope
```

paritypolytope_runtime_benckmark.jl uses macro @benchmark to test runtims of 7 methods in both parity polytope projection and simplex projection (simplex projection is a substep of parity polytope projection) in a given number of
cores (and we set it as nthreads(), which is a system argument in julia).

Use the following command in your console, then you can get the test result.

```julia
> include("paritypolytope_runtime_benchmark.jl")
> res_parity_polytope, res_simplex = get_result()
> res_parity_polytope #this list includes runtimes of [serial sort and scan, parallel sort and scan, parallel and partial scan, serial and parallel Michelot's methods, serial and parallel Condat's methods]
```

## real_data_kdd10.jl and real_data_kdd12.jl

The two scripts use marco @benchmark to test runtimes of simplex projection and l1 ball projection with both serial and parallel (in different numbers of cores) in two real-world data (see [README.md (in data folder)](/data/README.md)), which is a crucial step in the Lasso method.

Use the following command in your console, then you can get the test result.

```julia
> include("real_data_kdd10.jl")
> res_ss_simplex, res_sps_simplex, res_m_simplex, res_c_simplex, res_ss_ball, res_sps_ball, res_m_ball, res_c_ball = get_result()
> res_ss_simplex #this list includes runtims of [serial sort and scan, parallel sort and scan in different cores]
```

### support files

Please make sure moving two real-world datasets with the names kdd10.txt and kdd12.txt to the work folder, and run real_data_reader.jl to preprocess them for real_data_kdd10.jl and real_data_kdd12.jl.

```julia
> include("real_data_reader.jl")
```

## simplex_benchmark_runtime.jl





