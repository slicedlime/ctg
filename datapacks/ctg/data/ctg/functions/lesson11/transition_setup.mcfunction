# Set up transition
summon minecraft:area_effect_cloud -63.82 121.87 -66.45 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud -67.76 119.06 -57.69 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud -102 92 -32 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:lighthouse", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:lighthouse", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

scoreboard objectives remove fun

tag @a remove _ctg_need_transition
