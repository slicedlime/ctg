# Check if the player has the right command block active by teleporting to a known location and verifying that it turns to gold
tag @s remove _ctg_l9e3
execute if block -21 187 -123 gold_block run tag @s add _ctg_l9e3_gold
setblock -21 187 -123 air
tp @s -4 98 -115
