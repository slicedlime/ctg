# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1030 30 1030 air
tag @a remove _ctg_l6e12_check

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise13_l1
function ctg:text/lesson6/exercise13_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
place template ctg:plushie 1024 10 1025 counterclockwise_90

execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 13 if blocks 1024 10 1024 1026 13 1025 100 131 30 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 14
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 run place template ctg:plushie 100 132 31 counterclockwise_90
