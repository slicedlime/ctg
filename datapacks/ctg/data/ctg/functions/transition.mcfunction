# Smoothly transition to the next island

# Would be great if these could be AECs, but they can't because the direction doesn't seem to update properly
# Also would be great if they could be made fully invisible, but that also doesn't seem to work
execute if entity @e[tag=_ctg_target] unless entity @e[tag=_ctg_view] at @p run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Tags:["_ctg_view"], CustomName:'"CTG View"'}
team add all
team join all @a[team=!all]
team join all @e[tag=_ctg_view]
team modify all seeFriendlyInvisibles false
execute as @e[tag=_ctg_eye_interpolation] at @s if entity @e[tag=_ctg_eye_target,distance=2..] facing entity @e[tag=_ctg_eye_target,limit=1] feet run tp @s ^ ^ ^2
execute if entity @e[tag=_ctg_view] as @e[tag=_ctg_view] at @s facing entity @e[tag=_ctg_target,limit=1,distance=0.25..] feet run tp @s ^ ^ ^0.25 facing entity @e[tag=_ctg_eye_interpolation,limit=1]

execute if entity @e[tag=_ctg_view] as @a run spectate @e[tag=_ctg_view,limit=1] @s

execute as @e[tag=_ctg_view] at @s if entity @e[tag=_ctg_target,distance=..0.25] run function ctg:transition_next

execute if score Tick _ctg_main matches 40..340 at @e[tag=_ctg_structure] run clone 1024 16 1024 1024 16 1024 ~ ~ ~
execute if score Tick _ctg_main matches 341 at @e[tag=_ctg_structure] run clone 1024 17 1024 1024 17 1024 ~ ~ ~
execute if score Tick _ctg_main matches 40..340 at @e[tag=_ctg_structure] run setblock ~ ~-1 ~ redstone_block
execute if score Tick _ctg_main matches 341 at @e[tag=_ctg_structure] run setblock ~ ~-1 ~ redstone_block
execute if score Tick _ctg_main matches 40..342 at @e[tag=_ctg_structure] run fill ~ ~-1 ~ ~ ~ ~ air
execute if score Tick _ctg_main matches 342 run kill @e[tag=_ctg_structure]
execute if score Tick _ctg_main matches 342 run fill 1024 16 1024 1024 17 1024 air

kill @e[type=item]
kill @e[type=falling_block]

scoreboard players add @a[scores={_ctg_intro=0..}] _ctg_intro 1
tag @a[scores={_ctg_intro=400}] add _ctg_transition_done
execute as @a[tag=_ctg_transition_done] run spawnpoint @s ~ ~ ~
scoreboard players reset @a[tag=_ctg_transition_done] _ctg_intro

#execute as @e[tag=_ctg_eyes] at @s run particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force
#execute as @e[tag=_ctg_view] at @s run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 force
#execute as @e[tag=_ctg_target] at @s run particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force
