# Results

## Julia 1.5.4 & Flux 0.11.5

### Info

```julia-repl
Julia Version 1.5.4
Commit 69fcb5745b (2021-03-11 19:13 UTC)
Platform Info:
  OS: macOS (x86_64-apple-darwin18.7.0)
  CPU: Intel(R) Core(TM) i5-6267U CPU @ 2.90GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-9.0.1 (ORCJIT, skylake)
Environment:
  JULIA_EDITOR = code
  JULIA_NUM_THREADS = 4
```

```julia-repl
Status `~/Uni/Code/FluxArchitectures/benchmark/Project.toml`
  [fbb218c0] BSON v0.2.6
  [6e4b80f9] BenchmarkTools v0.5.0
  [a93c6f00] DataFrames v0.22.7
  [587475ba] Flux v0.11.5
  [5cadff95] JuliennedArrays v0.2.2
  [82cb661a] SliceMap v0.2.3
```

### Results

| Name     |  CPU        |   GPU     |   
|----------|-------------|-----------|
| DARNN    |     40.5469  |  missing |
| DSANet   |      3.2352  |  missing |
| LSTNet   |    0.905873  |  missing |
| TPA-LSTM |     9.29508  |  missing |


## Julia 1.5.3 & Flux 0.11.5

### Info

```julia-repl
Julia Version 1.5.3
Commit 788b2c77c1 (2020-11-09 13:37 UTC)
Platform Info:
  OS: Windows (x86_64-w64-mingw32)
  CPU: Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-9.0.1 (ORCJIT, skylake)
Environment:
  JULIA_EDITOR = "C:\Users\Janina\AppData\Local\atom\app-1.41.0\atom.exe"  -a
  JULIA_NUM_THREADS = 4
```

```julia-repl
Status `D:\Dokumente\Soeren Programmieren\FluxArchitectures\benchmark\Project.toml`
  [fbb218c0] BSON v0.2.6
  [6e4b80f9] BenchmarkTools v0.5.0
  [a93c6f00] DataFrames v0.22.7
  [587475ba] Flux v0.11.5
  [5cadff95] JuliennedArrays v0.2.2
  [82cb661a] SliceMap v0.2.3
```

### Results

| Name     |  CPU        |   GPU     |   
|----------|-------------|-----------|
| DARNN    |    44.6088  |  78.8509  |
| DSANet   |    2.41517  |  1.57344  |
| LSTNet   |   0.878394  |  8.60008  |
| TPA-LSTM |    7.14742  |  38.2233  |
