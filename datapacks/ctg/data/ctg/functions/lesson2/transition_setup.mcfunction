# Set up transition
summon minecraft:area_effect_cloud 26 136 14 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 1
tag @e[tag=_ctg_new_target] remove _ctg_new_target

summon minecraft:area_effect_cloud 42 131 -17 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 2
tag @e[tag=_ctg_new_target] remove _ctg_new_target

summon minecraft:area_effect_cloud 38 118 -27 {Tags:["_ctg_target","_ctg_new_target", "_ctg_eye_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 3
tag @e[tag=_ctg_new_target] remove _ctg_new_target

summon minecraft:area_effect_cloud 17 95 -49 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:endless_path_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:endless_path", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
