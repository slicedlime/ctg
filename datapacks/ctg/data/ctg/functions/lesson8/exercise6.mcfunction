# Player state
function ctg:gamemode/adventure
clear @a

execute if score Tick _ctg_main matches 1 run function ctg:lesson8/exercise6_spawn

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"I feel like we're being watched! Kill all entities with the 'spy' tag.", "color":"gold", "with": [{"translate": "Kill all entities with the 'spy' tag", "color": "green", "with": [{"text": "spy", "color": "white", "lookup": "spy"}]}]}]

title @a actionbar [{"translate":"Kill all entities with the 'spy' tag","color":"green", "with": [{"text": "spy", "color": "white", "lookup": "spy"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 6 if entity @e[type=creeper,tag=_ctg_l8_e6] unless entity @e[type=bat,tag=_ctg_l8_e6] unless entity @e[type=spider,tag=_ctg_l8_e6] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if score Completed _ctg_scratch matches 0 unless entity @e[type=creeper,tag=_ctg_l8_e6] run tellraw @a [{"translate": "Oh, you seem to have killed more than just the spies! Try again!", "color": "red"}]
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=creeper,tag=_ctg_l8_e6] run function ctg:lesson8/exercise6_spawn
execute if score Completed _ctg_scratch matches 1 run kill @e[type=creeper,tag=_ctg_l8_e6]
