using Markdown
using InteractiveUtils

using Pkg, DrWatson

begin
	@quickactivate "SymbolicsNMFE"
	using Symbolics, SymbolicUtils, ModelingToolkit
end

@parameters t
@variables x y z(t)

ex = x + y + sin(z)

display(ex)
println()

SymbolicUtils.istree(ex)

substitute(ex, Dict([x => z, sin(z) => z^2]))

ex2 = x + y + sin(pi / 2 )
substitute(ex2, Dict([x => 3, y => 1, z => 3]))

Symbolics.get_variables(ex)
Symbolics.get_variables(ex2)

substitute(ex, Dict([x => 3, y => -2, z => pi/4]))
