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

fill 1024 10 1024 1029 10 1029 netherrack
fill 1025 10 1025 1028 10 1028 nether_bricks
fill 1024 11 1024 1029 11 1029 netherrack
setblock 1025 11 1025 gold_block
setblock 1028 11 1028 gold_block

execute if score Tick _ctg_main matches 1 run clone 1024 11 1024 1029 11 1029 95 129 20

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 5 if blocks 95 129 20 100 129 25 1024 10 1024 all run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks
execute if score Completed _ctg_scratch matches 0 unless blocks 95 129 20 100 129 25 1024 11 1024 all run function ctg:text/lesson6/wrong_blocks
execute if score Completed _ctg_scratch matches 0 unless blocks 95 129 20 100 129 25 1024 11 1024 all run clone 1024 11 1024 1029 11 1029 95 129 20
