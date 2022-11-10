# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run gamerule doWeatherCycle true
execute if score Tick _ctg_main matches 1 run weather clear 1000000
gamerule doFireTick false

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise4_l1
function ctg:text/lesson6/exercise4_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store result score WeatherOn _ctg_scratch run gamerule doWeatherCycle
execute if score WeatherOn _ctg_scratch matches 0 if entity @p[predicate=ctg:thundering] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
