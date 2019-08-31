# Noise.jl
## Worley
```
julia> G = Worley(1024)
Worley([0.0195399 0.48826 … 0.801658 0.660078])

julia> F1(x, y) = G(1, [x, y])
F1 (generic function with 1 method)

julia> xaxis = range(0, 1, length=640)
0.0:0.001564945226917058:1.0

julia> yaxis = range(0, 1, length=480)
0.0:0.0020876826722338203:1.0

julia> A = [F1(x, y) for x in xaxis, y in yaxis]
640×480 Array{Float64,2}:
...

julia> map(Gray, A / maximum(A)) |> plot
```