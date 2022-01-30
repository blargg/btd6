# TODO banks

const banana_value = 20
const bunches = [4,6,8,16]

"""
Calculate how much a banana farm earns per round.

This is a rough calculation, as banks will earn various amounts depending on current savings.
"""
function farm_earning(upgrades)
    (t,m,b) = upgrades
    base_gen = 0
    if t <= 4
        bananas_gen = bunches[t+1]
        base_gen = banana_value * bananas_gen
    elseif t==5
        base_gen = 5 * 300
    end

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