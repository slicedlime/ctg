# Player state
function ctg:gamemode/adventure
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 40 run function ctg:text/lesson1/exercise2_l1
execute if score Tick _ctg_main matches 40.. run function ctg:text/lesson1/exercise2_objective

# Win condition
execute store result score Blocks _ctg_scratch run clear @a minecraft:red_wool

execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 2 if score Blocks _ctg_scratch matches 64 run function ctg:completed
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 2 if score Blocks _ctg_scratch matches 64 run scoreboard players set Lesson _ctg_scratch 1
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 2 if score Blocks _ctg_scratch matches 64 run scoreboard players set Exercise _ctg_scratch 3
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 2 if score Blocks _ctg_scratch matches 64 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 2 if score Blocks _ctg_scratch matches 64 run function ctg:store
