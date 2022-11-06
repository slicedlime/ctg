# Set up transition
summon minecraft:area_effect_cloud 34.2683 119.3309 -24.7611 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud 24.32 120.30 -24.97 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud -32 102 -42 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:grass_tubes", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:grass_tubes", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
