# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run scoreboard players set Completed _ctg_scratch 0
execute if score Tick _ctg_main matches 1 run function ctg:lesson10/mitesandmen

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Where did all of these endermen come from? And they got scores, too!", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Reset the 'fun' scores of all entities with 'fun' scores larger than 5.", "color":"gold", "with": [{"translate": "Reset the 'fun' scores of all entities with 'fun' scores larger than 5", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}, {"text": "fun", "color": "white", "lookup": "fun"}]}]}]

title @a actionbar [{"translate": "Reset the 'fun' scores of all entities with 'fun' scores larger than 5", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}, {"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store success score E2HasScore _ctg_scratch run scoreboard players get @e[type=enderman,tag=_ctg_l10_e2,limit=1] fun
execute store success score E3HasScore _ctg_scratch run scoreboard players get @e[type=endermite,tag=_ctg_l10_e3,limit=1] fun

execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 10 if score E2HasScore _ctg_scratch matches 0 if score E3HasScore _ctg_scratch matches 0 if score @e[type=enderman,tag=_ctg_l10_e1,limit=1] fun matches 5 if score @p fun matches 1 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

function ctg:lesson10/mitesandmen
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=enderman,tag=_ctg_l10_e1] fun 5
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=enderman,tag=_ctg_l10_e2] fun 12
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e3] fun 9
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @a fun 1
