# Player state
function ctg:gamemode/adventure
clear @a

execute if score Tick _ctg_main matches 1 run scoreboard objectives add poopy dummy

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Help! I tried to add a scoreboard about nice red flowers, but I made a typo.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Please find and remove the misspelled scoreboard.", "color":"gold", "with": [{"translate": "find and remove the misspelled scoreboard", "color": "green"}]}]

title @a actionbar [{"translate":"Find and remove the misspelled scoreboard", "color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store success score Exists _ctg_scratch run scoreboard players reset test poopy

execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 7 if score Exists _ctg_scratch matches 0 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
