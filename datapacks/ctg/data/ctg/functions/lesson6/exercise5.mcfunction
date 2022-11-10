# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run gamerule doWeatherCycle false
execute if score Tick _ctg_main matches 1 run gamerule doDaylightCycle true
execute if score Tick _ctg_main matches 1 run weather clear 1000000

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise5_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson6/exercise5_l2
function ctg:text/lesson6/exercise5_objective

fill 1024 10 1024 1027 10 1027 nether_bricks

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if blocks 96 129 21 99 129 24 1024 10 1024 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks
fill 1024 11 1024 1027 11 1027 netherrack
setblock 1024 11 1024 gold_block
setblock 1027 11 1027 gold_block
execute if score Completed _ctg_scratch matches 0 unless blocks 96 129 21 99 129 24 1024 11 1024 all run clone 1024 11 1024 1027 11 1027 96 129 21
