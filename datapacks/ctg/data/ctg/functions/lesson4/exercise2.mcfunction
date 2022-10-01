# Player state
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run setblock -15 112 36 ice

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson4/exercise2_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson4/exercise2_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson4/exercise2_l3
function ctg:text/lesson4/exercise2_objective

# Set blocks
setblock -19 112 35 minecraft:emerald_block
setblock -18 114 33 minecraft:gold_block

# Win condition
execute if block -19 113 35 command_block run data modify block -19 113 35 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l4e2 LastExecution set from block -19 113 35 LastExecution

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 2 if entity @a[tag=_ctg_l4e2_check] if block 1025 17 1024 diamond_block run scoreboard players set Completed _ctg_scratch 1

tag @a remove _ctg_l4e1_check
tag @a remove _ctg_l4e2_check

execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson4/exercise2_check

execute if score Completed _ctg_scratch matches 1 run fill 1024 16 1024 1026 32 1026 air

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
