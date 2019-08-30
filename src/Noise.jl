module Noise

using LinearAlgebra
using Images
using Plots

export worley

function worley(W, H, n)
    M = [ W 0; 0 H]
    features = [rand(2) for _ in 1:n] |> fs -> map(f -> ceil.(Int, M * f), fs)
    F1(x) = minimum(map(f -> norm(x - f), features))
    Δ = [F1([x,y]) for y in 1:H, x in 1:W]
    Δmax = maximum(Δ)
    Δnorm = map(δ -> δ / Δmax, Δ)
    map(Gray, Δnorm)
end

end # module
