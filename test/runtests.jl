using Test
using btd6

@testset "cost (tower cost)" begin
    @test cost("Bomb Shooter", (2,0,4)) == 5725
    @test cost("Dart Monkey", (0,0,0), difficulty="hard") == 215
end