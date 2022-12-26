# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run setblock -9 98 -113 air
execute if score Tick _ctg_main matches 1 run data remove storage ctg:l9e3 Command

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"This is the final exercise in this section. See how there are now copper blocks in the ground? To graduate from this part, your task is to make a command block chain on those blocks.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"We can call this one \"a wolf in sheep's clothing\". Make the command chain replace all wolves with sheep.", "color":"gold", "with": [{"translate": "replace all wolves with sheep", "color": "green"}]}]
execute if score Tick _ctg_main matches 160 run tellraw @a [{"text":"\n"},{"translate":"When you are done, activate the chain.", "color":"gold"}]

title @a actionbar [{"translate":"Replace all wolves with sheep","color":"green"}]

# Win condition
execute if block -5 98 -110 repeating_command_block run data modify block -5 98 -110 UpdateLastExecution set value 1
execute if block -5 98 -110 repeating_command_block{auto:1b} store success score CommandChanged _ctg_scratch run data modify storage ctg:l9e3 Command set from block -5 98 -110 Command
execute if score CommandChanged _ctg_scratch matches 1 run place template ctg:turtle_voids -21 87 -123

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 5 if entity @e[type=sheep,x=-14.46,y=98.0,z=-105.59,distance=..0.25] if entity @e[type=sheep,x=-7.43,y=98.0,z=-104.56,distance=..0.25] if entity @e[type=sheep,x=-13.02,y=98.0,z=-116.10,distance=..0.25] if entity @e[type=sheep,x=1024.5,y=30.2,z=1024.5,distance=..0.25] unless entity @e[type=wolf] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:lesson9/continue

execute if score Completed _ctg_scratch matches 0 run setblock -10 97 -111 minecraft:waxed_copper_block
execute if score Completed _ctg_scratch matches 0 run setblock -10 97 -110 minecraft:waxed_oxidized_copper
execute if score Completed _ctg_scratch matches 1 run fill -10 97 -111 -10 97 -110 grass_block

execute if score Completed _ctg_scratch matches 0 unless entity @e[type=wolf,tag=_ctg_l9e5w1] run summon wolf -14.46 98.00 -105.59 {NoAI:1, Rotation:[-135f,2.5f], Tags:["_ctg_l9e5w1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=wolf,tag=_ctg_l9e5w2] run summon wolf -7.43 98.00 -104.56 {NoAI:1, Rotation:[162f,1f], Tags:["_ctg_l9e5w2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=wolf,tag=_ctg_l9e5w3] run summon wolf -13.02 98.00 -116.10 {NoAI:1, Rotation:[162f,1f], Tags:["_ctg_l9e5w3"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=wolf,tag=_ctg_l9e5w4] run summon wolf 1024.5 30.2 1024.5 {NoAI:1, Tags:["_ctg_l9e5w4"],PersistenceRequired:1b}

execute if score Completed _ctg_scratch matches 1 run tp @e[type=wolf] ~ -400 ~
execute if score Completed _ctg_scratch matches 1 run tp @e[type=sheep] ~ -400 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=wolf]
execute if score Completed _ctg_scratch matches 1 run kill @e[type=sheep]
