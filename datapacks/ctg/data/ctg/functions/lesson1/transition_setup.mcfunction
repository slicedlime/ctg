# Set up transition
summon minecraft:area_effect_cloud -0.04094714552603151 108.73857182910096 1.0023473937213199 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud 6.84 113.94 6.06 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud 11 106 4 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:ximure_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:ximure", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
