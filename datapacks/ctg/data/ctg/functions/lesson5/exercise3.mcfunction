# Player state
function ctg:gamemode/adventure
clear @a
tag @a remove _ctg_l5e2_check

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson5/exercise3_l1
function ctg:text/lesson5/exercise3_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 3 if block 53 134 77 bone_block[axis=z] run scoreboard players set Completed _ctg_scratch 1

execute unless score Completed _ctg_scratch matches 1 run setblock 53 134 77 gold_block

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
