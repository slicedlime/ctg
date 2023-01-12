# Set up transition
summon minecraft:area_effect_cloud -14.83 100.55 -110.62 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud -22.91 102.73 -105.15 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud -76 112 -84 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:octo_end", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:octo_end", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
