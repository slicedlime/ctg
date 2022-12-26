# Player state
function ctg:gamemode/adventure
clear @a

fill 1024 10 1024 1024 40 1024 air

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Where did all these bats come from? Are they having trouble taking off? Help them out by teleporting them all two blocks upwards.", "color":"gold", "with": [{"translate": "teleporting them all two blocks upwards", "color": "green"}]}]

title @a actionbar [{"translate":"Teleport all bats two blocks upwards","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute as @e[type=bat] store result score @s _ctg_scratch run data get entity @s Pos[1] 100
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 4 if entity @e[type=bat,tag=_ctg_l9e4b1,x=-14.46,y=101.1,z=-105.59,distance=..0.00001] if entity @e[type=bat,tag=_ctg_l9e4b2,x=-7.43,y=101.1,z=-104.56,distance=..0.00001] if entity @e[type=bat,tag=_ctg_l9e4b3,x=-13.02,y=101.1,z=-116.10,distance=..0.00001] if entity @e[type=bat,tag=_ctg_l9e4b4,x=1024.5,y=32.25,z=1024.5,distance=..0.00001] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if score Completed _ctg_scratch matches 0 unless entity @e[type=bat,tag=_ctg_l9e4b1] run summon bat -14.46 99.1 -105.59 {NoAI:1, Rotation:[-135f,2.5f], Tags:["_ctg_l9e4b1"],PersistenceRequired:1b,BatFlags:1b}
execute if score Completed _ctg_scratch matches 0 run tp @e[type=bat,tag=_ctg_l9e4b1] -14.46 99.1 -105.59
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=bat,tag=_ctg_l9e4b2] run summon bat -7.43 99.1 -104.56 {NoAI:1, Rotation:[162f,1f], Tags:["_ctg_l9e4b2"],PersistenceRequired:1b,BatFlags:1b}
execute if score Completed _ctg_scratch matches 0 run tp @e[type=bat,tag=_ctg_l9e4b2] -7.43 99.1 -104.56
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=bat,tag=_ctg_l9e4b3] run summon bat -13.02 99.1 -116.10 {NoAI:1, Rotation:[162f,1f], Tags:["_ctg_l9e4b3"],PersistenceRequired:1b,BatFlags:1b}
execute if score Completed _ctg_scratch matches 0 run tp @e[type=bat,tag=_ctg_l9e4b3] -13.02 99.1 -116.10
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=bat,tag=_ctg_l9e4b4] run summon bat 1024.5 30.25 1024.5 {NoAI:1, Tags:["_ctg_l9e4b4"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 run tp @e[type=bat,tag=_ctg_l9e4b4] 1024.5 30.25 1024.5

execute if score Completed _ctg_scratch matches 1 run tp @e[type=bat] ~ -400 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=bat]
