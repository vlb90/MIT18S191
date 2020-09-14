### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 0a1aaf88-f66b-11ea-100a-7b5837e7f564
begin
	using Pkg
	Pkg.add("Printf")
	using Printf
end

# ╔═╡ 898ef6a4-f66e-11ea-2af3-3548366cdb2f
md"## Alternative solutions to hw1-1.3"

# ╔═╡ df3049b0-f66a-11ea-25be-2bc6a48c8e22
t = [[1,2],[3,4]]

# ╔═╡ 419f2044-f673-11ea-228d-1be1c470109c
md"Neat..."

# ╔═╡ f25bab72-f66a-11ea-14bc-e9ced8fb1210
hcat(t...)

# ╔═╡ 4a1ace8a-f673-11ea-2573-2f4f4580f61f
md"Step by step..."

# ╔═╡ fa7c1fce-f66a-11ea-1ee9-8339c58a2900
function f(v)
    m = fill(0,length(v), length(v))
    for i in 1:size(v)[1]		# orlength(v)
        for j in 1:size(v)[1]	# or length(v)
            m[j,i] =v[i][j][1]
        end
    end
	return m
end

# ╔═╡ 94067184-f673-11ea-3005-e547eab476e9
f(t)

# ╔═╡ 59b9448e-f673-11ea-2072-25efdba23eb0
md"Using array comprehension..."

# ╔═╡ 35e50316-f670-11ea-0800-df5414912bec
function f2(v)
	return [v[j][i] for i=1:size(v)[1], j=1:size(v)[1]]
end

# ╔═╡ 6526ee00-f670-11ea-3e5d-7963600d4cf5
f2(t)

# ╔═╡ 73e7e5e0-f673-11ea-2fca-6b8af13a3236
md"And lambda version..."

# ╔═╡ 3bcad830-f672-11ea-24cd-d39b8eaec2e0
vecvec_to_matrix(v) = [v[j][i] for i=1:size(v)[1], j=1:size(v)[1]]

# ╔═╡ 465345da-f672-11ea-20e3-f1d896521b9d
vecvec_to_matrix(t)

# ╔═╡ Cell order:
# ╟─898ef6a4-f66e-11ea-2af3-3548366cdb2f
# ╠═0a1aaf88-f66b-11ea-100a-7b5837e7f564
# ╠═df3049b0-f66a-11ea-25be-2bc6a48c8e22
# ╟─419f2044-f673-11ea-228d-1be1c470109c
# ╠═f25bab72-f66a-11ea-14bc-e9ced8fb1210
# ╟─4a1ace8a-f673-11ea-2573-2f4f4580f61f
# ╠═fa7c1fce-f66a-11ea-1ee9-8339c58a2900
# ╠═94067184-f673-11ea-3005-e547eab476e9
# ╟─59b9448e-f673-11ea-2072-25efdba23eb0
# ╠═35e50316-f670-11ea-0800-df5414912bec
# ╠═6526ee00-f670-11ea-3e5d-7963600d4cf5
# ╟─73e7e5e0-f673-11ea-2fca-6b8af13a3236
# ╠═3bcad830-f672-11ea-24cd-d39b8eaec2e0
# ╠═465345da-f672-11ea-20e3-f1d896521b9d
