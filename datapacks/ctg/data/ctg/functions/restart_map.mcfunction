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
execute positioned 32 113 54 run fill ~ ~ ~ ~31 ~31 ~31 air
execute positioned 82 115 2 run fill ~ ~ ~ ~31 ~31 ~31 air
execute positioned 87 91 -63 run fill ~ ~ ~ ~31 ~31 ~31 air
execute positioned 29 89 -123 run fill ~ ~ ~ ~31 ~31 ~31 air
execute positioned -21 87 -123 run fill ~ ~ ~ ~31 ~31 ~31 air
execute positioned -76 112 -84 run fill ~ ~ ~ ~31 ~31 ~31 air

kill @e[type=armor_stand]
kill @e[type=sheep]
kill @e[type=enderman]
kill @e[type=rabbit]
kill @e[type=creeper]
kill @e[type=spider]
kill @e[type=witch]
kill @e[type=guardian]
kill @e[type=cow]
kill @e[type=cat]
kill @e[type=skeleton]
kill @e[type=wolf]
kill @e[type=axolotl]
kill @e[type=item]
kill @e[type=end_crystal]

execute as @a run spectate
tp @a 0 102 0 -45 27
time set 22570
