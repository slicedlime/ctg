# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run scoreboard players set boop fun 1234

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Who put 'boop' on that scoreboard? Please remove their score entirely!", "color":"gold", "with": [{"text": "boop", "color": "white", "lookup": "boop"}, {"translate": "remove their score entirely", "color": "green"}]}]

title @a actionbar [{"translate":"Remove the 'fun' score of 'boop' entirely", "color":"green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}, {"text": "boop", "color": "white", "lookup": "boop"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store success score Exists _ctg_scratch run scoreboard players get boop fun

execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 5 if score Exists _ctg_scratch matches 0 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
