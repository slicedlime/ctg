# Check for existence of backup entity
execute unless score ErrorMode _ctg_main matches 0.. unless entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup] run function ctg:safety/restore_entity

# Move aec to where it should be, in case the player moved it (or old version of map)
tp @e[type=area_effect_cloud,tag=_ctg_backup] 1024 -1 1024

# Make sure there's only one
execute store result score EntityCount _ctg_scratch if entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup]
execute if score EntityCount _ctg_scratch matches 2.. run function ctg:safety/kill_duplicate_entities

# Check backup block
execute unless score ErrorMode _ctg_main matches 0.. unless block 1024 0 1024 minecraft:end_gateway run function ctg:safety/restore_block

# Okay, now everything exists - let's figure out which lesson we were at
execute unless score ErrorMode _ctg_main matches 0.. run function ctg:safety/set_lesson
