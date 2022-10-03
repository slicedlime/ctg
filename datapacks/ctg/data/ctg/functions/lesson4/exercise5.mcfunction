# Player state
execute if score Tick _ctg_main matches 1 run clear @a
setblock -28 112 42 waxed_copper_block
setblock -28 112 41 waxed_oxidized_copper

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson4/exercise5_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson4/exercise5_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson4/exercise5_l3
function ctg:text/lesson4/exercise5_objective

# Win condition
execute if block -28 113 42 command_block run data modify block -28 113 42 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l4e5 LastExecution set from block -28 113 42 LastExecution

execute if entity @a[tag=_ctg_l4e5_check] store result score ShovelCount _ctg_scratch run clear @a diamond_shovel

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 5 if entity @a[tag=_ctg_l4e5_check] if block 1024 15 1025 mud if score ShovelCount _ctg_scratch matches 1 run scoreboard players set Completed _ctg_scratch 1

tag @a remove _ctg_l4e5_check

execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson4/exercise5_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
