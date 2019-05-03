# Completely nuke and recreate scratch space in case it has been tampered with, ignoring errors
scoreboard objectives remove _ctg_scratch
scoreboard objectives add _ctg_scratch dummy "CTG Scratch Space"

# Add main scoreboard objectives and record if successful, which meant they were removed
execute store success score MainRemoved _ctg_scratch run scoreboard objectives add _ctg_main dummy "CTG Main Storage"
execute store success score BackupRemoved _ctg_scratch run scoreboard objectives add _ctg_backup dummy "CTG Backup Storage"

# Okay, if we lost main but not backup, copy back secondary info
execute if score MainRemoved _ctg_scratch matches 1.. unless score BackupRemoved _ctg_scratch matches 1.. run scoreboard players operation Tick _ctg_main = Tick _ctg_backup

# Give a friendly error message if scoreboards were tampered with
scoreboard players operation ObjectiveError _ctg_scratch = MainRemoved _ctg_scratch
scoreboard players operation ObjectiveError _ctg_scratch += BackupRemoved _ctg_scratch
execute if score ObjectiveError _ctg_scratch matches 1.. run function ctg:text/objective_error
scoreboard players reset ObjectiveError _ctg_scratch

# Check force load
setblock 1024 1 1024 minecraft:stone
execute store result score ForceLoaded _ctg_scratch run forceload query 1024 1024
execute if score ForceLoaded _ctg_scratch matches 0 run function ctg:safety/forceload_error
execute unless score ForceLoaded _ctg_scratch matches 0 if score ErrorMode _ctg_main matches 0.. run function ctg:text/forceload_fixed
execute unless score ForceLoaded _ctg_scratch matches 0 run scoreboard players reset ErrorMode _ctg_main

# Check for existence of backup entity
execute unless score ErrorMode _ctg_main matches 0.. unless entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup] run function ctg:safety/restore_entity

# Check backup block
execute unless score ErrorMode _ctg_main matches 0.. unless block 1024 0 1024 minecraft:end_gateway run function ctg:safety/restore_block

# Okay, now everything exists - let's figure out which lesson we were at
execute unless score ErrorMode _ctg_main matches 0.. run function ctg:safety/set_lesson
