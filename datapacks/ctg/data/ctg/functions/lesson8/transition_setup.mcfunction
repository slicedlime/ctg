# Set up transition

summon minecraft:area_effect_cloud 102.13 122.00 -51.51 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud 95.07 120.03 -58.32 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud 29 89 -123 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:limebox", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:limebox", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
