# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1036 30 1036 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise15_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson6/exercise15_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson6/exercise15_l3
function ctg:text/lesson6/exercise15_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0

execute if block 111 132 19 command_block run data modify block 111 132 19 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l6e15 LastExecution set from block 111 132 19 LastExecution
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 15 if entity @a[tag=_ctg_l6e15_check] if blocks 1024 10 1024 1027 13 1027 1024 21 1024 all run scoreboard players set Completed _ctg_scratch 1

place template ctg:lesson6/diamonds_test 1024 10 1024
fill 1024 10 1024 1027 13 1027 air replace glass

tag @a remove _ctg_l6e15_check
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson6/exercise15_check

execute if score Completed _ctg_scratch matches 1 run function ctg:lesson6/continue

# Set blocks

execute unless entity @a[tag=_ctg_l6e15_check] run place template ctg:lesson6/diamonds 109 131 24
execute if score Completed _ctg_scratch matches 0 run setblock 111 131 19 minecraft:emerald_block
execute if score Completed _ctg_scratch matches 1 run setblock 111 131 19 netherrack
