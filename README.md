# Machine learning from scratch in Julia

This is a "Machine-learning from scratch" tutorial in Julia. It demonstrates
how to implement a simple artificial neural network with automatic
differentiation and a simple gradient descent optimizer, using only the
Julia standard library and a (very) few data structure packages.

This tutorial uses the
[UCI ML SUSY Data Set](https://archive.ics.uci.edu/ml/datasets/SUSY), a
binary clasification dataset with 5 million events and 18 features.

Install and configure Julia: If you're new to Julia we recommend you follow
the [instuctions linked here](https://github.com/oschulz/julia-setup).

Now open a [Julia REPL](https://docs.julialang.org/en/v1/stdlib/REPL/)
and go through the following steps to install all required Julia packages
required for this tutorial:

```
julia> cd("PATH/TO/YOUR/DOWNLOAD/OF/teaching-ml-from-scratch")
# Press "]" key to enter the Pkg console, then
(@v1.11) pkg> activate .
(teaching-ml-from-scratch) pkg> instantiate
# Press backspace (or <ctrl-C>) to exit the Pkg console
```
