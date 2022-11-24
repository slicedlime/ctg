# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Wait, you're not a cheater, are you? Remove the 'cheater' tag from yourself.", "color":"gold", "with": [{"translate": "Remove the 'cheater' tag from yourself", "color": "green", "with": [{"text": "cheater", "color": "white", "lookup": "cheater"}]}]}]

title @a actionbar [{"translate":"Remove the 'cheater' tag from yourself","color":"green", "with": [{"text": "cheater", "color": "white", "lookup": "cheater"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 3 if entity @a[tag=!cheater] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
