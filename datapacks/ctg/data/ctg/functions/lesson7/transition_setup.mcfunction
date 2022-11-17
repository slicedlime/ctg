# Set up transition

summon minecraft:area_effect_cloud 111.25 132.76 22.73 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud 120.23 131.48 18.52 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud 87 91 -63 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:wool_island_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:wool_island", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
