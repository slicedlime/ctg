# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Set blocks
setblock 49 134 76 emerald_block
setblock 48 137 76 lime_stained_glass

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson5/exercise2_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson5/exercise2_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson5/exercise2_l3
function ctg:text/lesson5/exercise2_objective

# Win condition
execute if block 49 135 76 command_block run data modify block 49 135 76 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l5e2 LastExecution set from block 49 135 76 LastExecution

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 2 if entity @a[tag=_ctg_l5e2_check] if block 1024 12 1024 stone if block 1025 12 1024 crafting_table run scoreboard players set Completed _ctg_scratch 1

tag @a remove _ctg_l5e2_check

execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson5/exercise2_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
