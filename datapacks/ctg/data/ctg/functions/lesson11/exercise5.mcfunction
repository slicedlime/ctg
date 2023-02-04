# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
place template ctg:lesson6/plushie_void -75 102 -14
execute unless block -75 101 -14 command_block run setblock -75 101 -14 command_block

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"There's that plushie again! Fill in a command in the command block that replaces the blue eyes with lapis blocks if the command block is under such a plushie!", "color":"gold", "with": [{"translate": "replaces the blue eyes with lapis blocks if the command block is under such a plushie", "color": "green"}]}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"When you are done, activate the command block."}]

title @a actionbar [{"translate":"If the plushie matches, replace the eyes with lapis blocks","color":"green"}]

# Win condition
execute if entity @e[tag=_ctg_l11e5_check] run place template ctg:lesson11/plushie_lapis 1024 20 1024
execute if entity @e[tag=_ctg_l11e5_check] run place template ctg:lesson11/plushie_wrong 1024 40 1024
execute if entity @e[tag=_ctg_l11e5_check] run place template ctg:lesson11/plushie_wrong2 1024 60 1024
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 5 if entity @p[tag=_ctg_l11e5_check] if blocks 1024 11 1024 1026 14 1025 1024 20 1024 all if blocks 1024 31 1024 1026 34 1025 1024 40 1024 all if blocks 1024 51 1024 1026 54 1025 1024 60 1024 all run scoreboard players set Completed _ctg_scratch 1
tag @a[tag=_ctg_l11e5_check] remove _ctg_l11e5_check

execute if block -75 101 -14 command_block run data modify block -75 101 -14 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l11e5 LastExecution set from block -75 101 -14 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson11/exercise5_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 0 run place template ctg:lesson6/plushie_void -75 102 -14
