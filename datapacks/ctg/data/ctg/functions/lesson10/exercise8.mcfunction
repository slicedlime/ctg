# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"The endermites are invading your scoreboard! They're not as fun as they claim to be.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Remove 1 from the 'fun' score of all endermites.", "color":"gold", "with": [{"translate": "Remove 1 from the 'fun' score of all endermites", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]}]

title @a actionbar [{"translate": "Remove 1 from the 'fun' score of all endermites", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e8e1] _ctg_scratch 123
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e8e2] _ctg_scratch 456
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e8e3] _ctg_scratch 789

execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 8 if score @e[type=endermite,tag=_ctg_l10_e8e1,limit=1] fun matches 122 if score @e[type=endermite,tag=_ctg_l10_e8e2,limit=1] fun matches 455 if score @e[type=endermite,tag=_ctg_l10_e8e3,limit=1] fun matches 788 if score @p fun matches 1000 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if score Completed _ctg_scratch matches 0 unless entity @e[type=endermite,tag=_ctg_l10_e8e1] run summon endermite -58.86 119.00 -73.34 {NoAI:1, Rotation:[-221f,15.4f], Tags:["_ctg_l10_e8e1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=endermite,tag=_ctg_l10_e8e2] run summon endermite -65.62 120.00 -70.74 {NoAI:1, Rotation:[-163f,10.4f], Tags:["_ctg_l10_e8e2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=endermite,tag=_ctg_l10_e8e3] run summon endermite -73.83 119.00 -70.10 {NoAI:1, Rotation:[-112f,7.3f], Tags:["_ctg_l10_e8e3"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e8e1] fun 123
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e8e2] fun 456
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e8e3] fun 789
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @a fun 1000

execute if score Completed _ctg_scratch matches 1 run tp @e[type=endermite] ~ -1000 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=endermite]
