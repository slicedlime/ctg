# Set up transition
summon minecraft:area_effect_cloud 67.08 140.98 61.19 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 1
tag @e[tag=_ctg_new_target] remove _ctg_new_target

summon minecraft:area_effect_cloud 101.18 139.86 52.50 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 2
tag @e[tag=_ctg_new_target] remove _ctg_new_target
summon minecraft:area_effect_cloud 97.92 131.04 27.56 {Tags:["_ctg_target","_ctg_new_target"], Duration: 2147483647}
scoreboard players set @e[tag=_ctg_new_target] _ctg_main 3
tag @e[tag=_ctg_new_target] remove _ctg_new_target
summon minecraft:area_effect_cloud 97.00 131.04 21.07 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud 82 115 2 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:nether_hollow_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:nether_hollow", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
