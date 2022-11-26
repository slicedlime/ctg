# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run tp @e[type=skeleton] ~ -300 ~
execute if score Tick _ctg_main matches 1 run kill @e[type=skeleton]

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"It's a bit boring. Let's play a game of tags! Summon a skeleton without AI and with the 'archer' tag.", "color":"gold", "with": [{"translate": "Summon a skeleton without AI and with the 'archer' tag", "color": "green", "with": [{"text": "archer", "color": "white", "lookup": "archer"}]}]}]

title @a actionbar [{"translate":"Summon a skeleton without AI and with the 'archer' tag","color":"green", "with": [{"text": "archer", "color": "white", "lookup": "archer"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 5 if entity @e[type=skeleton,nbt={NoAI:1b},tag=archer] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

tag @e[type=skeleton] add _ctg_ai
tag @e[type=skeleton,nbt={NoAI:1b}] remove _ctg_ai

execute if entity @e[type=skeleton,tag=_ctg_ai] run tellraw @a [{"translate":"Oh - watch out, better disable the AI so it doesn't shoot you!", "color": "red"}]
kill @e[type=skeleton,tag=_ctg_ai]
