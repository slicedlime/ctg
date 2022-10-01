# Player state
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run setblock -19 112 35 minecraft:packed_ice

# Cleanups from previous lesson
tag @a remove _ctg_l4e2_check

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson4/exercise3_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson4/exercise3_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson4/exercise3_l3
function ctg:text/lesson4/exercise3_objective

# Set blocks
setblock -21 112 39 emerald_block

# Make sure the player didn't place a repeating command block
execute if block -21 113 39 repeating_command_block{auto:1b} run function ctg:text/lesson3/repeating_block_warning
execute if block -21 113 39 repeating_command_block run data modify block -21 113 39 auto set value 0

# Win condition
execute if block -21 113 39 command_block run data modify block -21 113 39 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l4e3 LastExecution set from block -21 113 39 LastExecution

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 3 if entity @a[tag=_ctg_l4e3_check] positioned -21 216 39 if entity @a[distance=.5] run scoreboard players set Completed _ctg_scratch 1

tp @a[tag=_ctg_l4e3_check] -19.45 114.00 40.67
execute if entity @a[tag=_ctg_l4e3_check] run setblock -21 213 39 air
tag @a remove _ctg_l4e2_check
tag @a remove _ctg_l4e3_check

execute if score CommandExecuted _ctg_scratch matches 1 if entity @a[gamemode=survival] run function ctg:lesson4/exercise3_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
