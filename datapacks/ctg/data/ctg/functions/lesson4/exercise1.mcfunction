# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson4/exercise1_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson4/exercise1_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson4/exercise1_l3
function ctg:text/lesson4/exercise1_objective

# Set blocks
setblock -15 112 36 minecraft:emerald_block

# Win condition
execute if block -15 113 36 command_block run data modify block -16 128 -25 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l4e1 LastExecution set from block -15 113 36 LastExecution

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 1 if entity @a[tag=_ctg_l4e1_check] if block 1024 19 1024 diamond_block run scoreboard players set Completed _ctg_scratch 1

tag @a remove _ctg_l4e1_check

execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson4/exercise1_check

execute if score Completed _ctg_scratch matches 1 run fill 1024 16 1024 1024 32 1024 air

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
