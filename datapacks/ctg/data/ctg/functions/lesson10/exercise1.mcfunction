# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run scoreboard objectives remove fun

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Let's start making scoreboards! Create a dummy scoreboard objective named 'fun'.", "color":"gold", "with": [{"translate": "Create a dummy scoreboard objective named 'fun'", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]}]

title @a actionbar [{"translate":"Create a dummy scoreboard objective named 'fun'","color":"green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 1 store success score Completed _ctg_scratch run scoreboard players reset * fun

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
