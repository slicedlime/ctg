# Completely nuke and recreate scratch space in case it has been tampered with, ignoring errors
scoreboard objectives remove _ctg_scratch
scoreboard objectives add _ctg_scratch dummy "CTG Scratch Space"

# Check force load
execute store result score ForceLoaded _ctg_scratch run forceload query 1024 1024
execute if score ForceLoaded _ctg_scratch matches 0 run forceload add 1024 1024

# Check if actually loaded
execute store success score ChunkLoaded _ctg_scratch unless block 1024 -1 1024 lime_stained_glass_pane
execute if score ChunkLoaded _ctg_scratch matches 0 run scoreboard players add ErrorMode _ctg_main 1
execute if score ChunkLoaded _ctg_scratch matches 1 run scoreboard players reset ErrorMode _ctg_main

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

# If force load is done, continue with entity/block checks
execute if score ChunkLoaded _ctg_scratch matches 1 run function ctg:safety/check_loaded
