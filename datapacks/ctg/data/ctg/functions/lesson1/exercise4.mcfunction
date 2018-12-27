# Player state
function ctg:creative_mode
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run give @a minecraft:command_block

# World setup
setblock 0 0 0 minecraft:emerald_block

# Description
execute if score Tick _ctg_main matches 40 run function ctg:text/lesson1/exercise4_l1
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson1/exercise4_l2
execute if score Tick _ctg_main matches 160.. run function ctg:text/lesson1/exercise4_objective

# Win condition
execute store result score Swords _ctg_scratch run clear @a minecraft:diamond_sword
execute store result score Activated _ctg_scratch run data get block 0 1 0 SuccessCount
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 4 if score Swords _ctg_scratch matches 1 if score Activated _ctg_scratch matches 1 run function ctg:completed
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 4 if score Swords _ctg_scratch matches 1 if score Activated _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 1
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 4 if score Swords _ctg_scratch matches 1 if score Activated _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 5
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 4 if score Swords _ctg_scratch matches 1 if score Activated _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 4 if score Swords _ctg_scratch matches 1 if score Activated _ctg_scratch matches 1 run function ctg:store

# Reset for next tick
data merge block 0 1 0 {"SuccessCount":0}
