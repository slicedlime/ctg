# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run summon minecraft:sheep 89.50 115.00 -45.50 {Color:5b, Invulnerable: 1b, NoAI:1, Tags:["_ctg_l7e1_sheep"], Rotation:[-90f, 0f]}

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson7/exercise1_l1
function ctg:text/lesson7/exercise7_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 1 unless entity @e[type=sheep,tag=_ctg_l7e1_sheep] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
