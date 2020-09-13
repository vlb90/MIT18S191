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

# ╔═╡ 6f711a72-f222-11ea-32ac-a946dd4cd914
begin
	using Pkg
	Pkg.add(["Images", "ImageIO", "ImageMagick", "PlutoUI"])
	using Images, PlutoUI
end

# ╔═╡ 52752058-f220-11ea-2dec-637ca19fc859
md" ## Lecture 2.1: Array basics"

# ╔═╡ 6c21a8d4-f220-11ea-33e2-f5a2b81f51ec
v = [1, 2, 3, 4]

# ╔═╡ 94af6796-f220-11ea-3004-51267939d8ab
size(v)

# ╔═╡ 97fc2790-f220-11ea-1a5a-9b9a78bfd276
m = [1 2; 3 4]

# ╔═╡ b34eb0b2-f220-11ea-2a0c-e1ed9e956ae8
size(m)

# ╔═╡ 25c57efe-f222-11ea-2010-29910ff3e8c3
rand(Float64,1,5)

# ╔═╡ eeb873ae-f220-11ea-2634-9b5cb95ff315
A1 = rand(Float64, 3, 4)

# ╔═╡ c6311272-f222-11ea-2c25-89e54aa8d114
[RGB(0.1,0.2,0.3), RGB(0.1,0.6,0.3)]

# ╔═╡ aa5e6cf4-f284-11ea-3a25-f165c6e0d6c4
@bind ncolor Slider(1:100, show_value = true)

# ╔═╡ 34ae660a-f221-11ea-0706-a5eb53ef9e05
colors = distinguishable_colors(ncolor)

# ╔═╡ 75fffe98-f223-11ea-328e-7760bfcec631
A3 = rand(colors, 10, 10)

# ╔═╡ f869f454-f27f-11ea-140f-9dcd77c7f1f5
trump = load(download("https://pbs.twimg.com/profile_images/702383705990537216/i6pnLKVQ.jpg"))

# ╔═╡ 83422920-f280-11ea-17d1-ddbd32afa644
bolso = load(download("https://i.dailymail.co.uk/1s/2019/08/26/16/17701830-7395235-Jair_Bolsonaro_pictured_on_Friday_endorsed_a_sexist_Facebook_pos-m-30_1566834819088.jpg"))

# ╔═╡ 8e7446c0-f280-11ea-3b3c-79e9a293a4ca
hell = rand([trump, bolso], 5, 5)

# ╔═╡ cee28208-f280-11ea-05ee-0b610cf4945a
md"An example of multiplication table..."

# ╔═╡ dcf71ae8-f280-11ea-34ee-e781415ae5bb
A4 = [i*j for i=1:5, j=1:5] # This is call a comprehension in Julia

# ╔═╡ 764ff4f8-f281-11ea-2bd7-a3d137a8c564
md"Comprehension is equivalent to..."

# ╔═╡ 8b3bff42-f281-11ea-0366-0b0eec6ae05e
begin
	A5 = fill(0, 5, 5)
	for i in 1:5
		for j in 1:5
			A5[i, j] = i*j
		end
	end
	A5
end

# ╔═╡ Cell order:
# ╟─52752058-f220-11ea-2dec-637ca19fc859
# ╠═6f711a72-f222-11ea-32ac-a946dd4cd914
# ╠═6c21a8d4-f220-11ea-33e2-f5a2b81f51ec
# ╠═94af6796-f220-11ea-3004-51267939d8ab
# ╠═97fc2790-f220-11ea-1a5a-9b9a78bfd276
# ╠═b34eb0b2-f220-11ea-2a0c-e1ed9e956ae8
# ╠═25c57efe-f222-11ea-2010-29910ff3e8c3
# ╠═eeb873ae-f220-11ea-2634-9b5cb95ff315
# ╠═c6311272-f222-11ea-2c25-89e54aa8d114
# ╟─aa5e6cf4-f284-11ea-3a25-f165c6e0d6c4
# ╠═34ae660a-f221-11ea-0706-a5eb53ef9e05
# ╠═75fffe98-f223-11ea-328e-7760bfcec631
# ╠═f869f454-f27f-11ea-140f-9dcd77c7f1f5
# ╠═83422920-f280-11ea-17d1-ddbd32afa644
# ╠═8e7446c0-f280-11ea-3b3c-79e9a293a4ca
# ╟─cee28208-f280-11ea-05ee-0b610cf4945a
# ╠═dcf71ae8-f280-11ea-34ee-e781415ae5bb
# ╟─764ff4f8-f281-11ea-2bd7-a3d137a8c564
# ╠═8b3bff42-f281-11ea-0366-0b0eec6ae05e
