# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run scoreboard objectives remove fun
execute if score Tick _ctg_main matches 1 run setblock -82 100 -14 emerald_block

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Your first task in this section is to place a command block on the emerald block.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Make the command block summon a frog above itself if it is placed on top of a deepslate block. When you are done, activate the command block.", "color":"gold", "with": [{"translate": "summon a frog above itself if it is placed on top of a deepslate block", "color": "green"}]}]

title @a actionbar [{"translate":"Make a command block that summons a frog if it is on deepslate","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 1 if entity @a[tag=_ctg_l11e1_check] positioned 1024 11 1024 if entity @e[type=frog,distance=..1] positioned 1024 31 1024 unless entity @e[type=frog,distance=..1] positioned 1024 51 1024 if entity @e[type=frog,distance=..1] run scoreboard players set Completed _ctg_scratch 1
tag @a[tag=_ctg_l11e1_check] remove _ctg_l11e1_check
kill @e[type=frog]

execute if block -82 101 -14 command_block run data modify block -82 101 -14 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l11e1 LastExecution set from block -82 101 -14 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson11/exercise1_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
