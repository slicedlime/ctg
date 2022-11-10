# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1027 11 1027 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise7_l1
function ctg:text/lesson6/exercise7_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if block 101 129 24 chain[axis=z] if block 101 129 23 chain[axis=z] if block 101 129 22 chain[axis=z] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 run fill 101 129 24 101 129 22 iron_block
