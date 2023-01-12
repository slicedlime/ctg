scoreboard players operation Random _ctg_scratch *= 2 _ctg_scratch
execute if predicate ctg:random_chance run scoreboard players add Random _ctg_scratch 1
scoreboard players remove RandomBits _ctg_scratch 1
execute if score RandomBits _ctg_scratch matches 1.. run function ctg:util/random_r
