# Smoothly transition to the next island

# Would be great if these could be AECs, but they can't because the direction doesn't seem to update properly
# Also would be great if they could be made fully invisible, but that also doesn't seem to work
execute if entity @e[tag=_ctg_target,scores={_ctg_main=1}] unless entity @e[tag=_ctg_eyes] at @p anchored eyes run summon minecraft:bat ^ ^ ^4 {NoGravity:1b,NoAI:1b, Silent:1b, Tags:["_ctg_eyes"], CustomName:'"CTG Eyes"', ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,Ambient:0b,ShowIcon:0b,ShowParticles:0b}]}
execute if entity @e[tag=_ctg_target,scores={_ctg_main=1}] unless entity @e[tag=_ctg_body] at @p run summon minecraft:bat ~ ~ ~ {NoGravity:1b,NoAI:1b, Silent:1b, Tags:["_ctg_body","_ctg_spline"], CustomName:'"CTG Body"', ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,Ambient:0b,ShowIcon:0b,ShowParticles:0b}]}
execute if entity @e[tag=_ctg_target,scores={_ctg_main=1}] unless entity @e[tag=_ctg_view] at @p run summon armor_stand ~ ~ ~ {Tags:["_ctg_view"], NoGravity:1b, Invisible:1b}
team add all
team join all @a[team=!all]
team join all @e[tag=_ctg_eyes]
team join all @e[tag=_ctg_body]
team join all @e[tag=_ctg_view]
team modify all seeFriendlyInvisibles false

execute as @e[tag=_ctg_spline] at @s facing entity @e[tag=_ctg_target,scores={_ctg_main=1},limit=1] feet run tp @s ^ ^ ^0.12
execute as @e[tag=_ctg_spline_next] at @s facing entity @e[tag=_ctg_target,scores={_ctg_main=2},limit=1] feet run tp @s ^ ^ ^0.12
execute as @e[tag=_ctg_eyes] at @s facing entity @e[tag=_ctg_eye_target] eyes run tp @s ^ ^ ^0.25
execute at @e[tag=_ctg_eye_target] as @e[tag=_ctg_eyes,distance=..0.3] run tp @s @e[tag=_ctg_eye_target,limit=1]

execute as @a run spectate @e[tag=_ctg_view,limit=1] @s
execute if score Tick _ctg_main matches 60.. if entity @e[tag=_ctg_body] as @e[tag=_ctg_view] at @s facing entity @e[tag=_ctg_body] feet run teleport @s ^ ^ ^0.12
execute as @e[tag=_ctg_view] at @s run teleport @s ~ ~ ~ facing entity @e[tag=_ctg_eyes,limit=1] eyes

execute if entity @e[tag=_ctg_target,scores={_ctg_main=2}] at @e[tag=_ctg_target,scores={_ctg_main=1}] if entity @e[tag=_ctg_body,distance=..4] run tag @e[tag=_ctg_body] add _ctg_goal_reached
execute unless entity @e[tag=_ctg_target,scores={_ctg_main=2}] at @e[tag=_ctg_target,scores={_ctg_main=1}] if entity @p[distance=..1] run tag @e[tag=_ctg_body] add _ctg_goal_reached
execute if entity @e[tag=_ctg_body,tag=_ctg_goal_reached] run function ctg:transition_next

scoreboard players operation $Parity _ctg_scratch = Tick _ctg_main
scoreboard players set 2 _ctg_scratch 2
scoreboard players operation $Parity _ctg_scratch %= 2 _ctg_scratch

execute if score Tick _ctg_main matches 40..340 if score $Parity _ctg_scratch matches 0 at @e[tag=_ctg_structure] run clone 1024 16 1024 1024 16 1024 ~ ~ ~
execute if score Tick _ctg_main matches 341 at @e[tag=_ctg_structure] run clone 1024 17 1024 1024 17 1024 ~ ~ ~
execute if score Tick _ctg_main matches 40..340 if score $Parity _ctg_scratch matches 0 at @e[tag=_ctg_structure] run setblock ~ ~-1 ~ redstone_block
execute if score Tick _ctg_main matches 341 at @e[tag=_ctg_structure] run setblock ~ ~-1 ~ redstone_block
execute if score Tick _ctg_main matches 40..342 if score $Parity _ctg_scratch matches 0 at @e[tag=_ctg_structure] run fill ~ ~-1 ~ ~ ~ ~ air
execute if score Tick _ctg_main matches 342 run kill @e[tag=_ctg_structure]
execute if score Tick _ctg_main matches 342 run fill 1024 16 1024 1024 17 1024 air

kill @e[type=item]
kill @e[type=falling_block]

#execute as @e[tag=_ctg_eyes] at @s run particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force
#execute as @e[tag=_ctg_body] at @s run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 force
#execute as @e[tag=_ctg_target] at @s run particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force
