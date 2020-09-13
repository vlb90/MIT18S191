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

# ╔═╡ cfa28cce-f2c9-11ea-2201-ad1e66e2d3aa
begin
	import Pkg
	Pkg.add(["Plots", "Images", "ImageFiltering","DSP", "Statistics", "FFTW", "PlutoUI"])
	using Images
	using ImageFiltering
	using Plots
	using DSP
	using Statistics
	using FFTW
	using PlutoUI
end

# ╔═╡ 2dd3f308-f2d3-11ea-2e5e-13603f428fd6
md" ## Lecture 2: Convolution (kernels)"

# ╔═╡ 9fba5702-f2c7-11ea-1474-61dbe6cc606d
mario = load(download("https://target.scene7.com/is/image/Target/GUEST_92df536e-9cda-4bfa-92cb-e423bbd8e369?wid=488&hei=488&fmt=pjpeg"))

# ╔═╡ 3d0de432-f2ce-11ea-2884-8f91165f8ec3
@bind σ Slider(1:10, show_value = true)

# ╔═╡ 11aa1ebc-f2cb-11ea-133b-67a595bcc489
kernel = Kernel.gaussian((σ, σ))

# ╔═╡ 57aec998-f2cc-11ea-2f9e-91ac0b68b103
[max(-(kernel[-2,0]),0), max((kernel[-2,0]),0), 0]

# ╔═╡ 58333ecc-f2cb-11ea-012e-fd4b9168da9d
function show_colored_kernel(kernel)
	
	to_rgb(x) = RGB(max(-x,0), max(x,0), 0)
	to_rgb.(kernel)/maximum(abs.(kernel))
		
end

# ╔═╡ aaedfcdc-f2cc-11ea-2f90-5baa644ca41d
show_colored_kernel(kernel)

# ╔═╡ 670f584a-f2d3-11ea-3e45-cd0654a5ebbb
md" Sobel kernel does edge detection"

# ╔═╡ a7369240-f2cf-11ea-3104-479b94db77be
kernel2 = Kernel.sobel()[1] #horizontal

# ╔═╡ b61d66d8-f2cf-11ea-2435-634a97a21a9f
show_colored_kernel(kernel2)

# ╔═╡ 8478038c-f2d3-11ea-2c9c-7766ccdbd170
kernel3 = Kernel.sobel()[2] #vertical

# ╔═╡ 8efb0040-f2d3-11ea-3357-7ffe808343bd
show_colored_kernel(kernel3)

# ╔═╡ Cell order:
# ╠═2dd3f308-f2d3-11ea-2e5e-13603f428fd6
# ╠═cfa28cce-f2c9-11ea-2201-ad1e66e2d3aa
# ╠═9fba5702-f2c7-11ea-1474-61dbe6cc606d
# ╠═3d0de432-f2ce-11ea-2884-8f91165f8ec3
# ╠═11aa1ebc-f2cb-11ea-133b-67a595bcc489
# ╠═57aec998-f2cc-11ea-2f9e-91ac0b68b103
# ╠═58333ecc-f2cb-11ea-012e-fd4b9168da9d
# ╠═aaedfcdc-f2cc-11ea-2f90-5baa644ca41d
# ╟─670f584a-f2d3-11ea-3e45-cd0654a5ebbb
# ╠═a7369240-f2cf-11ea-3104-479b94db77be
# ╠═b61d66d8-f2cf-11ea-2435-634a97a21a9f
# ╠═8478038c-f2d3-11ea-2c9c-7766ccdbd170
# ╠═8efb0040-f2d3-11ea-3357-7ffe808343bd
