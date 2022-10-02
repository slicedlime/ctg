# Set up transition
summon minecraft:area_effect_cloud 32 128 -21 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 1
tag @e[tag=_ctg_new_target] remove _ctg_new_target

summon minecraft:area_effect_cloud 12 141 -27 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 2
tag @e[tag=_ctg_new_target] remove _ctg_new_target

summon minecraft:area_effect_cloud -16 130 -20 {Tags:["_ctg_target","_ctg_new_target", "_ctg_eye_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 3
tag @e[tag=_ctg_new_target] remove _ctg_new_target

summon minecraft:area_effect_cloud -32 102 -42 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:grass_tubes", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:grass_tubes", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
