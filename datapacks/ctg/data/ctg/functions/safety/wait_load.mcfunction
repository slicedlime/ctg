# We're force-loading a chunk, but after a load-in it's impossible to know if it's loaded properly
# so we resort to this horror of hackery

setblock 1024 -63 1024 command_block{Command:"function ctg:safety/end_wait_load"}
setblock 1024 -62 1024 oak_pressure_plate
execute unless entity @e[type=armor_stand,tag=_ctg_load_trigger] run summon armor_stand 1024 -61 1024 {Tags:["_ctg_load_trigger"]}
