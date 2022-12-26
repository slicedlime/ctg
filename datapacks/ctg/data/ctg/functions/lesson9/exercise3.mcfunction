# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run setblock -5 98 -110 air
execute if score Tick _ctg_main matches 1 run data remove storage ctg:l9e3 Command

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"There's an lapis block and a copper block now. For this next task, place a repeating command block on the lapis block.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Have the command block leave a trail of gold blocks under your feet as you move around. When you are done, walk over to the copper block.", "color":"gold", "with": [{"translate": "leave a trail of gold blocks under your feet", "color": "green"}]}]

title @a actionbar [{"translate":"Leave a trail of gold blocks under your feet as you move","color":"green"}]

# Win condition
execute if block -5 98 -110 repeating_command_block run data modify block -5 98 -110 UpdateLastExecution set value 1
execute if block -5 98 -110 repeating_command_block{auto:1b} store success score CommandChanged _ctg_scratch run data modify storage ctg:l9e3 Command set from block -5 98 -110 Command
execute if score CommandChanged _ctg_scratch matches 1 run place template ctg:turtle_voids -21 87 -123

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 3 if block -4 97 -115 gold_block positioned -3.5 98.0 -114.5 if entity @a[tag=_ctg_l9e3_gold,distance=..1] run scoreboard players set Completed _ctg_scratch 1
execute positioned -21 188 -123 as @a[distance=..1,tag=!_ctg_l9e3_gold] run function ctg:lesson9/exercise3_check
execute if block -4 97 -115 gold_block positioned -3.5 98.0 -114.5 as @a[tag=!_ctg_l9e3,tag=!_ctg_l9e3_gold,distance=..1] run function ctg:lesson9/exercise3_test

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Some failsafe stuff if player sets a bad command or jumps with the trail machine on
execute unless entity @a[tag=_ctg_l9e3] as @a store result score @s _ctg_scratch run data get entity @s Pos[1]
execute unless entity @a[tag=_ctg_l9e3] as @a at @s if block ~ ~-1 ~ gold_block if score @s _ctg_scratch matches 99..101 run function ctg:lesson9/exercise3_jumped
execute unless entity @a[tag=_ctg_l9e3] if block -5 98 -110 repeating_command_block{auto:1b} as @a at @s if block ~ ~ ~ gold_block if score @s _ctg_scratch matches 98 run function ctg:lesson9/exercise3_inside_block
execute if block -5 98 -110 repeating_command_block{auto:1b} as @e[type=area_effect_cloud,tag=_ctg_backup] at @s if block ~ ~-1 ~ gold_block run function ctg:lesson9/exercise3_at_e

execute if score Completed _ctg_scratch matches 0 run setblock -5 97 -110 minecraft:lapis_block
execute if score Completed _ctg_scratch matches 0 run setblock -4 97 -115 minecraft:waxed_copper_block
execute if score Completed _ctg_scratch matches 1 run setblock -5 97 -110 minecraft:grass_block
execute if score Completed _ctg_scratch matches 1 run data modify block -5 98 -110 auto set value 0
execute if score Completed _ctg_scratch matches 1 run tag @a remove _ctg_l9e3
