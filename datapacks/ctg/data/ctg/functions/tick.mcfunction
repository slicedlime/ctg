# Increase Tick counter

execute unless entity @p[name=slicedlime,nbt={SelectedItem:{id:"minecraft:lava_bucket"}}] run scoreboard players add Tick _ctg_main 1
execute unless entity @p[name=slicedlime,nbt={SelectedItem:{id:"minecraft:lava_bucket"}}] run scoreboard players operation Tick _ctg_backup = Tick _ctg_main

# Run completion effects
execute as @e[type=marker,tag=_ctg_complete_effect] at @s run function ctg:complete_fx

# Check for new versions of map
execute if block 1032 0 1024 player_head{SkullOwner:{Id: [I;-116567627,1239826920,-2005049970,946187801]}} run function ctg:check_version_done
