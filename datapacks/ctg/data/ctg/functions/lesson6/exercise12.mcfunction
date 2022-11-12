# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1036 30 1036 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson6/exercise12_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson6/exercise12_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson6/exercise12_l3
function ctg:text/lesson6/exercise12_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0

setblock 1024 21 1024 chiseled_quartz_block
fill 1024 22 1024 1024 25 1024 quartz_pillar[axis=y]
setblock 1024 26 1024 chiseled_quartz_block

execute if block 98 130 29 command_block run data modify block 98 130 29 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l6e12 LastExecution set from block 98 130 29 LastExecution
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 12 if entity @a[tag=_ctg_l6e12_check] if blocks 1024 11 1024 1024 16 1024 1024 21 1024 all run scoreboard players set Completed _ctg_scratch 1

tag @a remove _ctg_l6e12_check
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson6/exercise12_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 13
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 0 run setblock 98 129 29 emerald_block
execute if score Completed _ctg_scratch matches 1 run setblock 98 129 29 netherrack
execute if score Completed _ctg_scratch matches 0 run setblock 94 131 31 chiseled_quartz_block
execute if score Completed _ctg_scratch matches 0 run fill 94 132 31 94 135 31 quartz_pillar[axis=y]
execute if score Completed _ctg_scratch matches 0 run setblock 94 136 31 chiseled_quartz_block
