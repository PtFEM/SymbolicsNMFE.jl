using DrWatson
@quickactivate "SymbolicsNMFE"

using Symbolics

@variables t x y
D = Differential(t)

z = t + t^2
D(z) # symbolic representation of derivative(t + t^2, t)
expand_derivatives(D(z)) # 1 + 2t

Symbolics.jacobian([x + x*y, x^2 + y],[x, y])

#2×2 Matrix{Num}:
# 1 + y  x
#    2x  1

B = simplify.([t^2 + t + t^2  2t + 4t
              x + y + y + 2t  x^2 - x^2 + y^2])

#2×2 Matrix{Num}:
#   t + 2(t^2)   6t
# x + 2(t + y)  y^2

simplify.(substitute.(B, (Dict(x => y^2),)))

#2×2 Matrix{Num}:
#     t + 2(t^2)   6t
# y^2 + 2(t + y)  y^2

substitute.(B, (Dict(x => 2.0, y => 3.0, t => 4.0),))

#2×2 Matrix{Num}:
# 36.0  24.0
# 16.0   9.0
