# Only do stuff if we´re in the right lesson
execute unless score Lesson _ctg_main matches 0 run function ctg:text/cheater

# Set up transition
execute if score Lesson _ctg_main matches 0 run summon minecraft:area_effect_cloud 1 107 1 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
execute if score Lesson _ctg_main matches 0 run scoreboard players set @e[tag=_ctg_new_target] _ctg_main 1
execute if score Lesson _ctg_main matches 0 run tag @e[tag=_ctg_new_target] remove _ctg_new_target

execute if score Lesson _ctg_main matches 0 run summon minecraft:area_effect_cloud 5 145 5 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
execute if score Lesson _ctg_main matches 0 run scoreboard players set @e[tag=_ctg_new_target] _ctg_main 2
execute if score Lesson _ctg_main matches 0 run tag @e[tag=_ctg_new_target] remove _ctg_new_target

execute if score Lesson _ctg_main matches 0 run summon minecraft:area_effect_cloud 15 135 13 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
execute if score Lesson _ctg_main matches 0 run scoreboard players set @e[tag=_ctg_new_target] _ctg_main 3
execute if score Lesson _ctg_main matches 0 run tag @e[tag=_ctg_new_target] remove _ctg_new_target

execute if score Lesson _ctg_main matches 0 run summon minecraft:area_effect_cloud 21 127 15 {Tags:["_ctg_target","_ctg_new_target","_ctg_eye_target"], Duration: 2147483647}
execute if score Lesson _ctg_main matches 0 run scoreboard players set @e[tag=_ctg_new_target] _ctg_main 4
execute if score Lesson _ctg_main matches 0 run tag @e[tag=_ctg_new_target] remove _ctg_new_target
execute if score Lesson _ctg_main matches 0 run summon minecraft:area_effect_cloud 11 106 4 {Tags:["_ctg_structure"], Duration:2147483647}
execute if score Lesson _ctg_main matches 0 run setblock 1024 16 1024 structure_block{name:"ctg:ximure_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
execute if score Lesson _ctg_main matches 0 run setblock 1024 17 1024 structure_block{name:"ctg:ximure", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

execute if score Lesson _ctg_main matches 0 run function ctg:transition_start

# Continue to lesson 1
execute if score Lesson _ctg_main matches 0 run scoreboard players set Lesson _ctg_scratch 1
execute if score Lesson _ctg_main matches 0 run scoreboard players set Exercise _ctg_scratch 0
execute if score Lesson _ctg_main matches 0 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 0 run function ctg:store

function ctg:completed
