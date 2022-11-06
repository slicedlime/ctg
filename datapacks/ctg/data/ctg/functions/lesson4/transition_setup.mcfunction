# Set up transition
summon minecraft:area_effect_cloud -20.8546 134.1619 -27.2373 {Tags:["_ctg_target"], Duration: 2147483647}
summon minecraft:area_effect_cloud -20.90 128.96 -18.70 {Tags:["_ctg_eye_target"], Duration: 2147483647}

summon minecraft:area_effect_cloud -35 103 22 {Tags:["_ctg_structure"], Duration:2147483647}
setblock 1024 16 1024 structure_block{name:"ctg:icy_stream_ip", showboundingbox:0b, mode:"LOAD", integrity: 0.01f,ignoreEntities:1b}
setblock 1024 17 1024 structure_block{name:"ctg:icy_stream", showboundingbox:0b, mode:"LOAD", integrity: 1.0f}

tag @a remove _ctg_need_transition
