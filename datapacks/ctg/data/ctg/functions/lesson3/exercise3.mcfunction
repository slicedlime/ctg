# Player state
execute if score Tick _ctg_main matches 1 run clear @a

# Cleanups from previous lesson
tag @a remove _ctg_was_on_diamond
tag @a remove _ctg_on_diamond
tag @a remove _ctg_in_survival

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson3/exercise3_l1
function ctg:text/lesson3/exercise3_objective

# Set blocks
execute if score Tick _ctg_main matches 1 run setblock -16 127 -25 grass_block
setblock -10 125 -27 emerald_block

# Make sure the player didn't place a repeating command block
execute if block -10 126 -27 repeating_command_block{auto:1b} run function ctg:text/lesson3/repeating_block_warning
execute if block -10 126 -27 repeating_command_block run data modify block -10 126 -27 auto set value 0

# Win condition
execute if block -10 126 -27 command_block run data modify block -10 126 -27 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l3e3 LastExecution set from block -10 126 -27

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 3 if entity @a[gamemode=adventure] if score CommandExecuted _ctg_scratch matches 1 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Do this last to be able to detect game mode switches
execute unless score Completed _ctg_scratch matches 1 run function ctg:creative_mode
execute if score Completed _ctg_scratch matches 1 run setblock -10 125 -27 grass_block
