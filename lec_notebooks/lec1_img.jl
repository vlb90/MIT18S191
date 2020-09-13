### A Pluto.jl notebook ###
# v0.11.14

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

# ╔═╡ 2cb4b39e-f1c6-11ea-2d63-518831f483a7
begin
	using Images
	philip = load("philip.jpg")
end

# ╔═╡ 1d95ddfe-f1d3-11ea-0e9d-b55106047063
using PlutoUI # add iteractive content

# ╔═╡ 434ce554-f1cb-11ea-0928-43a81b907afd
md" ## Lectures 1: Images and Abstraction (Notes)"

# ╔═╡ dcfbb514-f1c5-11ea-1d2c-79f31bf2cf43
# define url adress
url = "https://i.imgur.com/VGPeJ6s.jpg"

# ╔═╡ 13c76b88-f1c6-11ea-2949-9bfa2544b862
download(url, "philip.jpg") # Download

# ╔═╡ df84ac1c-f1c7-11ea-17fd-053102073fa0
begin
	import Pkg
	Pkg.add("Images")
	Pkg.add("QuartzImageIO")
	Pkg.add("PlutoUI")
end

# ╔═╡ bd30b466-f1c8-11ea-0c8c-b795ec13c6c7
typeof(philip)

# ╔═╡ c64648c2-f1c8-11ea-0942-e348c60d7392
RGBX(0.6, 0.1, 0.1)

# ╔═╡ d4f7203a-f1c8-11ea-273f-1551235fc705
size(philip)

# ╔═╡ e3bc2e26-f1c8-11ea-2b1f-750d64ca9b47
philip[100,400]

# ╔═╡ 19994fce-f1c9-11ea-3f56-fdcdbccbc0d3
philip[3000:3500, 1:end]

# ╔═╡ 3446efc4-f1ca-11ea-24a7-23e2b27d888d
begin
	(h,w) = size(philip)
	head = philip[(h÷2):h, (w÷9):(9w÷10)]
	# \div <TAB> to get `÷'
end

# ╔═╡ 382746ce-f1cb-11ea-1ac1-77fb5d7ea936
[head head]

# ╔═╡ 8dfc6408-f1cb-11ea-2a3e-5fa0f56dfb7d
[
	head 					reverse(head, dims=2)
	reverse(head, dims=1)	reverse(reverse(head, dims=1), dims=2)	
]
	

# ╔═╡ d33f190a-f1cd-11ea-39cc-3bce77620139
new_phil = copy(head)

# ╔═╡ 107cec18-f1ce-11ea-14fe-9b185eedf299
red = RGBX(1,0,0)

# ╔═╡ 043bbee6-f1ce-11ea-0dc0-6bd4e0abc86b
begin
	for i in 1:100
		for j in 1:300
			new_phil[i,j] =red
		end
	end
end

# ╔═╡ 2b518376-f1ce-11ea-04a9-198248c11335
new_phil

# ╔═╡ a9e95f88-f1ce-11ea-0061-83f55b765fc7
begin
	new_phil2 = copy(new_phil)
	new_phil2[100:200, 1:100] .= RGB(0,1,0)
	new_phil2
end

# ╔═╡ e38e412c-f1ce-11ea-036b-97b211569e11
function redify(color)
	return RGB(color.r,0,0)
end

# ╔═╡ acc7e6ea-f1cf-11ea-1076-3d31264a131e
function greenify(color)
	return RGB(0,color.g,0)
end

# ╔═╡ c088df92-f1cf-11ea-24ac-73fa4708f78e
function bluish(color)
	return RGB(0,0,color.b)
end

# ╔═╡ 9f7a7098-f1d1-11ea-1494-159b93b69c48
@bind redvalue Slider(0:0.05:1, show_value=true)

# ╔═╡ fa2b541a-f1ce-11ea-1748-63504bbcad22
begin
	color = RGB(redvalue,0.5,0.2)
	[color, redify(color)]
end

# ╔═╡ 97ac91b0-f1cf-11ea-020f-ab099fb81126
[redify.(head) greenify.(head) bluish.(head)]

# ╔═╡ 53cbe3e4-f1d0-11ea-024f-f5d671473852
function decimate(x, r)
	y = x[1:r:end, 1:r:end]
	return y
end

# ╔═╡ 2129564c-f1d0-11ea-11cc-e11bccf65cf1
begin
	poor_phil = decimate(new_phil2, 5)
	poor_phil
end

# ╔═╡ b322a840-f1d3-11ea-1ca5-f7be3cd7843d
size(poor_phil)

# ╔═╡ Cell order:
# ╟─434ce554-f1cb-11ea-0928-43a81b907afd
# ╠═dcfbb514-f1c5-11ea-1d2c-79f31bf2cf43
# ╠═13c76b88-f1c6-11ea-2949-9bfa2544b862
# ╠═df84ac1c-f1c7-11ea-17fd-053102073fa0
# ╠═2cb4b39e-f1c6-11ea-2d63-518831f483a7
# ╠═bd30b466-f1c8-11ea-0c8c-b795ec13c6c7
# ╠═c64648c2-f1c8-11ea-0942-e348c60d7392
# ╠═d4f7203a-f1c8-11ea-273f-1551235fc705
# ╠═e3bc2e26-f1c8-11ea-2b1f-750d64ca9b47
# ╠═19994fce-f1c9-11ea-3f56-fdcdbccbc0d3
# ╠═3446efc4-f1ca-11ea-24a7-23e2b27d888d
# ╠═382746ce-f1cb-11ea-1ac1-77fb5d7ea936
# ╠═8dfc6408-f1cb-11ea-2a3e-5fa0f56dfb7d
# ╠═d33f190a-f1cd-11ea-39cc-3bce77620139
# ╠═107cec18-f1ce-11ea-14fe-9b185eedf299
# ╠═043bbee6-f1ce-11ea-0dc0-6bd4e0abc86b
# ╠═2b518376-f1ce-11ea-04a9-198248c11335
# ╠═a9e95f88-f1ce-11ea-0061-83f55b765fc7
# ╠═e38e412c-f1ce-11ea-036b-97b211569e11
# ╠═acc7e6ea-f1cf-11ea-1076-3d31264a131e
# ╠═c088df92-f1cf-11ea-24ac-73fa4708f78e
# ╠═1d95ddfe-f1d3-11ea-0e9d-b55106047063
# ╠═9f7a7098-f1d1-11ea-1494-159b93b69c48
# ╠═fa2b541a-f1ce-11ea-1748-63504bbcad22
# ╠═97ac91b0-f1cf-11ea-020f-ab099fb81126
# ╠═53cbe3e4-f1d0-11ea-024f-f5d671473852
# ╠═2129564c-f1d0-11ea-11cc-e11bccf65cf1
# ╠═b322a840-f1d3-11ea-1ca5-f7be3cd7843d
