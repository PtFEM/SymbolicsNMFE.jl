### A Pluto.jl notebook ###
# v0.14.1

using Markdown
using InteractiveUtils

# ╔═╡ 56a604d4-ec32-404f-91bc-86fa24b9bb47
using Pkg, DrWatson

# ╔═╡ 286f9602-6773-4fe0-ac75-36b19d8333f0
begin
	@quickactivate "SymbolicsNMFE"
	using Symbolics
end

# ╔═╡ 278c20ed-066d-436d-836a-10c34661c3eb
md"
!!! tip
	Output from `versioninfo()` is shown in terminal.
"

# ╔═╡ c656232f-745c-47b9-8abd-d10319082900
Text(sprint(show, "text/plain", versioninfo()));

# ╔═╡ f419c6fc-7b77-4ec6-80c0-8672b064c7f4
begin
	@variables t x y
	D = Differential(t)
end;

# ╔═╡ 2292c3af-6ca4-415f-b637-610dbbe42cab
begin
	z = t + t^2
	D(z) # symbolic representation of derivative(t + t^2, t)
	expand_derivatives(D(z)) # 1 + 2t
end

# ╔═╡ 340e4b31-4de7-40e3-816e-6e705df711de
begin
	b0 = Symbolics.jacobian([x + x*y, x^2 + y],[x, y])
	Text(sprint(show, "text/plain", b0))
end

# ╔═╡ 0d87482f-7a1a-495f-94fb-a6a625534801
begin
	#2×2 Matrix{Num}:
	# 1 + y  x
	#    2x  1
	b = [
		t^2 + t + t^2  2t + 4t
		x + y + y + 2t  x^2 - x^2 + y^2
	]

	b1 = simplify.(b)
	
	Text(sprint(show, "text/plain", b1))
end

# ╔═╡ a9376da1-b58a-4134-ab77-3db8ef42695e
begin
	#2×2 Matrix{Num}:
	#   t + 2(t^2)   6t
	# x + 2(t + y)  y^2

	b2 = simplify.(substitute.(b, (Dict(x => y^2),)))
	
	Text(sprint(show, "text/plain", b2))
end

# ╔═╡ c0df2952-f0f0-414a-92a3-3b1c6c622206
begin
	#2×2 Matrix{Num}:
	# 36.0  24.0
	# 16.0   9.0

	b3 = substitute.(b, (Dict(x => 2.0, y => 3.0, t => 4.0),))
	Text(sprint(show, "text/plain", b3))
end

# ╔═╡ 9b7a5d1d-1a3e-40bc-86c2-6cf7cedc57a0
begin
	#2×2 Matrix{Num}:
	#   t + 2(t^2)   6t
	# 2t + 2y  y^2

	b4 = simplify.(substitute.(b, (Dict(x => 2y),)))
	Text(sprint(show, "text/plain", b4))
end

# ╔═╡ 65237ef6-7c92-4687-96cb-766016f5ed73
md"
!!! note
	Element [2,1] == 16
"

# ╔═╡ 412ef249-a7ac-42ef-b30e-4e77cddcd9a6
begin
	#2×2 Matrix{Num}:
	# 36.0  24.0
	# 16.0   9.0

	b5 = substitute.(b4, (Dict(x => 2.0, y => 3.0, t => 4.0),))
	Text(sprint(show, "text/plain", b5))
end

# ╔═╡ Cell order:
# ╠═56a604d4-ec32-404f-91bc-86fa24b9bb47
# ╠═286f9602-6773-4fe0-ac75-36b19d8333f0
# ╟─278c20ed-066d-436d-836a-10c34661c3eb
# ╠═c656232f-745c-47b9-8abd-d10319082900
# ╠═f419c6fc-7b77-4ec6-80c0-8672b064c7f4
# ╠═2292c3af-6ca4-415f-b637-610dbbe42cab
# ╠═340e4b31-4de7-40e3-816e-6e705df711de
# ╠═0d87482f-7a1a-495f-94fb-a6a625534801
# ╠═a9376da1-b58a-4134-ab77-3db8ef42695e
# ╠═c0df2952-f0f0-414a-92a3-3b1c6c622206
# ╠═9b7a5d1d-1a3e-40bc-86c2-6cf7cedc57a0
# ╟─65237ef6-7c92-4687-96cb-766016f5ed73
# ╠═412ef249-a7ac-42ef-b30e-4e77cddcd9a6
