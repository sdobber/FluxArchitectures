# LSTNet

This "Long- and Short-term Time-series network" is based on the paper by [Lai et. al.](https://arxiv.org/abs/1703.07015). See also the corresponding [blog post](https://sdobber.github.io/FA_LSTNet/).


## Network Structure

The neural net consists of the following elements:
* A convolutional layer than operates on some window of the time series.
* A `GRU` cell with `relu` activation function.
* A `SkipGRU` similar to the previous `GRU` cell, with the difference that the hidden state is taken from a specific amount of timesteps back in time. Both the `GRU` and the `SkipGRU` layer take their input from the convolutional layer.
* A dense layer that operates on the concatenated output of the previous two layers.
* An autoregressive layer operating on the input data itself, being added to the output of the dense layer.


## Example File

The example loads some sample data (stemming from a medicinal application - details will not be disclosed) and fits an LSTnet to the input features.


## Benchmark Results

### GPU
```julia-repl
[ Info: GPU Training
7.022 s (13012644 allocations: 349.47 MiB)
```

### CPU
```julia-repl
[ Info: CPU Training
582.849 ms (1552305 allocations: 181.54 MiB)
```
