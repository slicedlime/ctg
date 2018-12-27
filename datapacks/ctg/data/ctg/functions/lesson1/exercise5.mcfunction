# Player state
function ctg:creative_mode
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run give @a minecraft:command_block

# World setup
setblock 0 0 0 minecraft:emerald_block
setblock 0 0 10 minecraft:diamond_block

# Description
execute if score Tick _ctg_main matches 40 run function ctg:text/lesson1/exercise5_l1
execute if score Tick _ctg_main matches 40.. run function ctg:text/lesson1/exercise5_objective

# Win condition
execute store result score Swords _ctg_scratch run clear @a minecraft:diamond_sword
execute store result score Activated _ctg_scratch run data get block 0 1 0 SuccessCount

scoreboard players set Complete _ctg_scratch 0
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 5 if score Swords _ctg_scratch matches 1 if score Activated _ctg_scratch matches 1 if entity @a[x=0.5,y=1,z=10.5,distance=..1] run scoreboard players set Complete _ctg_scratch 1

execute if score Complete _ctg_scratch matches 1 run function ctg:completed
execute if score Complete _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 1
execute if score Complete _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Complete _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Complete _ctg_scratch matches 1 run function ctg:store

# Reset for next tick
data merge block 0 1 0 {"SuccessCount":0}
