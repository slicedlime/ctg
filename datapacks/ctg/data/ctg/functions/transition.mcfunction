# Smoothly transition to the next island

execute if entity @e[tag=_ctg_target,scores={_ctg_main=1}] unless entity @e[tag=_ctg_eyes] at @p anchored eyes run summon minecraft:armor_stand ^ ^ ^4 {Invisible:1,Marker:1,Tags:["_ctg_eyes"], Duration: 2147483647,CustomName:"\"CTG Eyes\""}
execute if entity @e[tag=_ctg_target,scores={_ctg_main=1}] unless entity @e[tag=_ctg_body] at @p run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,Marker:1,Tags:["_ctg_body","_ctg_spline"], Duration: 2147483647,CustomName:"\"CTG Body\""}

execute as @e[tag=_ctg_spline] at @s facing entity @e[tag=_ctg_target,scores={_ctg_main=1},limit=1] feet run tp @s ^ ^ ^0.15
execute as @e[tag=_ctg_spline_next] at @s facing entity @e[tag=_ctg_target,scores={_ctg_main=2},limit=1] feet run tp @s ^ ^ ^0.15
execute as @e[tag=_ctg_eyes] at @s facing entity @e[tag=_ctg_eye_target] eyes run tp @s ^ ^ ^0.25
execute at @e[tag=_ctg_eye_target] as @e[tag=_ctg_eyes,distance=..0.3] run tp @s @e[tag=_ctg_eye_target,limit=1]

execute if score Tick _ctg_main matches 60.. if entity @e[tag=_ctg_body] as @a at @s facing entity @e[tag=_ctg_body] feet run teleport @s ^ ^ ^0.15
execute as @a at @s run teleport @s ~ ~ ~ facing entity @e[tag=_ctg_eyes,limit=1] eyes

execute if entity @e[tag=_ctg_target,scores={_ctg_main=2}] at @e[tag=_ctg_target,scores={_ctg_main=1}] if entity @e[tag=_ctg_body,distance=..4] run function ctg:transition_next
execute unless entity @e[tag=_ctg_target,scores={_ctg_main=2}] at @e[tag=_ctg_target,scores={_ctg_main=1}] if entity @p[distance=..1] run function ctg:transition_next

execute if score Tick _ctg_main matches 40..240 at @e[tag=_ctg_structure] run clone 1024 16 1024 1024 16 1024 ~ ~ ~
execute if score Tick _ctg_main matches 241 at @e[tag=_ctg_structure] run clone 1024 17 1024 1024 17 1024 ~ ~ ~
execute if score Tick _ctg_main matches 40..241 at @e[tag=_ctg_structure] run setblock ~ ~-1 ~ redstone_block
execute if score Tick _ctg_main matches 40..242 at @e[tag=_ctg_structure] run fill ~ ~-1 ~ ~ ~ ~ air
execute if score Tick _ctg_main matches 242 run kill @e[tag=_ctg_structure]
execute if score Tick _ctg_main matches 242 run fill 1024 16 1024 1024 17 1024 air

kill @e[type=item]
kill @e[type=falling_block]

#execute as @e[tag=_ctg_eyes] at @s run particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force
#execute as @e[tag=_ctg_body] at @s run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 force
