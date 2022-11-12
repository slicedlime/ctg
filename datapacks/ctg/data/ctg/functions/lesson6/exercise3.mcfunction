# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run gamerule doDaylightCycle true

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise3_l1
function ctg:text/lesson6/exercise3_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store result score TimePassing _ctg_scratch run gamerule doDaylightCycle
execute store result score Time _ctg_scratch run time query daytime
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 3 if score TimePassing _ctg_scratch matches 0 if score Time _ctg_scratch matches 18000 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
