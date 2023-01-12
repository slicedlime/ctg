# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run scoreboard players set Completed _ctg_scratch 0
execute if score Tick _ctg_main matches 1 run function ctg:lesson10/endermites

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"That didn't make them un-fun enough! I think we should just get rid of the most un-fun ones.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Kill all endermites with a 'fun' score less than 500.", "color":"gold", "with": [{"translate": "Kill all endermites with a 'fun' score less than 500", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]}]

title @a actionbar [{"translate": "Kill all endermites with a 'fun' score less than 500", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0

execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 9 if entity @e[type=endermite,tag=_ctg_l10_e3,limit=1] unless entity @e[type=endermite,tag=_ctg_l10_e2,limit=1] unless entity @e[type=endermite,tag=_ctg_l10_e1,limit=1] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

function ctg:lesson10/endermites
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e1] fun 122
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e2] fun 499
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e3] fun 500
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @a fun 1
