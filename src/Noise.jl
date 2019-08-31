module Noise

using LinearAlgebra

export Worley, Perlin

struct Worley 
    fs
    Worley(d, n) = new(rand(d, n))
end

Worley(n) = Worley(2, n)

function (G::Worley)(n, p)
    Δ = map(f -> norm(p - f), eachcol(G.fs)) |> sort
    return Δ[n]
end

struct Perlin
    field
end

Perlin(xs, ys) = [rand(2) for _ in 1:xs, _ in 1:ys] |> Perlin

function (G::Perlin)(p)
    M = size(G.field) |> collect |> Diagonal
    p = M * p
    A = floor.(p)
    B = A .+ 1
end

# 1,1 => [(1,1), (1, 2), (2, 1), (2, 2)]
# 1,1,1 => [(1,1,1), (1,1,2), (1,2,1), (1,2,2), (2,1,1), (2, 1, 2), (2, 2, 2)]

end # module
