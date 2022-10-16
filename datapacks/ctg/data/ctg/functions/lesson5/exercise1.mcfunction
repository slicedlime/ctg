# Player state
function ctg:gamemode/adventure
clear @a
tag @a remove _ctg_l4e8_check

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson5/exercise1_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson5/exercise1_l2
function ctg:text/lesson5/exercise1_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 1 if block 47 138 74 air positioned 47 138 74 if entity @e[type=item,distance=..2,nbt={Item:{id:"minecraft:netherite_block",Count:1b}}] run scoreboard players set Completed _ctg_scratch 1

# Set blocks
execute unless score Completed _ctg_scratch matches 1 run setblock 47 138 74 minecraft:netherite_block
execute positioned 47 138 74 unless score Completed _ctg_scratch matches 1 run kill @e[type=item,distance=..5]

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
