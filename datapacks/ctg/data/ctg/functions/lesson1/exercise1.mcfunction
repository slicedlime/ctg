# Player state
function ctg:gamemode/adventure
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson1/exercise1_l1
function ctg:text/lesson1/exercise1_objective

# Win condition
execute store result score Stone _ctg_scratch run clear @a minecraft:stone

execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 1 if score Stone _ctg_scratch matches 1.. run function ctg:completed
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 1 if score Stone _ctg_scratch matches 1.. run scoreboard players set Lesson _ctg_scratch 1
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 1 if score Stone _ctg_scratch matches 1.. run scoreboard players set Exercise _ctg_scratch 2
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 1 if score Stone _ctg_scratch matches 1.. run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 1 if score Stone _ctg_scratch matches 1.. run function ctg:store
