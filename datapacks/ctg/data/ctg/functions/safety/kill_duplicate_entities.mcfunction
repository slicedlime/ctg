# Kill extra backup entities if there are too many

kill @e[type=minecraft:area_effect_cloud,tag=_ctg_backup,limit=1]
execute store result score EntityCount _ctg_scratch if entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup]
execute if score EntityCount _ctg_scratch matches 2.. run function ctg:safety/kill_duplicate_entities
