# Player state
function ctg:gamemode/adventure
clear @a
tag @a remove _ctg_l5e10_check
execute if score Tick _ctg_main matches 1 run gamerule doWeatherCycle false
execute if score Tick _ctg_main matches 1 run weather rain
execute if score Tick _ctg_main matches 1 run tag @a remove _ctg_l6e1_ready

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise1_l1
function ctg:text/lesson6/exercise1_objective

# Win condition
tag @a[predicate=ctg:raining] add _ctg_l6e1_ready
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 1 if entity @p[predicate=!ctg:raining,tag=_ctg_l6e1_ready] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
