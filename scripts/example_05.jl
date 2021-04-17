using Markdown
using InteractiveUtils

using Pkg, DrWatson

begin
	@quickactivate "SymbolicsNMFE"
	using Symbolics, SymbolicUtils, ModelingToolkit
end

function lotka_volterra!(du, u, p, t)
  x, y = u
  α, β, δ, γ = p
  du[1] = dx = α*x - β*x*y
  du[2] = dy = -δ*y + γ*x*y
end

@variables t du[1:2] u[1:2] p[1:4]
lotka_volterra!(du, u, p, t)

# du = Num[p₁ * u₁ - (p₂ * u₁) * u₂, -p₃ * u₂ + (p₄ * u₁) * u₂]

du = Num[p[1] * u[1] - (p[2] * u[1]) * u[2], -p[3] * u[2] + (p[4] * u[1]) * u[2]]

D = Differential(t)

eqs = @. D(u) ~ du

build_function(eqs, u, p, t, target=Symbolics.CTarget())

f = build_function(eqs, u, p, t, target=Symbolics.CTarget(), expression=Val{false})

du = rand(2);
u = rand(2)
p = rand(4)
t = rand()
f(du, u, p, t)

du2 = zeros(2)
lotka_volterra!(du2, u, p, t)
du == du2 # true!