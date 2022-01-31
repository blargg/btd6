using Test
using btd6

@testset "cost (tower cost)" begin
    @test cost("Bomb Shooter", (2,0,4)) == 5725
    @test cost("Dart Monkey", (0,0,0), difficulty="hard") == 215
end

@testset "round_money" begin
    @test round_money(0) == 650
    @test round_money(3) == 1046
end

@testset "farms" begin
    @test farm_earning((2,0,0)) == 160
    @test farm_earning((4,0,0)) == 5 * 300
    @test farm_payoff((2,0,0)) ≈ 15.875
    @test farm_upgrade_payoff((0,0,0), (1,0,0)) ≈ 13.5

    @testset "banks" begin
        t = new_tower("Banana Farm", upgrades=(0,3,0))
        update_bank(t)
        @test t.banked_money == 264

        # Without monkey knowledge, max for a 0,3,0 bank is 7000
        t.banked_money = 6500
        update_bank(t)
        @test t.banked_money == 7000

        # Without monkey knowledge, max for a 0,4,0 bank is 10000
        t4 = new_tower("Banana Farm", upgrades=(0,4,0))
        t4.banked_money = 9500
        update_bank(t4)
        @test t4.banked_money == 10000

        non_farm = new_tower("Dart Monkey")
        update_bank(non_farm)
        @test non_farm.banked_money == 0
        
        non_bank = new_tower("Banana Farm")
        update_bank(non_bank)
        @test non_bank.banked_money == 0
    end
end