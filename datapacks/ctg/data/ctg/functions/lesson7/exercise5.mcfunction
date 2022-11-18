# Player state
function ctg:gamemode/adventure
clear @a
fill 1024 10 1024 1034 40 1034 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson7/exercise5_l1
function ctg:text/lesson7/exercise5_objective

# Win condition
execute if score Tick _ctg_main matches 1 run summon enderman 1024 10 1024 {NoAI:1,PersistenceRequired:1b}

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 5 if entity @e[type=marker,tag=_ctg_l7e5_check] unless entity @e[type=enderman] run scoreboard players set Completed _ctg_scratch 1
execute unless entity @e[type=marker,tag=_ctg_l7e5_check] run summon marker 1024 10 1024 {Tags:["_ctg_l7e5_check"]}

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if score Completed _ctg_scratch matches 1 run kill @e[type=marker,tag=_ctg_l7e5_check]

execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e5_enderman1] run summon minecraft:enderman 88.56 115.00 -61.66 {NoAI:1,Rotation:[-45f,5f],Tags:["_ctg_l7e5_enderman1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e5_enderman2] run summon minecraft:enderman 93.03 115.00 -50.53 {NoAI:1,Rotation:[-90f,5f],Tags:["_ctg_l7e5_enderman2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[tag=_ctg_l7e5_enderman3] run summon minecraft:enderman 106.17 115.00 -60.91 {NoAI:1,Rotation:[45f,5f],Tags:["_ctg_l7e5_enderman3"],PersistenceRequired:1b}
