# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1036 30 1036 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson7/exercise8_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson7/whendone
function ctg:text/lesson7/exercise8_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0

execute if block 98 115 -42 command_block run data modify block 98 115 -42 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l7e8 LastExecution set from block 98 115 -42 LastExecution
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 8 if entity @a[tag=_ctg_l7e8_check] unless entity @e[type=witch,tag=_ctg_l7e8_witch_target] if entity @e[type=witch,tag=_ctg_l7e8_witch_miss_1] if entity @e[type=witch,tag=_ctg_l7e8_witch_miss_2] if entity @e[type=witch,tag=_ctg_l7e8_witch_miss_3] run scoreboard players set Completed _ctg_scratch 1

execute if entity @a[tag=_ctg_l7e8_check] positioned 1024 10 1024 run kill @e[type=item,distance=..100]
execute if entity @a[tag=_ctg_l7e8_check] positioned 1024 10 1024 run tp @e[type=witch,distance=..100] ~ -100 ~
execute if entity @a[tag=_ctg_l7e8_check] positioned 1024 -100 1024 run kill @e[type=witch,distance=..100]
execute if entity @a[tag=_ctg_l7e8_check] run setblock 1024 300 1024 air

tag @a remove _ctg_l7e8_check
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson7/exercise8_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 1 run setblock 98 114 -42 green_wool
execute if score Completed _ctg_scratch matches 0 run setblock 98 114 -42 emerald_block

execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e8_witch1] run summon minecraft:witch 92.30 114.06 -34.37 {NoAI:1,Rotation:[-150f,5f],Tags:["_ctg_l7e8_witch1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e8_witch2] run summon minecraft:witch 111.82 115.06 -39.12 {NoAI:1,Rotation:[118f,5f],Tags:["_ctg_l7e8_witch2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e8_witch3] run summon minecraft:witch 103.25 115.00 -54.90 {NoAI:1,Rotation:[30f,5f],Tags:["_ctg_l7e8_witch3"],PersistenceRequired:1b}

execute if score Completed _ctg_scratch matches 1 run tp @e[type=witch] ~ -200 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=witch]
