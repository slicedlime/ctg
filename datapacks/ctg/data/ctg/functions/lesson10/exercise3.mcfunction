# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run scoreboard players reset AHiddenValue fun

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"I want a fun score too! Set the score for 'slicedlime' to 1337!", "color":"gold", "with": [{"translate": "Set the score for 'slicedlime' to 1337", "color": "green"}]}]

title @a actionbar [{"translate":"Set the 'fun' score for 'slicedlime' to 1337","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 3 if score slicedlime fun matches 1337 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
