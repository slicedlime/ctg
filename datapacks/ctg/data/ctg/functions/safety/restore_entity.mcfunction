# Did it just lose tags?
data merge entity @e[type=minecraft:area_effect_cloud,x=1024,y=1,z=1024,dx=0,dy=0,dz=0,limit=1] {"CustomName": '"Command Training Grounds Entity"', "Tags": ["_ctg_backup"],"Duration": 2047483647}
execute if entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup] run function ctg:text/entity_error

# Entity got nuked, RIP
execute unless entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup] run function ctg:text/entity_killed_error
execute unless entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup] run summon minecraft:area_effect_cloud 1024 1 1024 {"CustomName": '"Command Training Grounds Entity"', "Tags": ["_ctg_backup"],"Duration": 2047483647}
