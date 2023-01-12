# Player state
function ctg:gamemode/adventure
clear @a
execute if score Tick _ctg_main matches 1 run scoreboard players set Completed _ctg_scratch 0
execute if score Tick _ctg_main matches 1 run function ctg:lesson10/mitesandmen

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"One last task! Set obsidian blocks beneath the feet of all entities with a 'fun' score between 1 and 5.", "color":"gold", "with": [{"translate": "Set obsidian blocks beneath the feet of all entities with a 'fun' score between 1 and 5", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]}]

title @a actionbar [{"translate": "Set obsidian under all entities with a 'fun' score between 1 and 5", "color": "green", "with": [{"text": "fun", "color": "white", "lookup": "fun"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
scoreboard players set @e[scores={fun=-2147483648..2147483647}] _ctg_scratch 0
execute as @e[scores={fun=-2147483648..2147483647}] at @s if block ~ ~-1 ~ obsidian run scoreboard players set @s _ctg_scratch 1

execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 11 at @p if block ~ ~-1 ~ obsidian unless entity @e[scores={fun=1..5,_ctg_scratch=0}] unless entity @e[scores={fun=..1,_ctg_scratch=1}] unless entity @e[scores={fun=5..,_ctg_scratch=1}] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:lesson10/continue

function ctg:lesson10/mitesandmen
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=enderman,tag=_ctg_l10_e1] fun 6
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=enderman,tag=_ctg_l10_e2] fun 0
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @e[type=endermite,tag=_ctg_l10_e3] fun 4
execute if score Completed _ctg_scratch matches 0 run scoreboard players set @a fun 2

execute if score Completed _ctg_scratch matches 0 at @e[type=enderman,tag=_ctg_l10_e1] run setblock ~ ~-1 ~ end_stone
execute if score Completed _ctg_scratch matches 0 at @e[type=enderman,tag=_ctg_l10_e2] run setblock ~ ~-1 ~ bedrock
execute if score Completed _ctg_scratch matches 0 at @e[type=endermite,tag=_ctg_l10_e3] run setblock ~ ~-1 ~ end_stone
execute if score Completed _ctg_scratch matches 0 at @p if block ~ ~-1 ~ obsidian run setblock ~ ~-1 ~ end_stone

execute if score Completed _ctg_scratch matches 1 run tp @e[tag=_ctg_l10_e1] ~ -1000 ~
execute if score Completed _ctg_scratch matches 1 run tp @e[tag=_ctg_l10_e2] ~ -1000 ~
execute if score Completed _ctg_scratch matches 1 run tp @e[tag=_ctg_l10_e3] ~ -1000 ~
