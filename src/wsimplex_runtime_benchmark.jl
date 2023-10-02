#wsimplex_runtime_benchmark.jl

using BenchmarkTools, Random, Distributions
BenchmarkTools.DEFAULT_PARAMETERS.gcsample = true
BenchmarkTools.DEFAULT_PARAMETERS.samples = 100
BenchmarkTools.DEFAULT_PARAMETERS.seconds = 20

include("weighted_simplex_and_ball/wsortscan.jl")
include("weighted_simplex_and_ball/wmichelot.jl")
include("weighted_simplex_and_ball/wcondat.jl")

println("You are using ", nthreads(), " threads for parallel computing")
println("Warning: following experiments are for 80 threads!")

function wsortscan_test()
    Random.seed!(12345); res = @benchmark wsortscan_s($(rand(Normal(0,1), 10^8)), $(rand(10^8)), 1)
    println("serial: ", median(res))
    res_list = [median(res)]
    for i = 1:10
        Random.seed!(12345); res = @benchmark wsortscan_p($(rand(Normal(0,1), 10^8)), $(rand(10^8)), 1)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
    return res_list
end

function wmichelot_test()
    Random.seed!(12345); res = @benchmark wmichelot_s($(rand(Normal(0,1), 10^8)), $(rand(10^8)), 1)
    println("serial: ", median(res))
    res_list = [median(res)]
    for i = 1:10
        Random.seed!(12345); res = @benchmark wmichelot_p($(rand(Normal(0,1), 10^8)), $(rand(10^8)), 1, $(i*8))
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
    return res_list
end

function wcondat_test()
    Random.seed!(12345); res = @benchmark wcondat_s($(rand(Normal(0,1), 10^8)), $(rand(10^8)), 1)
    println("serial: ", median(res))
    res_list = [median(res)]
    for i = 1:10
        Random.seed!(12345); res = @benchmark wcondat_p($(rand(Normal(0,1), 10^8)), $(rand(10^8)), 1, $(i*8))
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
    return res_list
end

function get_result()
    res1 = wsortscan_test()
    res2 = wmichelot_test()
    res3 = wcondat_test()
    return res1, res2, res3
end
