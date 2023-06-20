### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ 57c98060-0bdf-11ee-0320-b5da96d1aed2
let
	d = Dict("A"=>1, "B"=>2, "C"=>3, "X"=>1, "Y"=>2, "Z"=>3)
	point = 0
	for line in readlines("input.txt")
		oppo, me = split(line)
		p = mod(d[me] - d[oppo], 3)
		point += mod(p + 1, 3) * 3 + d[me]
	end
	point
end

# ╔═╡ 9147bbb5-20d2-4d4c-82ba-fd7a8367bd83
function move(oppo, result)
	# result = 0 (draw); 1 (win); -1 (lose)
	mod(oppo + result, 1:3)
end

# ╔═╡ 73611ad1-f228-4891-a4d5-3fc6c8b8c1fe
let
	resultpoint = Dict("X"=>0, "Y"=>3, "Z"=>6)
	result = Dict("X"=>-1, "Y"=>0, "Z"=>1)
	d = Dict("A"=>1, "B"=>2, "C"=>3)
	point = 0
	for line in readlines("input.txt")
		oppo, goal = split(line)
		point += resultpoint[goal] + move(d[oppo], result[goal])
	end
	point
end	

# ╔═╡ Cell order:
# ╠═57c98060-0bdf-11ee-0320-b5da96d1aed2
# ╠═9147bbb5-20d2-4d4c-82ba-fd7a8367bd83
# ╠═73611ad1-f228-4891-a4d5-3fc6c8b8c1fe
