# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1030 30 1030 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise14_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson6/exercise14_l2
function ctg:text/lesson6/exercise14_objective

execute if score Tick _ctg_main matches 1 run fill 103 130 27 105 130 28 air
execute if score Tick _ctg_main matches 1 run fill 103 126 27 105 129 28 water

# Win condition
scoreboard players set Completed _ctg_scratch 0
fill 1024 10 1024 1028 13 1027 stone
fill 1025 13 1025 1027 13 1026 water
place template ctg:lesson6/plushie_void 1025 10 1025

execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 14 if blocks 1025 10 1025 1027 13 1026 103 126 27 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 15
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 run place template ctg:lesson6/plushie_void 100 131 30
execute if score Completed _ctg_scratch matches 0 run fill 103 130 27 105 130 28 air
execute if score Completed _ctg_scratch matches 0 run fill 103 126 27 105 129 28 water
