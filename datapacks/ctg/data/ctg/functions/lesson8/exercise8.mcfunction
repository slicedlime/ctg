# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run function ctg:lesson8/exercise8_spawn

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"You know what I hate? Spiders. Jumpy spiders. Kill all spiders with the 'jumpy' tag.", "color":"gold", "with": [{"translate": "Kill all spiders with the 'jumpy' tag", "color": "green", "with": [{"text": "jumpy", "color":"white", "lookup": "jumpy"}]}]}]

title @a actionbar [{"translate":"Kill all spiders with the 'jumpy' tag","color":"green", "with": [{"text": "jumpy", "color":"white", "lookup": "jumpy"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 8 if entity @e[type=spider,tag=_ctg_l8_e8_missed] unless entity @e[type=spider,tag=_ctg_l8_e8_target] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run kill @e[type=spider,tag=_ctg_l8_e8_missed]
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=spider,tag=_ctg_l8_e8_missed] run tellraw @a [{"translate": "You seem to have killed more spiders than you should have. Try again!", "color": "red"}]
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=spider,tag=_ctg_l8_e8_missed] run function ctg:lesson8/exercise8_spawn
