"""
Bloons Tower Defense 6 information and analysis.
"""
module btd6

export towers, cost, round_money, farm_earning, farm_payoff, farm_upgrade_payoff, update_bank, new_tower, Tower, update_farm

include("towers.jl")
include("rounds.jl")
include("farms.jl")

end # module
