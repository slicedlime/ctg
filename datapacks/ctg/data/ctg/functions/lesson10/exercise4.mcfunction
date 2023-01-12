# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run scoreboard players reset AHiddenValue fun

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Let's practice changing scores - your score is changing all the time now. Help it out by adding 10 to your own score!", "color":"gold", "with": [{"translate": "adding 10 to your own score", "color": "green"}]}]

title @a actionbar [{"translate":"Add 10 to your 'fun' score", "color":"green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store result score Correct _ctg_scratch run data get storage ctg:l10e4 score 1
scoreboard players set 10 _ctg_scratch 10
scoreboard players operation Correct _ctg_scratch += 10 _ctg_scratch
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 4 if score @p fun = Correct _ctg_scratch run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if score Completed _ctg_scratch matches 0 run scoreboard players set RandomBits _ctg_scratch 12
execute if score Completed _ctg_scratch matches 0 run function ctg:util/random
execute if score Completed _ctg_scratch matches 0 run scoreboard players operation @a fun = Random _ctg_scratch
execute if score Completed _ctg_scratch matches 0 store result storage ctg:l10e4 score int 1 run scoreboard players get Random _ctg_scratch
