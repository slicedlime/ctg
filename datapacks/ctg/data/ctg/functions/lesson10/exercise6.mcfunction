# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"You can even see some of the internal secrets of the training grounds now!", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Find out how many scoreboards there are, then set your 'fun' score to that number.", "color":"gold", "with": [{"translate": "set your 'fun' score to that number", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]}]

title @a actionbar [{"translate":"Set your 'fun' score to the number of scoreboards", "color":"green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store result score Count _ctg_scratch run scoreboard objectives list

execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 6 if score @p fun = Count _ctg_scratch run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
