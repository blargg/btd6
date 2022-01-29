using Test
using btd6

@testset "cost (tower cost)" begin
    @test cost("Bomb Shooter", (2,0,4)) == 5725
    @test cost("Dart Monkey", (0,0,0), difficulty="hard") == 215
end

@testset "rounds" begin
    @test rounds[1].pop == 20
    @test rounds[120].cumulative == 213718
end