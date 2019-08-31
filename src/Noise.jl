module Noise

using LinearAlgebra

export Worley

struct Worley 
    fs
    Worley(d, n) = new(rand(d, n))
end

Worley(n) = Worley(2, n)

function (G::Worley)(n, x)
    Δ = map(f -> norm(x - f), eachcol(G.fs)) |> sort
    return Δ[n]
end

end # module
