# Description for all Scripts

## Folder simplex_and_l1ball

See [README.md (in simplex_and_l1ball)](simplex_and_l1ball/README.md) for more details.

## Folder theory_check

See [README.md (in theory_check)](theory_check/README.md) for more details.

## Folder weighted_simplex_and_ball

See [README.md (in weighted_simplex_and_ball)](weighted_simplex_and_ball/README.md) for more details.

## fairness_test.jl

This script uses macro @benchmark to test runtime between serial methods (sort and scan, Michelot's method, Condat's method) vs. their corresponding parallel methods with only 1 core separately. We wan to use this experiment
to show that we build code for both serial and parallel methods fairly.

Use following command in your console, then you can get the test result.

```julia
> include("fairness_test.jl")
```
