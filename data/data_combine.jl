#data_combine

using BangBang

begin
    data = []
    for i in 1:8
        sub_data = readdlm("kdd10/kdd10_"*string(i)*".txt", '\n')
        append!!(data, sub_data)
    end
    open("kdda.txt", "w") do io
        writedlm(io, data)
    end
end

begin
    data = []
    for i in 1:200
        sub_data = readdlm("kdd12/kdd12_"*string(i)*".txt", '\n')
        append!!(data, sub_data)
    end
    open("kdd12.txt", "w") do io
        writedlm(io, data)
    end
end
