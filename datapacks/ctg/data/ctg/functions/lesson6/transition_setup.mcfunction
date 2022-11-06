# Set up transition
summon minecraft:area_effect_cloud 63.6521 135.7357 68.3801 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud 69.71 133.68 60.70 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud 82 115 2 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:nether_hollow_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:nether_hollow", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
