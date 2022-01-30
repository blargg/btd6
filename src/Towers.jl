import JSON

# TODO would be nice to cache this and update less frequently.
towers_filename = download("https://statsnite.com/api/btd/v1/towers")
towers = map(d -> (; (Symbol(k) => v for (k,v) in d)...), JSON.parsefile(towers_filename))

# Helper function, calculates the cost of an upgrade path.
function upgrades_cost(tower, path_name, total_levels, difficulty)
	sum = 0
	path = tower.paths[path_name]
	for lvl in 1:total_levels
		sum += path["upgrades"][lvl]["cost"][difficulty]
	end
	return sum
end

function cost(name::String, upgrades::Tuple{Number, Number, Number}; difficulty::String="hard")
	pos = findall(t -> t.name == name, towers)
	tower = towers[pos[1]]
	total = 0
	total += tower.cost[difficulty]
	total += upgrades_cost(tower, "path1", upgrades[1], difficulty)
	total += upgrades_cost(tower, "path2", upgrades[2], difficulty)
	total += upgrades_cost(tower, "path3", upgrades[3], difficulty)
	
	return total
end

function upgrade_cost(name::String, current_upgrades, bought_upgrades; difficulty="hard")
	cost(name, current_upgrades .+ bought_upgrades, difficulty=difficulty) -
	cost(name, current_upgrades, difficulty=difficulty)
end