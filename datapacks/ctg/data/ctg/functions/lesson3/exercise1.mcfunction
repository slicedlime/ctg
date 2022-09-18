# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson3/exercise1_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson3/exercise1_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson3/exercise1_l3
function ctg:text/lesson3/exercise1_objective

# Set blocks
setblock -16 127 -25 emerald_block

# Make sure the player didn't place a repeating command block
execute if block -16 128 -25 repeating_command_block{auto:1b} run function ctg:text/lesson3/repeating_block_warning
execute if block -16 128 -25 repeating_command_block run data modify block -16 128 -25 auto set value 0

# Win condition
execute if block -16 128 -25 command_block run data modify block -16 128 -25 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l3e1 LastExecution set from block -16 128 -25

tag @a remove _ctg_was_on_diamond
tag @a[tag=_ctg_on_diamond] add _ctg_was_on_diamond
tag @a remove _ctg_on_diamond
execute positioned -6.5 128 -32.5 run tag @a[distance=..0.5] add _ctg_on_diamond

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 1 if entity @a[tag=!_ctg_was_on_diamond,tag=_ctg_on_diamond] if score CommandExecuted _ctg_scratch matches 1 if block -7 127 -33 redstone_block run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

setblock -7 127 -33 diamond_block
execute if score Completed _ctg_scratch matches 1 run setblock -7 127 -33 redstone_block
