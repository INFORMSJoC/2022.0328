#simplex_runtime_benchmark

using BenchmarkTools, Random, Distributions
BenchmarkTools.DEFAULT_PARAMETERS.gcsample = true
BenchmarkTools.DEFAULT_PARAMETERS.samples = 100
BenchmarkTools.DEFAULT_PARAMETERS.seconds = 20

include("simplex_and_l1ball/simplex_wrap.jl")

println("You are using ", nthreads(), " threads for parallel computing")
println("Warning: following experiments are for 80 threads!")

#=
Following code is for our paper experiments, 80 threads and testing results for
1, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80 threads
=#
function standard_normal_test_condat(n::Int)
    println("results for condat:")
    Random.seed!(12345); res = @benchmark condat_s($(rand(Normal(0, 1), n)), 1)
    println("serial : ", median(res))
    res_list = [median(res)]
    for i in 1:10
        Random.seed!(12345); res = @benchmark condat_p($(rand(Normal(0, 1), n)), 1, $(i*8), 0.01)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
end

function uniform_test_condat(n::Int)
    println("results for condat:")
    Random.seed!(12345); res = @benchmark condat_s($(rand(n)), 1)
    println("serial : ", median(res))
    res_list = [mdeian(res)]
    for i in 1:10
        Random.seed!(12345); res = @benchmark condat_p($(rand(n)), 1, $(i*8), 0.00001)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
    return res_list
end

function small_variance_normal_test_condat(n::Int)
    println("results for condat:")
    Random.seed!(12345); res = @benchmark condat_s($(rand(Normal(0, 0.001), n)), 1)
    println("serial : ", median(res))
    res_list = [mdeian(res)]
     for i in 1:10
        Random.seed!(12345); res = @benchmark condat_p($(rand(Normal(0, 0.001), n)), 1, $(i*8), 0.00001)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
    return res_list
end

function standard_normal_test_michelot(n::Int)
    println("results for michelot:")
    Random.seed!(12345); res = @benchmark michelot_s($(rand(Normal(0, 1), n)), 1)
    println("serial : ", median(res))
    res_list = [median(res)]
    for i in 1:10
        Random.seed!(12345); res = @benchmark michelot_p($(rand(Normal(0, 1), n)), 1, $(i*8), 0.0)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
    return res_list
end

function uniform_test_michelot(n::Int)
    println("results for michelot:")
    Random.seed!(12345); res = @benchmark michelot_s($(rand(n)), 1)
    println("serial : ", median(res))
    res_list = [median(res)]
    for i in 1:10
        Random.seed!(12345); res = @benchmark michelot_p($(rand(n)), 1, $(i*8), 0.0)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
    return res_list
end

function small_variance_normal_test_michelot(n::Int)
    println("results for michelot:")
    Random.seed!(12345); res = @benchmark michelot_s($(rand(Normal(0, 0.001), n)), 1)
    println("serial : ", median(res))
    res_list = [median(res)]
    for i in 1:10
        Random.seed!(12345); res = @benchmark michelot_p($(rand(Normal(0, 0.001), n)), 1, $(i*8), 0.00001)
        println(i*8, " : ", median(res))
        push!(res_list, median(res))
    end
    return res_list
end

function standard_normal_test_sortscan(n::Int)
    println("results for sortscan:")
    Random.seed!(12345); res = @benchmark sortscan_s($(rand(Normal(0, 1), n)), 1)
    println("serial : ", median(res))
    res_list1 = [median(res)]
    res_list2 = [median(res)]
    for i in 1:10
        Random.seed!(12345); res = @benchmark sortscan_p($(rand(Normal(0, 1), n)), 1, $(i*8))
        println(i*8, " sortscan : ", median(res))
        push!(res_list1, median(res))
        Random.seed!(12345); res = @benchmark sortPscan_p($(rand(Normal(0, 1), n)), 1, $(i*8))
        println(i*8, " sortPscan: ", median(res))
        push!(res_list2, median(res))
    end
    return res_list1, res_list2
end

function uniform_test_sortscan(n::Int)
    println("results for sortscan:")
    Random.seed!(12345); res = @benchmark sortscan_s($(rand(n)), 1)
    println("serial : ", median(res))
    res_list1 = [median(res)]
    res_list2 = [median(res)]
    for i in 1:10
        Random.seed!(12345); res = @benchmark sortscan_p($(rand(n)), 1, $(i*8))
        println(i*8, " sortscan : ", median(res))
        push!(res_list1, median(res))
        Random.seed!(12345); res = @benchmark sortPscan_p($(rand(n)), 1, $(i*8))
        println(i*8, " sortPscan: ", median(res))
        push!(res_list2, median(res))
    end
    return res_list1, res_list2
end

function small_variance_normal_test_sortscan(n::Int)
    println("results for sortscan:")
    Random.seed!(12345); res = @benchmark sortscan_s($(rand(Normal(0, 0.001), n)), 1)
    println("serial : ", median(res))
    res_list1 = [median(res)]
    res_list2 = [median(res)]
     for i in 1:10
        Random.seed!(12345); res = @benchmark sortscan_p($(rand(Normal(0, 0.001), n)), 1, $(i*8))
        println(i*8, " sortscan : ", median(res))
        push!(res_list1, median(res))
        Random.seed!(12345); res = @benchmark sortPscan_p($(rand(Normal(0, 0.001), n)), 1, $(i*8))
        println(i*8, " sortPscan: ", median(res))
        push!(res_list2, median(res))
    end
    return res_list1, res_list2
end

# for n = 10^8
function get_result_length()
    res_uniform_ss, res_uniform_sps = uniform_test_sortscan(10^8)    
    res_standnorm_ss, res_standnorm_sps = standard_normal_test_sortscan(10^8)
    res_smallnorm_ss, res_smallnorm_sps = small_variance_normal_test_sortscan(10^8)
    res_uniform_m = uniform_test_michelot(10^8)
    res_standnorm_m = standard_normal_test_michelot(10^8)
    res_smallnorm_m = small_variance_normal_test_michelot(10^8)
    res_uniform_c = uniform_test_condat(10^8)
    res_standnorm_c = standard_normal_test_condat(10^8)
    res_smallnorm_c = small_variance_normal_test_condat(10^8)
    return res_uniform_ss, res_standnorm_ss, res_smallnorm_ss, res_uniform_sps, res_standnorm_sps, res_smallnorm_sps, res_uniroms_m, res_standnorm_m, res_smallnorm_m, res_uniform_c, res_standnorm_c, res_smallnorm_c
end

# for n = 10^7, 10^8, 10^9
function get_result_norm()
    res_ss_7, res_sps_7 = standard_normal_test_sortscan(10^7)
    res_m_7 = standard_normal_test_michelot(10^7)
    res_c_7 = standard_normal_test_condat(10^7)
    res_ss_8, res_sps_8 = standard_normal_test_sortscan(10^8)
    res_m_8 = standard_normal_test_michelot(10^8)
    res_c_8 = standard_normal_test_condat(10^8)
    res_ss_9, res_sps_9 = standard_normal_test_sortscan(10^9)
    res_m_9 = standard_normal_test_michelot(10^9)
    res_c_9 = standard_normal_test_condat(10^9)
    return res_ss_7, res_ss_8, res_ss_9, res_sps_7, res_sps_8, res_sps_9, res_m_7, res_m_8, res_m_9, res_c_7, res_c_8, res_c_9
end
