# Do fancy fx stuff for completed exercise
scoreboard players add @s _ctg_main 1

tp @s ~ ~0.05 ~ ~18 0
execute positioned ^ ^ ^2 run particle glow ~ ~ ~ 0.3 0.2 0.3 0 10 force

execute if score @s _ctg_main matches 40.. run kill @s
