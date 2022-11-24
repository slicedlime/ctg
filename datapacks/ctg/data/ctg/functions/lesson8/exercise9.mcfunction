# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"That rabbit isn't the only cute little thing! Add the 'cute' tag to all cats!", "color":"gold", "with": [{"translate": "Add the 'cute' tag to all cats", "color": "green", "with": [{"text": "cute", "color":"white", "lookup": "cute"}]}]}]

title @a actionbar [{"translate":"Add the 'cute' tag to all cats","color":"green", "with": [{"text": "cute", "color":"white", "lookup": "cute"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 9 if entity @e[type=cat] unless entity @e[type=cat,tag=!cute] unless entity @e[type=wolf,tag=cute] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if entity @e[type=wolf,tag=cute] run tellraw @a [{"translate": "That was too many things you just called cute! Try again.", "color": "red"}]
execute unless entity @e[type=wolf,tag=cute] if entity @a[tag=cute] run tellraw @a [{"translate": "Well yes, you are also cute... but that wasn't the exercise!", "color": "red"}]
tag @e[tag=cute,type=!rabbit] remove cute

execute if score Completed _ctg_scratch matches 0 unless entity @e[type=cat,tag=_ctg_l8_e9_cat1] run summon cat 39.14 92.00 -100.40 {Tags:["_ctg_l8_e9_cat1"]}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=cat,tag=_ctg_l8_e9_cat2] run summon cat 39.00 92.00 -108.54 {Tags:["_ctg_l8_e9_cat2"]}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=cat,tag=_ctg_l8_e9_cat3] run summon cat 44.99 91.00 -110.03 {Tags:["_ctg_l8_e9_cat3"]}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=cat,tag=_ctg_l8_e9_cat4] run summon cat 1024 10 1024 {Tags:["_ctg_l8_e9_cat4"], NoAI:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=wolf,tag=_ctg_l8_e9_dog] run summon wolf 1024 10 1024 {Tags:["_ctg_l8_e9_dog"], NoAI:1b}
execute if score Completed _ctg_scratch matches 1 run kill @e[tag=_ctg_l8_e9_cat4]
execute if score Completed _ctg_scratch matches 1 run kill @e[tag=_ctg_l8_e9_dog]
