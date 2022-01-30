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
end