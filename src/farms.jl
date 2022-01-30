# TODO banks

include("Towers.jl")

const bunches = Dict(
    0 => 4,
    1 => 6,
    2 => 8,
    3 => 16,
    4 => 5,
    5 => 5,
    )

function bunch_value(path1_upgrades)
    if path1_upgrades < 0 || path1_upgrades > 5
        throw(ArgumentError("Argument should be within 0 and 5 inclusive"))
    end

    if path1_upgrades <= 3
        return 20
    elseif path1_upgrades == 4
        return 300
    elseif path1_upgrades == 5
        return 1200
    end
end

"""
Calculate how much a banana farm earns per round.

This is a rough calculation, as banks will earn various amounts depending on current savings.
"""
function farm_earning(upgrades)
    (t,m,b) = upgrades
    base_gen = bunches[t] * bunch_value

    if m == 2
        base_gen *= 1.25
    end
    return base_gen
end

function farm_payoff(upgrades::Tuple{Number, Number, Number})
	farm_cost = cost("Banana Farm", upgrades)
	earn = farm_earning(upgrades)
	return farm_cost / earn
end

function farm_upgrade_payoff(upgrades, bought_upgrades)
	dcost = upgrade_cost("Banana Farm", upgrades, bought_upgrades)
	dearn = farm_earning(upgrades .+ bought_upgrades) - farm_earning(upgrades)
	return dcost / dearn
end