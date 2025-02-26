# *This software is licensed under the MIT "Expat" License (MIT).*

# ## ML from scratch in Julia
#
# February 2025, Oliver Schulz <oschulz@mpp.mpg.de>

# ### Julia project environment

# Ensure that the right Julia project environment is active:

import Pkg
if basename(dirname(Pkg.project().path)) != "teaching-ml-from-scratch"
    Pkg.activate(@__DIR__)
end
#Pkg.instantiate() # Need to run this only once
basename(dirname(Pkg.project().path))


# ### Dependencies

# Julia standard libary functionality:

using LinearAlgebra, Statistics, Random

using Base: Fix1
using Base.Broadcast: BroadcastFunction
using Base.Iterators: partition

# Some data structure packages that we'll need:

using Adapt, StructArrays, ConstructionBase, OneTwoMany

# Plotting and I/O packages:

using Plots, ProgressMeter
using HDF5


# ### Compute platform selection

# Set `run_on` to :CPU, :CUDA (NVIDIA GPUs), :AMDGPU (AMD GPUs), :oneAPI
# (Intel GPUs), or :Metal (Apple GPUs). Note: CPU and CUDA should work well,
# your milage with the other backends will vary. Run on CPU by default:

run_on = :CPU

# When not running on CPU, you'll need to run one of these once (you may need
# reload your Julia session afterwards):

## Pkg.add("CUDA")
## Pkg.add("AMDGPU")
## Pkg.add("oneAPI")
## Pkg.add("Metal")

# In Julia, different compute devices are tied to different array types.
# We'll just set `ArrayType` as alias an for the right array type and use it
# later to create arrays on the desired device:

if run_on == :CPU
    ArrayType = Array
elseif run_on == :CUDA
    using CUDA
    ArrayType = CuArray
elseif run_on == :AMDGPU
    using AMDGPU
    ArrayType = ROCArray
elseif run_on == :oneAPI
    using oneAPI
    ArrayType = oneArray
elseif run_on == :Metal
    using Metal
    ArrayType = MtlArray
else
    error("Unsupported compute device type $run_on")
end


# ### Dataset

# We'll use the SUSY Data Set from the
# [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/SUSY).
#
# This will download the original "SUSY.csv.gz" and convert it to "SUSY.hdf5",
# need to run this only once:

hdf5_filename = include("download_dataset.jl")

# Open "SUSY.hdf5" and read features and labels:

input = h5open(hdf5_filename)
features = copy(transpose(read(input["features"])))
labels = Bool.(transpose(read(input["labels"])))


# To be continued ...
