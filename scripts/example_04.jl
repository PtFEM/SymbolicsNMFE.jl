using Markdown
using InteractiveUtils

using Pkg, DrWatson

begin
	@quickactivate "SymbolicsNMFE"
	using Symbolics, SymbolicUtils, ModelingToolkit
end

@parameters t
@variables x y

function f(x, y)
    @variables z
    z = x^2 + y
    [x - z, x^2 - y, z + y]
end
f(x, y)

v = [4, 4]
f(v...)

sum(f(v...))

@variables γ[1:2]
f(γ...)

SymbolicUtils.istree(f)
@variables z1
z1 = x^2 + y

ex2 = [x - z1, x^2 - y, z1 + y]
testf = build_function(ex2, [x, y, z1], expression=Val{false});
testf[1]([4, 4, z1])