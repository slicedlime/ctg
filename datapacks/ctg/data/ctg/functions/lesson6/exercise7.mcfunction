# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1027 11 1027 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise7_l1
function ctg:text/lesson6/exercise7_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
fill 1024 10 1024 1026 11 1028 netherrack
fill 1024 10 1024 1026 11 1028 netherrack
fill 1025 10 1025 1025 10 1027 iron_block
fill 1025 11 1025 1025 11 1027 chain[axis=z]
execute if score Tick _ctg_main matches 1 run clone 1024 10 1024 1026 10 1028 100 129 21

execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 7 if blocks 1024 11 1024 1026 11 1028 100 129 21 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1026 10 1028 100 129 21 all run function ctg:text/lesson6/wrong_blocks
execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1026 10 1028 100 129 21 all run clone 1024 10 1024 1026 10 1028 100 129 21
