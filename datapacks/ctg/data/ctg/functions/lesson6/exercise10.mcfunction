# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1030 30 1030 air
execute if score Tick _ctg_main matches 1 run fill 91 130 19 95 136 25 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise10_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson6/exercise10_l2
function ctg:text/lesson6/exercise10_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
place template ctg:lesson6/statue 1025 11 1025
clone 1024 10 1024 1028 15 1028 1024 20 1024
fill 1024 20 1024 1028 25 1028 yellow_stained_glass outline
execute if score Tick _ctg_main matches 1 run clone 1024 10 1024 1028 15 1028 92 132 21

execute if blocks 1024 20 1024 1028 25 1028 92 132 21 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1028 15 1028 92 132 21 all run function ctg:text/lesson6/wrong_blocks
execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1028 15 1028 92 132 21 all run clone 1024 10 1024 1028 15 1028 92 132 21
