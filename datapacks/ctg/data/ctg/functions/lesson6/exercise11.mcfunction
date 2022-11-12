# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1030 30 1030 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise11_l1
function ctg:text/lesson6/exercise11_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
place template ctg:lesson6/tree 1024 10 1024
clone 1024 10 1024 1036 16 1036 1024 20 1024
fill 1024 20 1024 1036 26 1036 warped_wart_block replace nether_wart_block
execute if score Tick _ctg_main matches 1 run clone 1024 10 1024 1036 16 1036 98 133 17

execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 11 if blocks 1024 20 1024 1036 26 1036 98 133 17 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 12
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1036 16 1036 98 133 17 all run function ctg:text/lesson6/wrong_blocks
execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1036 16 1036 98 133 17 all run clone 1024 10 1024 1036 16 1036 98 133 17
