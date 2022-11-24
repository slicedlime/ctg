# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"That cow isn't much fun, is it? Let's get a better friend. Summon a rabbit with both the 'cute' and the 'jumpy' tags.", "color":"gold", "with": [{"translate": "Summon a rabbit with both the 'cute' and the 'jumpy' tags", "color": "green", "with": [{"text": "cute", "color":"white", "lookup": "cute"}, {"text": "jumpy", "color":"white", "lookup": "jumpy"}]}]}]

title @a actionbar [{"translate":"Summon a rabbit with the 'cute' and 'jumpy' tags","color":"green", "with": [{"text": "cute", "color":"white", "lookup": "cute"}, {"text": "jumpy", "color":"white", "lookup": "jumpy"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 7 if entity @e[type=rabbit,tag=cute,tag=jumpy] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
