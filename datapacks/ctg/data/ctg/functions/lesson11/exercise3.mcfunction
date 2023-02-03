# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run setblock -77 99 -18 grass_block

execute unless entity @e[type=pig,tag=_ctg_l11e3p1] run summon pig -75.46 99.50 -24.93 {NoAI:1,Tags:["_ctg_l11e3p1", "_ctg_l11e3"],Rotation:[-300.21f,-15.68f]}
execute as @e[type=pig,tag=_ctg_l11e3p1] at @s unless block ~ ~ ~ oak_slab run tp @s -75.46 99.50 -24.93 -300.21 -15.68
execute unless entity @e[type=pig,tag=_ctg_l11e3p2] run summon pig -77.93 100.00 -15.23 {NoAI:1,Tags:["_ctg_l11e3p2", "_ctg_l11e3"],Rotation:[-214.23f,-17.01f]}
execute as @e[type=pig,tag=_ctg_l11e3p1] at @s unless block ~ ~ ~ oak_slab run tp @s -77.93 100.00 -15.23 -214.23 -17.01
setblock 1024 10 1024 grass_block
setblock 1024 30 1024 stone
execute unless entity @e[type=pig,tag=_ctg_l11e3p3] run summon pig 1024 11 1024 {NoAI:1,Tags:["_ctg_l11e3p3", "_ctg_l11e3"]}
execute unless entity @e[type=pig,tag=_ctg_l11e3p4] run summon pig 1024 31 1024 {NoAI:1,Tags:["_ctg_l11e3p4", "_ctg_l11e3"]}
tp @e[type=pig,tag=!_ctg_l11e3] ~ -1000 ~

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Now all animals need friends in their natural environment, don't you think?", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Summon a sheep at the feet of every pig that is standing on a grass block.", "color":"gold", "with": [{"translate": "Summon a sheep at the feet of every pig that is standing on a grass block", "color": "green"}]}]

title @a actionbar [{"translate":"Summon a sheep at every pig on a grass block","color":"green"}]

# Win condition
execute store result score SheepCount _ctg_scratch if entity @e[type=sheep]
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 3 at @e[type=pig,tag=_ctg_l11e3p1] unless entity @e[type=sheep,distance=..1] at @e[type=pig,tag=_ctg_l11e3p2] if entity @e[type=sheep,distance=..1] at @e[type=pig,tag=_ctg_l11e3p3] if entity @e[type=sheep,distance=..1] at @e[type=pig,tag=_ctg_l11e3p4] unless entity @e[type=sheep,distance=..1] if score SheepCount _ctg_scratch matches 2 run scoreboard players set Completed _ctg_scratch 1

tp @e[type=sheep] ~ -1000 ~

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run tp @e[type=pig,tag=_ctg_l11e3] ~ -1000 ~
