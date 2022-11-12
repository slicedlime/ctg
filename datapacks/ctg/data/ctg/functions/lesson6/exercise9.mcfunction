# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1030 20 1030 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise9_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson6/exercise9_l2
function ctg:text/lesson6/exercise9_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0

place template ctg:lesson6/messy_box 1024 10 1024
fill 1024 15 1024 1028 18 1030 orange_stained_glass hollow
execute if score Tick _ctg_main matches 1 run clone 1024 10 1024 1028 13 1030 91 133 19

execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 9 if blocks 1024 15 1024 1028 18 1030 91 133 19 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1028 13 1030 91 133 19 all run function ctg:text/lesson6/wrong_blocks
execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1028 13 1030 91 133 19 all run clone 1024 10 1024 1028 13 1030 91 133 19
