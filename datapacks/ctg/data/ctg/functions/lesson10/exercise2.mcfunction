# Player state
function ctg:gamemode/adventure
clear @a
scoreboard players set AHiddenValue fun 4711

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"I've set a value to a name in that new 'fun' scoreboard of yours. Set your own score to the same value.", "color":"gold", "with": [{"text": "fun", "color": "white", "lookup": "fun"}, {"translate": "Set your own score to the same value", "color": "green"}]}]

title @a actionbar [{"translate":"Set your 'fun' score to the same as the hidden score","color":"green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 2 if score AHiddenValue fun matches 4711 if score @p fun matches 4711 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
