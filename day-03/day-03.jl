### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ 3a7ebc10-0be3-11ee-31c1-6552eb7188e0
function pick(input)
	left, right = Set{Char}(), Set{Char}()
	m = length(input) ÷ 2
	for i in 1:m
		push!(left, input[i])
	end
	for i in (m+1) : length(input)
		if input[i] in left
			return input[i]
		end
	end
	return '-'
end

# ╔═╡ 945d9291-f279-4535-bc5a-7bbbb0eaca4a
priorities(char) = if islowercase(char)
	Int(char) - Int('a') + 1
else
	Int(char) - Int('A') + 1 + 26
end

# ╔═╡ 7ae3ac9f-fb72-4d6e-bef1-fa5e366c44ea
function commonitem(sacks...)
	sets = [Set(sack) for sack in sacks]
	for item in sets[1]
		if all([item in set for set in sets[2:end]])
			return item
		end
	end
	return '-'
end

# ╔═╡ 8a4b5594-9f84-41ee-a2c8-615cec3d9490
commonitem("a", "ab", "abc")

# ╔═╡ d43cd6aa-1a20-4587-a3a7-8c499e4cad3f
let
	s = 0
	group = Vector{String}()
	for rucksack in readlines("input.txt")
		push!(group, rucksack)
		if length(group) == 3
			s += priorities(commonitem(group...))
			empty!(group)
		end
	end
	s
end

# ╔═╡ fa10df68-97a1-41fa-ae1c-04922bfcd1a0
let
	s = 0
	for rucksack in readlines("input.txt")
		s += priorities(pick(rucksack))
	end
	s
end

# ╔═╡ Cell order:
# ╠═3a7ebc10-0be3-11ee-31c1-6552eb7188e0
# ╠═945d9291-f279-4535-bc5a-7bbbb0eaca4a
# ╠═7ae3ac9f-fb72-4d6e-bef1-fa5e366c44ea
# ╠═8a4b5594-9f84-41ee-a2c8-615cec3d9490
# ╠═d43cd6aa-1a20-4587-a3a7-8c499e4cad3f
# ╠═fa10df68-97a1-41fa-ae1c-04922bfcd1a0
