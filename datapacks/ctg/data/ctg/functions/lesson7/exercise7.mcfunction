# Player state
execute if score Tick _ctg_main matches 1 run function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run fill 1024 10 1024 1036 30 1036 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson7/exercise7_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson7/whendone
function ctg:text/lesson7/exercise7_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0

execute if block 97 115 -46 command_block run data modify block 97 115 -46 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l7e7 LastExecution set from block 97 115 -46 LastExecution
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 7 if entity @a[tag=_ctg_l7e7_check] unless entity @e[type=spider,tag=_ctg_l7e7_spider_target] if entity @e[type=spider,tag=_ctg_l7e7_spider_miss_1] if entity @e[type=spider,tag=_ctg_l7e7_spider_miss_2] if entity @e[type=spider,tag=_ctg_l7e7_spider_miss_3] run scoreboard players set Completed _ctg_scratch 1

execute if entity @a[tag=_ctg_l7e7_check] positioned 1024 10 1024 run kill @e[type=item,distance=..100]
execute if entity @a[tag=_ctg_l7e7_check] positioned 1024 10 1024 run tp @e[type=spider,distance=..100] ~ -100 ~
execute if entity @a[tag=_ctg_l7e7_check] positioned 1024 -100 1024 run kill @e[type=spider,distance=..100]

tag @a remove _ctg_l7e7_check
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson7/exercise7_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

# Set blocks

execute if score Completed _ctg_scratch matches 1 run setblock 97 114 -46 green_wool
execute if score Completed _ctg_scratch matches 0 run setblock 97 114 -46 emerald_block

execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e7_spider1] run summon minecraft:spider 90.52 115.00 -47.74 {NoAI:1,Rotation:[-110f,5f],Tags:["_ctg_l7e7_spider1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e7_spider2] run summon minecraft:spider 91.58 115.00 -36.03 {NoAI:1,Rotation:[-144f,5f],Tags:["_ctg_l7e7_spider2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e7_spider3] run summon minecraft:spider 100.57 115.00 -41.72 {NoAI:1,Rotation:[152f,5f],Tags:["_ctg_l7e7_spider3"],PersistenceRequired:1b}

execute if score Completed _ctg_scratch matches 1 run tp @e[type=spider] ~ -200 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=spider]
