# DSANet

This "Dual Self-Attention Network for Multivariate Time Series Forecasting" is based on the paper by [Siteng Huang et. al.](https://kyonhuang.top/files/Huang-DSANet.pdf).

The code is based on a [PyTorch implementation](https://github.com/bighuang624/DSANet) of the same model with slight adjustments.


## Network Structure

![Network Structure](https://raw.githubusercontent.com/bighuang624/DSANet/master/docs/DSANet-model-structure.png)

The neural net consists of the following elements:
* An autoregressive part
* A local temporal convolution mechanism, fed to a self-attention structure.
* A global temporal convolution mechanism, fed to a self-attention structure.


## Example File

The example loads some sample data and fits an DSANet to the input features.


## Known Issues

* The `MaxPool` pooling layers in the temporal convolution mechanisms can cause the model output to become `NaN` during training. This is not captured yet. Changing the model parameters or the random seed before training can help.

* The original model transposes some internal matrices, using `Flux.batched_transpose`. As there is no adjoint defined yet for this operation in `Zygote.jl`, we use `permutedims` instead.


## Benchmark Results

### GPU
```julia-repl
[ Info: GPU Training
1.557 s (450555 allocations: 18.81 MiB)
```

### CPU
```julia-repl
[ Info: CPU Training
2.441 s (373674 allocations: 2.33 GiB)
```
