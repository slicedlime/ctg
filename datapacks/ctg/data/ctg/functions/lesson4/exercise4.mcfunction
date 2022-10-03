# Player state
execute if score Tick _ctg_main matches 1 run clear @a
gamemode survival @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson4/exercise4_l1
function ctg:text/lesson4/exercise4_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 4 if entity @e[type=polar_bear] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
