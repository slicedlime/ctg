# Set up transition
summon minecraft:area_effect_cloud -14.8784 116.9933 44.3311 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud -6.07 117.39 49.05 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud 32 113 54 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:shrowarrs-temple-ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:shrowarrs-temple", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
