# Set up transition
summon minecraft:area_effect_cloud 26.1493 127.9806 0.1239 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud 28.05 125.22 -9.30 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud 17 95 -49 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:endless_path_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:endless_path", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
