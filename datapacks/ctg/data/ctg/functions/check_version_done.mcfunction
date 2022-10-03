data modify storage ctg:heads test set from storage ctg:heads e$EPISODE
execute store success score DataMatched _ctg_scratch run data modify storage ctg:heads test set from block 1032 0 1024 SkullOwner.Properties.textures
execute if score DataMatched _ctg_scratch matches 1 run function ctg:text/new_version
setblock 1032 0 1024 air
