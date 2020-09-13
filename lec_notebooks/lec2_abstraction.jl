### A Pluto.jl notebook ###
# v0.11.12

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 8a61a3bc-f21d-11ea-0551-3bfe8ae4adca
begin
	using Pkg
	Pkg.add(["Images", "PlutoUI"])
	using Images
	using PlutoUI
end

# ╔═╡ 6cf81848-f210-11ea-22cd-8b500d836553
md" ## Lecture 2: Abstraction"

# ╔═╡ 82f6d198-f21f-11ea-09ff-9f3b17b26cf6
decimate(image,factor) = image[1:factor:end, 1:factor:end]

# ╔═╡ 32dcf9aa-f21f-11ea-04c2-158780c4583d
@bind nrow Slider(1:6, show_value = true)

# ╔═╡ bbfdc08e-f21d-11ea-2388-9bffb1236a80
onefig = load(download("https://www.pinclipart.com/picdir/big/16-161946_animal-clip-art-number-one-vector-site-number.png"))

# ╔═╡ 9b8050cc-f210-11ea-228c-49e4acf7f05a
element = decimate(onefig,10)

# ╔═╡ 9fc6083e-f210-11ea-08d4-3baad95a38a6
array_element = fill(element, nrow, 4)

# ╔═╡ b1700826-f21c-11ea-14c3-45c5424822ba
typeof(array_element)

# ╔═╡ ced9a3f4-f21c-11ea-3793-a11716dab518
keeptrack = [typeof(element), typeof(1//1), typeof(1.0), typeof(array_element), typeof("one"), typeof([1 2; 3 4])]

# ╔═╡ 42cc0402-f21d-11ea-1f4f-7f5c004df98f
typeof(keeptrack)

# ╔═╡ 74e6a5c0-f21e-11ea-3837-754fe84176f0
size(onefig)

# ╔═╡ Cell order:
# ╟─6cf81848-f210-11ea-22cd-8b500d836553
# ╠═8a61a3bc-f21d-11ea-0551-3bfe8ae4adca
# ╟─82f6d198-f21f-11ea-09ff-9f3b17b26cf6
# ╠═9b8050cc-f210-11ea-228c-49e4acf7f05a
# ╠═32dcf9aa-f21f-11ea-04c2-158780c4583d
# ╠═9fc6083e-f210-11ea-08d4-3baad95a38a6
# ╠═b1700826-f21c-11ea-14c3-45c5424822ba
# ╠═ced9a3f4-f21c-11ea-3793-a11716dab518
# ╠═42cc0402-f21d-11ea-1f4f-7f5c004df98f
# ╠═bbfdc08e-f21d-11ea-2388-9bffb1236a80
# ╠═74e6a5c0-f21e-11ea-3837-754fe84176f0
