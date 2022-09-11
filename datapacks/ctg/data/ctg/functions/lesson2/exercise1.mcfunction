# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson2/exercise1_l1
function ctg:text/lesson2/exercise1_objective

# Win condition
execute store result score GameRule _ctg_scratch run gamerule commandBlockOutput

execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 1 if score GameRule _ctg_scratch matches 1 run function ctg:completed
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 1 if score GameRule _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 2
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 1 if score GameRule _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 1 if score GameRule _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 1 if score GameRule _ctg_scratch matches 1 run function ctg:store
gamerule commandBlockOutput false
