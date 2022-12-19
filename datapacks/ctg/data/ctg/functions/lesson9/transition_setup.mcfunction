# Set up transition

summon minecraft:area_effect_cloud 33.69 96.90 -112.86 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud 24.08 94.75 -114.64 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud -21 87 -123 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:turtle_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:turtle", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
