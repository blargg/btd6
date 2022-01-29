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