# Player state
function ctg:gamemode/adventure
execute if score Tick _ctg_main matches 1 run clear @a
execute unless entity @e[type=allay,tag=_ctg_l11e7a1] run summon allay -74.88 104.28 -16.54 {NoAI:1, Tags:["_ctg_l11e7a1", "_ctg_l11e7"], Rotation:[-606.23f,34.74f]}
execute unless entity @e[type=allay,tag=_ctg_l11e7a2] run summon allay -74.37 100.50 -20.44 {NoAI:1, Tags:["_ctg_l11e7a2", "_ctg_l11e7"], Rotation:[-633.61f,7.11f]}
fill 1024 10 1024 1026 100 1026 air
setblock 1024 10 1024 andesite_stairs
execute unless entity @e[type=allay,tag=_ctg_l11e7a3] run summon allay 1024 11 1024 {NoAI:1, Tags:["_ctg_l11e7a3", "_ctg_l11e7"], Rotation:[-606.23f,34.74f]}
execute unless entity @e[type=allay,tag=_ctg_l11e7a4] run summon allay 1024 25 1024 {NoAI:1, Tags:["_ctg_l11e7a4", "_ctg_l11e7"], Rotation:[-633.61f,7.11f]}
tp @e[type=allay,tag=!_ctg_l11e7] ~ -1000 ~
execute unless entity @e[type=bat,tag=_ctg_l11e7b1] run summon bat -74.68 105.28 -14.54 {NoAI:1, Tags:["_ctg_l11e7b1", "_ctg_l11e7"], Rotation:[-606.23f,34.74f], PersistenceRequired:1}
execute unless entity @e[type=bat,tag=_ctg_l11e7b2] run summon bat 1024 12 1024 {NoAI:1, Tags:["_ctg_l11e7b2", "_ctg_l11e7"], Rotation:[-606.23f,34.74f], PersistenceRequired:1}
tp @e[type=bat,tag=!_ctg_l11e7] ~ -1000 ~

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"One of these allays has a bat friend! Add the tag 'lonely' to all allays that don't have a bat within 5 blocks.", "color":"gold", "with": [{"translate": "Add the tag 'lonely' to all allays that don't have a bat within 5 blocks", "color": "green", "with": [{"text": "lonely", "color": "white", "lookup": "lonely"}]}]}]

title @a actionbar [{"translate":"Tag all allays without a bat within 5 blocks 'lonely'","color":"green", "with": [{"text": "lonely", "color": "white", "lookup": "lonely"}]}]

# Win condition
execute store result score TaggedCount _ctg_scratch if entity @e[tag=lonely]

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 7 if score TaggedCount _ctg_scratch matches 2 if entity @e[type=allay,tag=_ctg_l11e7a1,tag=lonely] if entity @e[type=allay,tag=_ctg_l11e7a3,tag=lonely] run scoreboard players set Completed _ctg_scratch 1
tag @e[tag=lonely] remove lonely

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 8
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run tp @e[tag=_ctg_l11e7] ~ -1000 ~
