## Benchmark script

# Make sure all the required packages are available
cd(@__DIR__)
using Pkg; Pkg.activate("."); Pkg.instantiate()

@info "Loading packages"
using Flux, BSON, BenchmarkTools
include("../shared/Sequentialize.jl")
include("../data/dataloader.jl")
include("LSTnet.jl")

# Load some sample data
@info "Loading data"
poollength = 10
horizon = 6
datalength = 500
input, target = get_data(:solar, poollength, datalength, horizon) |> gpu

# Define the network architecture
@info "Creating model and loss"
inputsize = size(input,1)
convlayersize = 2
recurlayersize = 3
skiplength = 120

# Define the neural net
model = LSTnet(inputsize, convlayersize, recurlayersize, poollength, skiplength,
        init=Flux.zeros, initW=Flux.zeros, initb=Flux.zeros) |> gpu

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
model = LSTnet(inputsize, convlayersize, recurlayersize, poollength, skiplength,
        init=Flux.zeros, initW=Flux.zeros, initb=Flux.zeros)
@btime Flux.train!(loss, Flux.params(model),Iterators.repeated((input, target), 5),
            ADAM(0.007))
