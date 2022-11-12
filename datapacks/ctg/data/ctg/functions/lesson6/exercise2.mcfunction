# Player state
function ctg:gamemode/adventure
clear @a
tag @a remove _ctg_l6e1_ready
execute if score Tick _ctg_main matches 1 run gamerule doDaylightCycle false

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise2_l1
function ctg:text/lesson6/exercise2_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store result score TimePassing _ctg_scratch run gamerule doDaylightCycle
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 2 if score TimePassing _ctg_scratch matches 1 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
