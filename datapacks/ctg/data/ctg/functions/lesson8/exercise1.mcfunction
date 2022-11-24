# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Mob spawning is turned off. Turn it back on.", "color":"gold", "with": [{"translate": "Turn it back on", "color": "green"}]}]

title @a actionbar [{"translate":"Turn mob spawning on","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 1 store result score Completed _ctg_scratch run gamerule doMobSpawning

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run gamerule doMobSpawning false
