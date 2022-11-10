# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1027 11 1027 air

fill 1024 10 1024 1026 10 1026 netherrack
fill 1024 10 1025 1026 10 1025 nether_gold_ore
setblock 1025 10 1024 nether_gold_ore
setblock 1024 10 1026 nether_gold_ore
clone 1024 10 1024 1026 10 1026 1024 11 1024
fill 1024 11 1024 1026 11 1026 ancient_debris replace nether_gold_ore

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise6_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson6/exercise6_l2
function ctg:text/lesson6/exercise6_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if blocks 1024 11 1024 1026 11 1026 98 129 26 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 run clone 1024 10 1024 1026 10 1026 98 129 26
