# Only do stuff if we´re in the right lesson
execute unless score Lesson _ctg_main matches 1 run function ctg:text/cheater
execute unless score Complete _ctg_scratch matches 1 run function ctg:text/cheater

# Set up transition
execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run summon minecraft:area_effect_cloud 26 136 14 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run scoreboard players set @e[tag=_ctg_new_target] _ctg_main 1
tag @e[tag=_ctg_new_target] remove _ctg_new_target

execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run summon minecraft:area_effect_cloud 42 131 -17 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run scoreboard players set @e[tag=_ctg_new_target] _ctg_main 2
tag @e[tag=_ctg_new_target] remove _ctg_new_target

execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run summon minecraft:area_effect_cloud 38 118 -27 {Tags:["_ctg_target","_ctg_new_target", "_ctg_eye_target"], Duration: 2147483647}
execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run scoreboard players set @e[tag=_ctg_new_target] _ctg_main 3
tag @e[tag=_ctg_new_target] remove _ctg_new_target

execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run summon minecraft:area_effect_cloud 17 95 -49 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:endless_path_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:endless_path", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

execute if score Lesson _ctg_main matches 1 run function ctg:transition_start

# Continue to lesson 2
execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 2
execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 0
execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run function ctg:store

execute if score Lesson _ctg_main matches 1 if score Complete _ctg_scratch matches 1 run function ctg:completed
