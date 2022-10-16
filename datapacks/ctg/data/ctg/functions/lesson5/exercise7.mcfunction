# Player state
function ctg:gamemode/creative

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson5/exercise7_l1
function ctg:text/lesson5/exercise7_objective

# Win condition
execute store result score Count _ctg_scratch run clear @a debug_stick 0

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 7 if score Count _ctg_scratch matches 1.. run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
