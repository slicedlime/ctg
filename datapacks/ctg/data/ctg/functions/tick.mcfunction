# Increase Tick counter

execute unless entity @p[name=slicedlime,nbt={SelectedItem:{id:"minecraft:lava_bucket"}}] run scoreboard players add Tick _ctg_main 1
execute unless entity @p[name=slicedlime,nbt={SelectedItem:{id:"minecraft:lava_bucket"}}] run scoreboard players operation Tick _ctg_backup = Tick _ctg_main
