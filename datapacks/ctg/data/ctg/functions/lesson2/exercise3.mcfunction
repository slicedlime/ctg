# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson2/exercise3_l1
function ctg:text/lesson2/exercise3_objective

# Win condition
execute unless block 42 124 -27 gold_block run scoreboard players reset GoldBlock _ctg_main
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 3 if block 42 124 -27 gold_block run scoreboard players add GoldBlock _ctg_main 1
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 3 if score GoldBlock _ctg_main matches 4 run function ctg:completed
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 3 if score GoldBlock _ctg_main matches 4 run scoreboard players set Lesson _ctg_scratch 2
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 3 if score GoldBlock _ctg_main matches 4 run scoreboard players set Exercise _ctg_scratch 4
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 3 if score GoldBlock _ctg_main matches 4 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 3 if score GoldBlock _ctg_main matches 4 run function ctg:store

setblock 42 124 -27 emerald_block

execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 if score GoldBlock _ctg_main matches 4 run scoreboard players reset GoldBlock _ctg_main
