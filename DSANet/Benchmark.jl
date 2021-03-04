## Benchmark script

# Make sure all the required packages are available
cd(@__DIR__)
using Pkg; Pkg.activate("."); Pkg.instantiate()

@info "Loading packages"
using Flux, BSON, BenchmarkTools
using Random
include("DSANet.jl")
include("../data/dataloader.jl")

# Load some sample data
@info "Loading data"
poollength = 10
horizon = 6
datalength = 500
input, target = get_data(:solar, poollength, datalength, horizon) |> gpu

# Define the network architecture
inputsize = size(input,1)
local_length = 3
n_kernels = 3
d_model = 4
hiddensize = 1
n_layers = 3
n_head = 2

# Define the neural net
@info "Creating model and loss"
Random.seed!(123)
model = DSANet(inputsize, poollength, local_length, n_kernels, d_model,
               hiddensize, n_layers, n_head) |> gpu

# MSE loss
function loss(x, y)
    Flux.reset!(model)
    return Flux.mse(model(x), y')
end

# Training loop
@info "GPU Training"
@btime Flux.train!(loss, Flux.params(model),Iterators.repeated((input, target), 5),
            ADAM(0.007))

@info "CPU Training"
input, target = cpu(input), cpu(target)
Random.seed!(123)
model = DSANet(inputsize, poollength, local_length, n_kernels, d_model,
               hiddensize, n_layers, n_head)
@btime Flux.train!(loss, Flux.params(model),Iterators.repeated((input, target), 5),
            ADAM(0.007))
