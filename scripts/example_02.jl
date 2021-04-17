using Markdown
using InteractiveUtils

using Pkg, DrWatson

begin
	@quickactivate "SymbolicsNMFE"
	using Symbolics
end

@variables t b[1:3]
β

@variables w(..) x1(t) y z(t, α, x)

expr = β[1]* x + y^α + σ(3) * (z - t) - β[2] * w(t - 1)
expr |> display
println()

@variables y[1:3](t)

@variables t α σ(..) β[1:2]

@variables x y

@variables A[1:3, 1:3] B[1:3, 1:3];

display(x ~ y)
println()

display(x - y ~ 0)
println()

display(A .~ B)
println()

display(A .~ 3x)
println()

display(A .~ [1 2 3;]' * x)
println()

display(A .~ [1, 2, 3] * x)
println()
