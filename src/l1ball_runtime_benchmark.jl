#l1ball_runtime_benchmark.jl

using BenchmarkTools, Random, Distributions
BenchmarkTools.DEFAULT_PARAMETERS.gcsample = true
BenchmarkTools.DEFAULT_PARAMETERS.samples = 100
BenchmarkTools.DEFAULT_PARAMETERS.seconds = 20

include("simplex_and_l1ball/l1ball_wrap.jl")

println("You are using ", nthreads(), " threads for parallel computing")
println("Warning: following experiments are for 80 threads!")

#=
Following code is for our paper experiments, 80 threads and testing results for
1, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80 threads
=#

function l1ball_test_condat(n::Int)
    println("results for condat:")
    Random.seed!(12345); res = @benchmark l1ball_condat_s($(rand(Normal(0, 1), n)), 1)
    println("serial : ", median(res))
    res_list = []
    for i in 1:10
        Random.seed!(12345); res = @benchmark l1ball_condat_p($(rand(Normal(0, 1), n)), 1, $(i*8), 0.001)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
end

function l1ball_test_michelot(n::Int)
    println("results for michelot:")
    Random.seed!(12345); res = @benchmark l1ball_michelot_s($(rand(Normal(0, 1), n)), 1)
    println("serial : ", median(res))
    res_list = []
    for i in 1:10
        Random.seed!(12345); res = @benchmark l1ball_michelot_p($(rand(Normal(0, 1), n)), 1, $(i*8), 0.0)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
end

function l1ball_test_sortscan(n::Int)
    println("results for sortscan:")
    Random.seed!(12345); res = @benchmark l1ball_sortscan_s($(rand(Normal(0, 1), n)), 1)
    println("serial : ", median(res))
    res_list = []
    for i in 1:10
        Random.seed!(12345); res = @benchmark l1ball_sortscan_p($(rand(Normal(0, 1), n)), 1, $(i*8))
        println(i*8, " sortscan : ", median(res))
        Random.seed!(12345); res = @benchmark l1ball_sortPscan_p($(rand(Normal(0, 1), n)), 1, $(i*8))
        println(i*8, " sortPscan: ", median(res))
        push!(res_list, median(res))
    end
end

function get_result()
    res_ss = l1ball_test_sortscan(10^8)
    res_m = l1ball_test_michelot(10^8)
    res_c = l1ball_test_condat(10^8)
    return res_ss, res_m, res_c
end

