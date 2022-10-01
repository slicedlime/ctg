# Player state
function ctg:creative_mode
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson3/exercise6_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson3/exercise6_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson3/exercise6_l3
function ctg:text/lesson3/exercise6_objective

# Set base blocks
fill -27 124 -39 -26 124 -37 gold_block
setblock -22 124 -32 minecraft:emerald_block
setblock -21 124 -34 minecraft:grass_block[snowy=false]
setblock -21 124 -39 minecraft:diamond_block
execute unless block -21 125 -39 polished_blackstone_button run setblock -21 125 -39 minecraft:polished_blackstone_button[face=floor,facing=west]

# Set the statue
fill -27 125 -34 -26 127 -32 gray_wool
fill -27 128 -32 -26 128 -34 air
setblock -27 128 -34 minecraft:gray_wool
setblock -27 128 -32 minecraft:gray_wool
fill -26 125 -34 -27 125 -34 white_wool
fill -26 125 -32 -27 125 -32 white_wool
setblock -26 126 -32 minecraft:light_blue_wool
setblock -26 126 -34 minecraft:light_blue_wool
setblock -26 125 -33 minecraft:pink_wool

execute if score L3E6Test _ctg_main matches 1.. run scoreboard players add L3E6Test _ctg_main 1

# If the button is pressed, clear the area and activate the chain
execute unless score L3E6Test _ctg_main matches 1.. if block -21 125 -39 polished_blackstone_button[powered=true] if block -22 125 -32 minecraft:command_block run function ctg:lesson3/exercise6_test

# Win condition

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 6 if score L3E6Test _ctg_main matches 2 if blocks -27 125 -39 -26 128 -37 -27 125 -34 all run scoreboard players set Completed _ctg_scratch 1
execute if score L3E6Test _ctg_main matches 2.. run scoreboard players reset L3E6Test _ctg_main

execute if score Completed _ctg_scratch matches 1 run function ctg:lesson3/continue
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
