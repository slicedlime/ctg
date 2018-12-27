# Player state
function ctg:creative_mode
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run give @a minecraft:command_block

# World setup
setblock 0 0 0 minecraft:emerald_block

# Description
execute if score Tick _ctg_main matches 40 run function ctg:text/lesson1/exercise6_l1
execute if score Tick _ctg_main matches 40.. run function ctg:text/lesson1/exercise6_objective

# Win condition
execute store result score Activated _ctg_scratch run data get block 0 1 0 SuccessCount
clone 0 1 0 0 1 0 1024 0 1025
clone 0 1 0 0 1 0 1024 0 1026
clone 0 1 0 0 1 0 1024 0 1027

execute store success score SayCommand _ctg_scratch run data merge block 1024 0 1025 {"Command":"say Hello world"}
execute unless score SayCommand _ctg_scratch matches 1.. store success score SayCommand _ctg_scratch run data merge block 1024 0 1026 {"Command":"say Hello World"}
execute unless score SayCommand _ctg_scratch matches 1.. store success score SayCommand _ctg_scratch run data merge block 1024 0 1027 {"Command":"say hello world"}

scoreboard players set Complete _ctg_scratch 0
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 6 if score SayCommand _ctg_scratch matches 1 if score Activated _ctg_scratch matches 1 run scoreboard players set Complete _ctg_scratch 1

execute if score Complete _ctg_scratch matches 1 run function ctg:completed
execute if score Complete _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 2
execute if score Complete _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 0
execute if score Complete _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Complete _ctg_scratch matches 1 run function ctg:store

# Reset for next tick
data merge block 0 1 0 {"SuccessCount":0}
fill 1024 0 1025 1024 0 1027 minecraft:air
