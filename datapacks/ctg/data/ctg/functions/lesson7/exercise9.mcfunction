# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1036 30 1036 air
execute positioned 87 91 -63 run fill ~ ~ ~ ~31 ~31 ~31 air replace repeating_command_block

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson7/exercise9_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson7/whendone
function ctg:text/lesson7/exercise9_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0

execute if block 104 115 -44 command_block run data modify block 104 115 -44 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l7e9 LastExecution set from block 104 115 -44 LastExecution
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 9 if entity @a[tag=_ctg_l7e9_check] unless entity @e[type=guardian,tag=_ctg_l7e9_guardian_target] if entity @e[type=guardian,tag=_ctg_l7e9_guardian_miss_1] if entity @e[type=guardian,tag=_ctg_l7e9_guardian_miss_2] if entity @e[type=guardian,tag=_ctg_l7e9_guardian_miss_3] run scoreboard players set Completed _ctg_scratch 1
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 9 if entity @a[tag=_ctg_l7e9_check] positioned 1024 10 1024 run say @e[type=guardian,distance=..200]

execute if entity @a[tag=_ctg_l7e9_check] positioned 1024 10 1024 run kill @e[type=item,distance=..200]
execute if entity @a[tag=_ctg_l7e9_check] positioned 1024 10 1024 run tp @e[type=guardian,distance=..200] ~ -100 ~
execute if entity @a[tag=_ctg_l7e9_check] positioned 1024 -100 1024 run kill @e[type=guardian,distance=..200]

tag @a remove _ctg_l7e9_check
execute if block 104 115 -44 command_block if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson7/exercise9_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 1 run setblock 104 114 -44 green_wool
execute if score Completed _ctg_scratch matches 0 run setblock 104 114 -44 emerald_block

execute unless entity @a[tag=_ctg_l7e9_check] if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e9_guardian1] run summon minecraft:guardian 117.22 114.06 -45.05 {NoAI:1,Rotation:[97f,5f],Tags:["_ctg_l7e9_guardian1"],PersistenceRequired:1b}
execute unless entity @a[tag=_ctg_l7e9_check] if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e9_guardian2] run summon minecraft:guardian 107.51 113.76 -41.75 {NoAI:1,Rotation:[131f,5f],Tags:["_ctg_l7e9_guardian2"],PersistenceRequired:1b}
execute unless entity @a[tag=_ctg_l7e9_check] if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e9_guardian3] run summon minecraft:guardian 90.86 114.06 -32.28 {NoAI:1,Rotation:[-137f,5f],Tags:["_ctg_l7e9_guardian3"],PersistenceRequired:1b}

execute if score Completed _ctg_scratch matches 1 run tp @e[type=guardian] ~ -200 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=guardian]
