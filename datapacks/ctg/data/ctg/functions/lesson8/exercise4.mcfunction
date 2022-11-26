# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run tp @e[type=cow] ~ -300 ~
execute if score Tick _ctg_main matches 1 run kill @e[type=cow]

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"It's very empty here in this weird box. Let's make a friend - summon a cow without AI.", "color":"gold", "with": [{"translate": "summon a cow without AI", "color": "green"}]}]

title @a actionbar [{"translate":"Summon a cow without AI","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 4 if entity @e[type=cow,nbt={NoAI:1b}] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
