# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"The endermites are invading your scoreboard! They're not as fun as they claim to be.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Remove 1 from the 'fun' score of all endermites.", "color":"gold", "with": [{"translate": "Remove 1 from the 'fun' score of all endermites", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]}]

title @a actionbar [{"translate": "Remove 1 from the 'fun' score of all endermites", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 8 if score @e[type=endermite,tag=_ctg_l10_e1,limit=1] fun matches 122 if score @e[type=endermite,tag=_ctg_l10_e2,limit=1] fun matches 455 if score @e[type=endermite,tag=_ctg_l10_e3,limit=1] fun matches 788 if score @p fun matches 1000 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

function ctg:lesson10/endermites
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e1] fun 123
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e2] fun 456
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e3] fun 789
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @a fun 1000
