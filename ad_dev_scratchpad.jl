using Symbolics, ForwardDiff

@variables x δy
δy * Symbolics.derivative(relu(x), x)


pullback(0.7, logistic, 0.3)
0.7 * ForwardDiff.derivative(logistic, 0.3)
