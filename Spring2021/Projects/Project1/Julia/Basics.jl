### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ f5025a22-650c-11eb-23c1-75054f8e8cdb
md"""

# **Basics: Arithmetic, Assignment, and Strings**
"""

# ╔═╡ 3c182a0a-650c-11eb-1685-49e3bcd3eb51
md"""

## Arithmetic Operations

In this tutorial we will cover the following:

1. Infix arithmetic operators
2. Numeric literals
3. Comparisons
4. Assignments
5. Strings

"""

# ╔═╡ 6bf46612-650c-11eb-19fb-49b0fa7511a4
md""" #### Addition"""


# ╔═╡ 7b3f8ef8-650c-11eb-2383-33c6109899ce
3 + 7

# ╔═╡ 8b03c066-650c-11eb-3ada-8b8121ede97d
md""" #### Subtraction"""

# ╔═╡ 93df49c6-650c-11eb-0157-f57da219daa8
10 - 3

# ╔═╡ 98539f3e-650c-11eb-02d6-57aca4575a26
md""" #### Multiplication"""

# ╔═╡ a0c5c9ee-650c-11eb-3e3e-97f17f60367a
20 * 5

# ╔═╡ b1a7beac-650c-11eb-058c-79252084d85a
md""" #### Division"""

# ╔═╡ b8eae3e2-650c-11eb-24ea-a3e78656eff2
100/10

# ╔═╡ c932e718-650c-11eb-242c-79ea5fde17d4
100/7

# ╔═╡ 2927299a-650d-11eb-33ae-0b6bf4007f34
md""" #### Exponentiation"""

# ╔═╡ 31d7c966-650d-11eb-0706-61e911740894
100 ^ 2

# ╔═╡ 1734dc84-650d-11eb-0796-67eb40bd3e77
md""" #### Remainder (modulus)"""

# ╔═╡ 221a15a4-650d-11eb-3abc-51d32c4fb21c
100 % 2

# ╔═╡ 4f855828-650d-11eb-1de1-4b29ffde393e
md""" #### Square Root"""

# ╔═╡ 56f919f0-650d-11eb-084e-396eb5f558b1
sqrt(2)

# ╔═╡ 5d7660d8-650d-11eb-3a46-fdbbd9a6f999
sqrt(16)

# ╔═╡ 60cc43c4-650d-11eb-3a92-8f5af3fb9fa1
sqrt(pi)

# ╔═╡ 66e547bc-650d-11eb-071c-a1fd063cc8de
md"""

#### Unicode to the rescue: \sqrt + TAB

"""

# ╔═╡ 75dc9178-650d-11eb-0c1e-0b065f80f3aa
√2

# ╔═╡ 7cf96768-650d-11eb-34a4-bb9f87f30a68
√42

# ╔═╡ 860791d4-650d-11eb-3fad-cbd5fdcf6377
σ = 2.5

# ╔═╡ 8b526fd0-650d-11eb-367e-f3ad85e768cd
ϕ = 0.75

# ╔═╡ 8f39edc4-650d-11eb-0ddf-8bb89e0a1aa4
π = 1.78

# ╔═╡ 9706f7ce-650d-11eb-07fe-8b310bedbd6a
md"""
**Note:** that dividing two integers yields a floating point number. There are two additional operators that may be helpful here:

"""

# ╔═╡ d648e5c8-650d-11eb-1152-f3c5df96fbba
10 / 6

# ╔═╡ dae9b91a-650d-11eb-3fb5-5d6a0fd82ba5
10 ÷ 6

# ╔═╡ e5f1a366-650d-11eb-2a0e-07adf8a952c1
div(10, 6)

# ╔═╡ eab8ef6c-650d-11eb-1715-9786a9633909
10 // 6

# ╔═╡ f74bed88-650d-11eb-303b-4dec751bef33
md""" 

## Numbers

There are many different ways to write the number forty-two

"""

# ╔═╡ 14dd90ea-650e-11eb-01e1-f5dcf3a381b5
fortytwos = (42, 42.0, 4.20e1, 4.20f1, 84//2, 0x2a)

# ╔═╡ 2f539f32-650e-11eb-1355-517f6d7e2cb7
let
	for x in fortytwos
		show(x)
		println("\tisa $(typeof(x))")
	end
end

# ╔═╡ e17dc872-650e-11eb-3544-9923d127c531
md""" 

## Bitwise Arithmetic

"""

# ╔═╡ f4c32d50-650e-11eb-295e-e5543a80d652
0x2a & 0x70 # AND

# ╔═╡ 04f49dce-650f-11eb-2a55-03b5853cf8a9
0x2a | 0x70 # OR

# ╔═╡ 0f9e6a42-650f-11eb-315a-ab680d823b6d
42 & 112

# ╔═╡ 17440b88-650f-11eb-3b98-33e16f2d4783
0b0010 << 2 # == 0b1000

# ╔═╡ 22eb66e8-650f-11eb-264a-97b701b41857
md""" 

## Logical Operators

"""

# ╔═╡ 8a5e9c5a-650f-11eb-07e2-fbe8c65b7756
false && true # AND

# ╔═╡ 3be1d25e-650f-11eb-034e-c59b4ec66855
false || true # OR

# ╔═╡ 42ccd460-650f-11eb-0790-83da3fdc5499
md""" 

Note that they "short-circuit!"

"""

# ╔═╡ 580ea34e-650f-11eb-0c37-07dd016a22dd
begin
	x = -42
	x > 0 || error("x must be positive")
end

# ╔═╡ 71491d94-650f-11eb-3d1b-b97f01f4d8d0
md"""

## Comparisons

"""

# ╔═╡ a0262940-650f-11eb-0a38-31a0de972ff4
1 == 1.0 == 1/1 # Equality

# ╔═╡ ab9cdf58-650f-11eb-2562-53c6540cf0b7
1 === 1.0 # Programmatically identical

# ╔═╡ b79d1c78-650f-11eb-13a0-cb76c8287e81
3 < π # \pi + TAB

# ╔═╡ be8dd626-650f-11eb-08be-1ff2fb5a6a67
1 <= 1

# ╔═╡ c5e715cc-650f-11eb-34d4-0360c893fbc7
.1 + .2

# ╔═╡ cca28bda-650f-11eb-120d-b7ef242853ba
.1 + .2 ≈ .3 # \approx + TAB

# ╔═╡ e66d3d74-650f-11eb-3c70-fb3ff1fe8186
isapprox(.1 + .2, .3)

# ╔═╡ f308f5c0-650f-11eb-1a00-55a53d728941
md"""

Comparisons "chain"

Try inserting parentheses around one of these comparisons

"""

# ╔═╡ 0e7add8e-6510-11eb-0077-1135d71c7bb2
2 == 2.0 == 0x02

# ╔═╡ 2164dfba-6510-11eb-07cb-419654a884b0
y = 42

# ╔═╡ 2bc7988a-6510-11eb-3ead-cdf83f5bbc53
0 < y < 100 || error("y must be between 0 and 100")

# ╔═╡ 3ac2e678-6510-11eb-2d44-41a7e45cc7ea
md"""

### Higher Precision

"""

# ╔═╡ 47a1d0fc-6510-11eb-1c2a-1dc3aeb5fbb6
2^63

# ╔═╡ 4b9c130c-6510-11eb-18cf-87e9ca68d4ba
big(2) ^ 1000

# ╔═╡ 51f1c36e-6510-11eb-3e85-8b4a29f6da81
big(pi)

# ╔═╡ 56f6c1b6-6510-11eb-193e-8bc2a75a9040
big"0.1"

# ╔═╡ 5a718c54-6510-11eb-27e4-2586cfc3f056
big(0.1)

# ╔═╡ 61eef7fa-6510-11eb-34d7-afdaf6564b55
md"""

## Assignment



Assignment in Julia is done with the single `=`. All it does is associates a name (on the left) to a value (on the right).

"""

# ╔═╡ a7981d18-6510-11eb-3b70-6f442591261d
b = a

# ╔═╡ bbf41f5a-6510-11eb-147b-d1b971cd8a13
md"""

*Simultaneous* multiple assignment

"""

# ╔═╡ d1e59d70-6510-11eb-2978-2913b5cb15ba
begin
	i, j = 1, 2
	i, j = j, i # swap i and j
	i, j = j, i # swap back
end

# ╔═╡ fd8ce5f2-6510-11eb-2754-31d5baaa24cf
ϵ = eps(1.0) # You can make your own unicode names

# ╔═╡ 2d47c0d0-6511-11eb-2c01-a3cd38d022b6
md"""

## Updating Operators

"""

# ╔═╡ 367c4608-6511-11eb-3e3e-5f2408b3f74a
begin
	k = 0
	k += 1
	k = k + 1
	k += 1.5
end

# ╔═╡ 4287fb04-6511-11eb-0c8f-272e40054912
md""" 

Note that it is just re-purposing the *same name* for a new value. This means that the type might even change:

"""

# ╔═╡ 7d5e3f98-6511-11eb-0535-c5cea73ee713
begin
	h = 5
	h /= 2
end

# ╔═╡ 9493501a-6511-11eb-0c67-a54da6e0cbfd
md"""

## Strings

"""

# ╔═╡ 9bda5954-6511-11eb-10be-a5e1ea0c6ff6
s1 = "I am a string."

# ╔═╡ d86c01c4-6511-11eb-3316-eb739903929b
md"""

Here we get an "error" because it's ambiguous where this string ends.


_**Update:**_ Pluto does something different here!
"""

# ╔═╡ a7a2bd4e-6511-11eb-35bb-5f5a7ba00e41
s2 = """I am also" a string. """

# ╔═╡ c4565ac2-6511-11eb-0ad4-d19eb76d78f7
"""Look, Mom, no "errors"!!! """

# ╔═╡ d036fba0-6511-11eb-1699-d3068f48b090
begin
	println("""The other nice thing about triple-quoted
		       string literals is that they ignore leading
		       indentation, which is nice for long strings
		       in real code. Try changing these quotes!""")
end

# ╔═╡ 37794bae-6512-11eb-172a-e9edbd294cf1
md"""

#### String Interpolation

You can use a dollar sign inside a string to evaluate a Julia expression inside a string - either a single variable or a more complicated expression:

"""

# ╔═╡ 5f07013e-6512-11eb-0f97-a37cb27b5b50
begin
	name = "Jane"
	num_fingers = 10
	num_toes = 10
	println("Hello, my name is $name.")
	println("I have $num_fingers fingers and $num_toes toes.")
end

# ╔═╡ a6e45e84-6512-11eb-24a7-693519e0b223
md"""

We can do this in Pluto with markdown too.

"""

# ╔═╡ b71d5774-6512-11eb-19d5-3934c4ba5e1b
aname = "Jane"

# ╔═╡ c22e98bc-6512-11eb-334c-47d16b337339
numberfingers = 10

# ╔═╡ d77f3eb0-6512-11eb-2e60-39acd8273b62
numbertoes = 10

# ╔═╡ db0a554c-6512-11eb-075d-9bd25d12ddae
md"""Hello, my name is $aname.

I have $numberfingers fingers and $numbertoes toes.

"""

# ╔═╡ 01bcbffe-6513-11eb-21c4-e10f12e7ef79
md"""
That is $(numberfingers + numbertoes) digits in all!!
"""

# ╔═╡ ac103f76-6510-11eb-2338-a56ce619d2b7
a = 2

# ╔═╡ 9ae8e688-6510-11eb-2ba5-4d1a85dbb69e
a = 1 # Use the name `a` for the value `1`

# ╔═╡ Cell order:
# ╟─f5025a22-650c-11eb-23c1-75054f8e8cdb
# ╟─3c182a0a-650c-11eb-1685-49e3bcd3eb51
# ╟─6bf46612-650c-11eb-19fb-49b0fa7511a4
# ╠═7b3f8ef8-650c-11eb-2383-33c6109899ce
# ╟─8b03c066-650c-11eb-3ada-8b8121ede97d
# ╠═93df49c6-650c-11eb-0157-f57da219daa8
# ╟─98539f3e-650c-11eb-02d6-57aca4575a26
# ╠═a0c5c9ee-650c-11eb-3e3e-97f17f60367a
# ╟─b1a7beac-650c-11eb-058c-79252084d85a
# ╠═b8eae3e2-650c-11eb-24ea-a3e78656eff2
# ╠═c932e718-650c-11eb-242c-79ea5fde17d4
# ╟─2927299a-650d-11eb-33ae-0b6bf4007f34
# ╠═31d7c966-650d-11eb-0706-61e911740894
# ╟─1734dc84-650d-11eb-0796-67eb40bd3e77
# ╠═221a15a4-650d-11eb-3abc-51d32c4fb21c
# ╟─4f855828-650d-11eb-1de1-4b29ffde393e
# ╠═56f919f0-650d-11eb-084e-396eb5f558b1
# ╠═5d7660d8-650d-11eb-3a46-fdbbd9a6f999
# ╠═60cc43c4-650d-11eb-3a92-8f5af3fb9fa1
# ╟─66e547bc-650d-11eb-071c-a1fd063cc8de
# ╠═75dc9178-650d-11eb-0c1e-0b065f80f3aa
# ╠═7cf96768-650d-11eb-34a4-bb9f87f30a68
# ╠═860791d4-650d-11eb-3fad-cbd5fdcf6377
# ╠═8b526fd0-650d-11eb-367e-f3ad85e768cd
# ╠═8f39edc4-650d-11eb-0ddf-8bb89e0a1aa4
# ╟─9706f7ce-650d-11eb-07fe-8b310bedbd6a
# ╠═d648e5c8-650d-11eb-1152-f3c5df96fbba
# ╠═dae9b91a-650d-11eb-3fb5-5d6a0fd82ba5
# ╠═e5f1a366-650d-11eb-2a0e-07adf8a952c1
# ╠═eab8ef6c-650d-11eb-1715-9786a9633909
# ╟─f74bed88-650d-11eb-303b-4dec751bef33
# ╠═14dd90ea-650e-11eb-01e1-f5dcf3a381b5
# ╠═2f539f32-650e-11eb-1355-517f6d7e2cb7
# ╟─e17dc872-650e-11eb-3544-9923d127c531
# ╠═f4c32d50-650e-11eb-295e-e5543a80d652
# ╠═04f49dce-650f-11eb-2a55-03b5853cf8a9
# ╠═0f9e6a42-650f-11eb-315a-ab680d823b6d
# ╠═17440b88-650f-11eb-3b98-33e16f2d4783
# ╟─22eb66e8-650f-11eb-264a-97b701b41857
# ╠═8a5e9c5a-650f-11eb-07e2-fbe8c65b7756
# ╠═3be1d25e-650f-11eb-034e-c59b4ec66855
# ╟─42ccd460-650f-11eb-0790-83da3fdc5499
# ╠═580ea34e-650f-11eb-0c37-07dd016a22dd
# ╟─71491d94-650f-11eb-3d1b-b97f01f4d8d0
# ╠═a0262940-650f-11eb-0a38-31a0de972ff4
# ╠═ab9cdf58-650f-11eb-2562-53c6540cf0b7
# ╠═b79d1c78-650f-11eb-13a0-cb76c8287e81
# ╠═be8dd626-650f-11eb-08be-1ff2fb5a6a67
# ╠═c5e715cc-650f-11eb-34d4-0360c893fbc7
# ╠═cca28bda-650f-11eb-120d-b7ef242853ba
# ╠═e66d3d74-650f-11eb-3c70-fb3ff1fe8186
# ╟─f308f5c0-650f-11eb-1a00-55a53d728941
# ╠═0e7add8e-6510-11eb-0077-1135d71c7bb2
# ╠═2164dfba-6510-11eb-07cb-419654a884b0
# ╠═2bc7988a-6510-11eb-3ead-cdf83f5bbc53
# ╟─3ac2e678-6510-11eb-2d44-41a7e45cc7ea
# ╠═47a1d0fc-6510-11eb-1c2a-1dc3aeb5fbb6
# ╠═4b9c130c-6510-11eb-18cf-87e9ca68d4ba
# ╠═51f1c36e-6510-11eb-3e85-8b4a29f6da81
# ╠═56f6c1b6-6510-11eb-193e-8bc2a75a9040
# ╠═5a718c54-6510-11eb-27e4-2586cfc3f056
# ╟─61eef7fa-6510-11eb-34d7-afdaf6564b55
# ╠═9ae8e688-6510-11eb-2ba5-4d1a85dbb69e
# ╠═a7981d18-6510-11eb-3b70-6f442591261d
# ╠═ac103f76-6510-11eb-2338-a56ce619d2b7
# ╟─bbf41f5a-6510-11eb-147b-d1b971cd8a13
# ╠═d1e59d70-6510-11eb-2978-2913b5cb15ba
# ╠═fd8ce5f2-6510-11eb-2754-31d5baaa24cf
# ╟─2d47c0d0-6511-11eb-2c01-a3cd38d022b6
# ╠═367c4608-6511-11eb-3e3e-5f2408b3f74a
# ╟─4287fb04-6511-11eb-0c8f-272e40054912
# ╠═7d5e3f98-6511-11eb-0535-c5cea73ee713
# ╟─9493501a-6511-11eb-0c67-a54da6e0cbfd
# ╠═9bda5954-6511-11eb-10be-a5e1ea0c6ff6
# ╟─d86c01c4-6511-11eb-3316-eb739903929b
# ╠═a7a2bd4e-6511-11eb-35bb-5f5a7ba00e41
# ╠═c4565ac2-6511-11eb-0ad4-d19eb76d78f7
# ╠═d036fba0-6511-11eb-1699-d3068f48b090
# ╟─37794bae-6512-11eb-172a-e9edbd294cf1
# ╠═5f07013e-6512-11eb-0f97-a37cb27b5b50
# ╟─a6e45e84-6512-11eb-24a7-693519e0b223
# ╠═b71d5774-6512-11eb-19d5-3934c4ba5e1b
# ╠═c22e98bc-6512-11eb-334c-47d16b337339
# ╠═d77f3eb0-6512-11eb-2e60-39acd8273b62
# ╠═db0a554c-6512-11eb-075d-9bd25d12ddae
# ╠═01bcbffe-6513-11eb-21c4-e10f12e7ef79
