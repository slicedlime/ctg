# Restart everything

scoreboard players set Tick _ctg_main 0
scoreboard players set Tick _ctg_backup 0
scoreboard players set Lesson _ctg_scratch 0
scoreboard players set Exercise _ctg_scratch 0

function ctg:store

execute positioned 11 106 4 run fill ~ ~ ~ ~31 ~31 ~31 air
kill @e[type=armor_stand]