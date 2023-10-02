# Data for replication

Since the data is too large to upload, we split them into small files and save them into two folders. You can run data_combine.jl to get two data files as follows

```julia
julia> include("data_combine.jl")
```

Then you can get kdda.txt and kdd12.txt, and please move them to [src](src) before you run [real_data_kdd10.jl](/src/real_data_kdd10.jl) and [real_data_kdd12.jl](/src/real_data_kdd12.jl).

We also provide the data link for downloading. kdda.txt from [kdd2010](https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/binary/kdda.t.bz2), and kdd12.txt from [kdd2012](https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/binary/kdd12.val.xz). You can download them by clicking the link directly.

After downloading them, please unzip and rename them as kdda.txt and kdd12.txt, and move them to [src](/src) before you run [real_data_kdd10.jl](/src/real_data_kdd10.jl) and [real_data_kdd12.jl](/src/real_data_kdd12.jl).

## License
See file [License](data/LICENSE) for details.
