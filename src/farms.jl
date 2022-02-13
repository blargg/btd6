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
Updates the farm after 1 round of play.

If it is a bank, update the bank holdings. Automatically cash them out when they are (nearly?) full.
Return the money generated.
"""
function update_farm(tower::Tower)::Number
    (t,m,b) = tower.upgrades

    if m >= 3
        update_bank(tower)
        # Cash out banks when they are within 200 of their max
        if tower.banked_money >= bank_max(tower.upgrades) - 200
            ret = tower.banked_money
            tower.banked_money = 0
            return ret
        end
        return 0
    elseif b >= 3
        throw("unimplemented")
    else
        return farm_earning(upgrades)
    end
end

"""
Calculate how much a banana farm earns per round.

This is a rough calculation, as banks will earn various amounts depending on current savings.
This works for default (less than 3 upgrades in any) and top tree.
"""
function farm_earning(upgrades)::Number
    (t,m,b) = upgrades
    bunches_produced = bunches[t]
    bv = bunch_value(t)

    if m == 2
        bv = floor(bunch_value * 1.25)
    end
    return bunches_produced * bv 
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

"""
  bank_max(upgrades)

Returns the maximum amount of money that a bank can store.
"""
function bank_max(upgrades)
    # TODO account for the monkey knowledge that allows more storage.
    path2 = upgrades[2]
    if path2 == 3
        return 7000
    elseif path2 >= 4
        return 10000
    else
        return 0
    end
end

"""
Simulates 1 full round of bank income.
Adds money to the bank, then applies intrest.
"""
function update_bank(tower::Tower)
    if tower.type != "Banana Farm"
        return
    end

    path2 = tower.upgrades[2]
    if path2 < 3
        return
    end

    tower.banked_money = floor((tower.banked_money + 230) * 1.15)
    b_max = bank_max(tower.upgrades)
    if tower.banked_money >= b_max
        tower.banked_money = b_max
    end
end
