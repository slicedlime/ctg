# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1036 30 1036 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson7/exercise6_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson7/whendone
function ctg:text/lesson7/exercise6_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0

execute if block 101 115 -50 command_block run data modify block 101 115 -50 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l7e6 LastExecution set from block 101 115 -50 LastExecution
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 6 if entity @a[tag=_ctg_l7e6_check] unless entity @e[type=creeper,tag=_ctg_l7e6_creeper_target] if entity @e[type=creeper,tag=_ctg_l7e6_creeper_miss_1] if entity @e[type=creeper,tag=_ctg_l7e6_creeper_miss_2] run scoreboard players set Completed _ctg_scratch 1

execute if entity @a[tag=_ctg_l7e6_check] positioned 1024 10 1024 run tp @e[type=creeper,distance=..100] ~ -100 ~
execute if entity @a[tag=_ctg_l7e6_check] positioned 1024 -100 1024 run kill @e[type=creeper,distance=..100]

tag @a remove _ctg_l7e6_check
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson7/exercise6_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 1 run setblock 101 114 -50 green_wool
execute if score Completed _ctg_scratch matches 0 run setblock 101 114 -50 emerald_block

execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e6_creeper1] run summon minecraft:creeper 97.06 115.00 -43.99 {NoAI:1,Rotation:[-142f,5f],Tags:["_ctg_l7e6_creeper1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e6_creeper2] run summon minecraft:creeper 109.01 115.06 -37.90 {NoAI:1,Rotation:[143f,5f],Tags:["_ctg_l7e6_creeper2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e6_creeper3] run summon minecraft:creeper 118.61 115.06 -38.29 {NoAI:1,Rotation:[124f,5f],Tags:["_ctg_l7e6_creeper3"],PersistenceRequired:1b}

execute if score Completed _ctg_scratch matches 1 run tp @e[type=creeper] ~ -200 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=creeper]
