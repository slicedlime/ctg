# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
tag @a remove _ctg_l4e6_check

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson4/exercise7_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson4/exercise7_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson4/exercise7_l3
function ctg:text/lesson4/exercise7_objective

# Set blocks
setblock -22 112 46 waxed_copper_block
fill -22 112 47 -22 112 48 waxed_oxidized_copper
execute if score Tick _ctg_main matches 1 run fill -22 113 46 -22 113 48 air replace snow
execute if score Tick _ctg_main matches 1 run setblock -27 112 45 minecraft:snow_block

# Win condition
execute if block -22 113 46 command_block run data modify block -22 113 46 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l4e7 LastExecution set from block -22 113 46 LastExecution

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 7 if entity @a[tag=_ctg_l4e7_check] if block 1024 17 1024 iron_block if block 1024 18 1024 gold_block if block 1024 19 1024 diamond_block run scoreboard players set Completed _ctg_scratch 1

tag @a remove _ctg_l4e7_check

execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson4/exercise7_check

execute if score Completed _ctg_scratch matches 1 run fill 1024 16 1024 1024 32 1026 air

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
