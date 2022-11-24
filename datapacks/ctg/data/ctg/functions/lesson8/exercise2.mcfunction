# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Hey there's a quick way to pass this exercise. Add the tag 'cheater' to yourself.", "color":"gold", "with": [{"translate": "Add the tag 'cheater' to yourself", "color": "green", "with": [{"text": "cheater", "color": "white", "lookup": "cheater"}]}]}]

title @a actionbar [{"translate":"Add the 'cheater' tag to yourself","color":"green", "with": [{"text": "cheater", "color": "white", "lookup": "cheater"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 2 if entity @a[tag=cheater] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
