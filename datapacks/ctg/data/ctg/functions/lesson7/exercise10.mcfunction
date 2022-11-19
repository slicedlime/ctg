# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run setblock 104 115 -50 air
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1034 40 1034 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson7/exercise10_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson7/exercise10_l2
execute unless score L7E10Check _ctg_main matches 1.. run function ctg:text/lesson7/exercise10_objective
execute if score L7E10Check _ctg_main matches 1.. run function ctg:text/lesson7/exercise10_checking

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if block 104 115 -50 command_block run data modify block 104 115 -50 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l7e10 LastExecution set from block 104 115 -50 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 unless score L7E10Check _ctg_main matches 1.. run function ctg:lesson7/exercise10_check

execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 10 if score L7E10Check _ctg_main matches 100 if score L7E10Score _ctg_main matches 5..95 run scoreboard players set Completed _ctg_scratch 1

execute if score L7E10Check _ctg_main matches 100 run function ctg:lesson7/exercise10_end_check
execute if score Completed _ctg_scratch matches 1 run function ctg:lesson7/continue

execute if score Completed _ctg_scratch matches 0 unless score L7E10Check _ctg_main matches 1.. unless entity @e[tag=_ctg_l7e10_rabbit1] run summon minecraft:rabbit 88.56 115.00 -61.66 {NoAI:1,Rotation:[-45f,5f],Tags:["_ctg_l7e10_rabbit1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless score L7E10Check _ctg_main matches 1.. unless entity @e[tag=_ctg_l7e10_rabbit2] run summon minecraft:rabbit 93.03 115.00 -50.53 {NoAI:1,Rotation:[-90f,5f],Tags:["_ctg_l7e10_rabbit2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless score L7E10Check _ctg_main matches 1.. unless entity @e[tag=_ctg_l7e10_rabbit3] run summon minecraft:rabbit 106.17 115.00 -60.91 {NoAI:1,Rotation:[45f,5f],Tags:["_ctg_l7e10_rabbit3"],PersistenceRequired:1b}

execute if score Completed _ctg_scratch matches 1 run setblock 104 114 -50 green_wool
execute if score Completed _ctg_scratch matches 0 run setblock 104 114 -50 emerald_block
