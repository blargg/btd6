const rounds_unmapped = [
    (1, 20, 121, 121),
    (2, 35, 137, 258),
    (3, 35, 138, 396),
    (4, 71, 175, 571),
    (5, 59, 164, 735),
    (6, 57, 163, 898),
    (7, 75, 182, 1080),
    (8, 92, 200, 1280),
    (9, 90, 199, 1479),
    (10, 204, 314, 1793),
    (11, 78, 189, 1982),
    (12, 80, 192, 2174),
    (13, 169, 282, 2456),
    (14, 145, 259, 2715),
    (15, 151, 266, 2981),
    (16, 152, 268, 3249),
    (17, 48, 165, 3414),
    (18, 240, 358, 3772),
    (19, 141, 260, 4032),
    (20, 66, 186, 4218),
    (21, 230, 351, 4569),
    (22, 176, 298, 4867),
    (23, 154, 277, 5144),
    (24, 43, 167, 5311),
    (25, 210, 335, 5646),
    (26, 207, 333, 5979),
    (27, 535, 662, 6641),
    (28, 138, 266, 6907),
    (29, 260, 389, 7296),
    (30, 207, 337, 7633),
    (31, 406, 537, 8170),
    (32, 545, 627, 8797),
    (33, 72, 205, 9002),
    (34, 778, 912, 9914),
    (35, 1015, 1150, 11064),
    (36, 760, 896, 11960),
    (37, 1202, 1339, 13299),
    (38, 1139, 1277, 14576),
    (39, 1620, 1759, 16335),
    (40, 381, 521, 16856),
    (41, 2040, 2181, 19037),
    (42, 517, 659, 19696),
    (43, 1135, 1278, 20974),
    (44, 1150, 1294, 22268),
    (45, 2289, 2422, 24690),
    (46, 570, 716, 25406),
    (47, 1490, 1637, 27043),
    (48, 2695, 2843, 29886),
    (49, 4609, 4758, 34644),
    (50, 2866, 3016, 37660),
    (51, 947, 1098, 38758),
    (52, 1444, 1596, 40354),
    (53, 771, 924, 41278),
    (54, 2044, 2198, 43476),
    (55, 2328, 2483, 45959),
    (56, 1130, 1286, 47245),
    (57, 1702, 1859, 49104),
    (58, 2140, 2298, 51402),
    (59, 2000, 2159, 53561),
    (60, 763, 923, 54484),
    (61, 1071, 1232, 55716),
    (62, 1225, 1387, 57102),
    (63, 2663, 2826, 59928),
    (64, 686, 850, 60778),
    (65, 2906, 3071, 63849),
    (66, 838, 1004, 64854),
    (67, 856, 1024, 65877),
    (68, 609, 778, 66655),
    (69, 1222, 1391, 68046),
    (70, 2449, 2619, 70665),
    (71, 1332, 1503, 72168),
    (72, 1332, 1504, 73672),
    (73, 1220, 1392, 75064),
    (74, 2870, 3044, 78108),
    (75, 2493, 2668, 80776),
    (76, 1140, 1316, 82092),
    (77, 2363, 2540, 84632),
    (78, 4684, 4862, 89494),
    (79, 6530, 6709, 96203),
    (80, 1220, 1400, 97603),
    (81, 5185, 5366, 102969),
    (82, 4575, 4757, 107726),
    (83, 4566, 4749, 112475),
    (84, 6860, 7044, 119519),
    (85, 2441, 2626, 122145),
    (86, 762, 948, 123093),
    (87, 2440, 2627, 125720),
    (88, 3126, 3314, 129034),
    (89, 1982, 2171, 131205),
    (90, 149, 339, 131545),
    (91, 4000, 4191, 135736),
    (92, 4345, 4537, 140273),
    (93, 1754, 1947, 142220),
    (94, 7473, 7667, 149887),
    (95, 3523, 3718, 153605),
    (96, 9759, 9955, 163560),
    (97, 1221, 1418, 164978),
    (98, 9455, 9653, 174631),
    (99, 2629, 2828, 177459),
    (100, 1335, 1535, 178994),
    (101, 225, 426, 179420),
    (102, 899, 1101, 180521),
    (103, 2386, 2589, 183110),
    (104, 2764, 2968, 186078),
    (105, 1678, 1883, 187961),
    (106, 708, 914, 188875),
    (107, 1463, 1670, 190545),
    (108, 2074, 2282, 192827),
    (109, 2975, 3184, 196011),
    (110, 991, 1201, 197212),
    (111, 3172, 3383, 200595),
    (112, 747, 959, 201554),
    (113, 845, 1058, 202612),
    (114, 2157, 2371, 204983),
    (115, 2157, 2372, 207355),
    (116, 1573, 1789, 209144),
    (117, 377, 594, 209738),
    (118, 1448, 1666, 211404),
    (119, 533, 752, 212156),
    (120, 1342, 1562, 213718),
]

const rounds = map(t -> (round = t[1], pop = t[2], total = t[3], cumulative = t[4]),
    rounds_unmapped)

const STARTING_MONEY = 650;

"""
Returns the amount of money available at the *end* of that round, not including income from towers, heroes or other abilities.
This is `starting money + money from popped ballons + end of round money`
This assumes all ballons popped. Actual cash in game will be less if ballons leaked.
"""
function round_money(round_number::Number)
    if round_number == 0
        return STARTING_MONEY
    else
        return STARTING_MONEY + rounds[round_number].cumulative
    end
end