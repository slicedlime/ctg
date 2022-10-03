# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
tag @a remove _ctg_l4e5_check

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson4/exercise6_l1
function ctg:text/lesson4/exercise6_objective

# Set blocks
setblock -27 112 45 minecraft:emerald_block
execute if score Tick _ctg_main matches 1 run setblock -21 112 39 minecraft:snow_block

# Win condition
execute if block -27 113 45 command_block run data modify block -27 113 45 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l4e1 LastExecution set from block -27 113 45 LastExecution

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 6 if entity @a[tag=_ctg_l4e6_check] if block 1024 100 1024 diamond_block run scoreboard players set Completed _ctg_scratch 1

tag @a remove _ctg_l4e6_check

execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson4/exercise6_check

execute if score Completed _ctg_scratch matches 1 run fill 1024 16 1024 1024 32 1024 air

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
