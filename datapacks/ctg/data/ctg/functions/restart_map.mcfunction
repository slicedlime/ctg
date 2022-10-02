# Restart everything

scoreboard players set Tick _ctg_main 0
scoreboard players set Tick _ctg_backup 0
scoreboard players set Lesson _ctg_scratch 0
scoreboard players set Exercise _ctg_scratch 0

function ctg:store

execute positioned 11 106 4 run fill ~ ~ ~ ~31 ~31 ~31 air
execute positioned 17 95 -49 run fill ~ ~ ~ ~31 ~31 ~31 air
execute positioned -32 101 -42 run fill ~ ~ ~ ~31 ~31 ~31 air
execute positioned -35 103 22 run fill ~ ~ ~ ~31 ~31 ~31 air
kill @e[type=armor_stand]

execute as @a run spectate
tp @a 0 102 0 -45 27
time set 22570
