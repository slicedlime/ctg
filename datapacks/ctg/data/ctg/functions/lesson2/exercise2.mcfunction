# Player state
function ctg:gamemode/adventure
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson2/exercise2_l1
function ctg:text/lesson2/exercise2_objective

# Win condition
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 2 if block 40 118 -28 diamond_block run function ctg:completed
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 2 if block 40 118 -28 diamond_block run scoreboard players set Lesson _ctg_scratch 2
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 2 if block 40 118 -28 diamond_block run scoreboard players set Exercise _ctg_scratch 3
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 2 if block 40 118 -28 diamond_block run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 2 if block 40 118 -28 diamond_block run function ctg:store

execute unless block 40 118 -28 diamond_block run setblock 40 118 -28 emerald_block
