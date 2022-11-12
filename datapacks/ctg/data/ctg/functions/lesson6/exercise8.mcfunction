# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1027 11 1027 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise8_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson6/exercise8_l2
function ctg:text/lesson6/exercise8_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0

fill 1024 10 1024 1028 17 1030 air
setblock 1028 10 1024 shroomlight
fill 1027 11 1025 1027 11 1026 red_nether_bricks
setblock 1026 11 1027 red_nether_bricks
fill 1025 11 1028 1025 11 1029 red_nether_bricks
setblock 1024 12 1030 shroomlight
clone 1024 10 1024 1028 12 1030 1024 15 1024
fill 1024 15 1024 1028 17 1030 red_stained_glass outline
execute if score Tick _ctg_main matches 1 run clone 1024 10 1024 1028 12 1030 91 130 19

execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 8 if blocks 1024 15 1024 1028 17 1030 91 130 19 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1028 12 1030 91 130 19 all run function ctg:text/lesson6/wrong_blocks
execute if score Completed _ctg_scratch matches 0 unless blocks 1024 10 1024 1028 12 1030 91 130 19 all run clone 1024 10 1024 1028 12 1030 91 130 19
