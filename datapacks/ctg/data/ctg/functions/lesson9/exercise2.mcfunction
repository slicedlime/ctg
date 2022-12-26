# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Let's have cats instead. Cats are nice! Oh no - these spiders might scare the cats!", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Kill all spiders within 3 blocks of a cat.", "color":"gold", "with": [{"translate": "Kill all spiders within 3 blocks of a cat", "color": "green"}]}]

title @a actionbar [{"translate":"Kill all spiders within 3 blocks of a cat","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute store result score SpiderCount _ctg_scratch if entity @e[type=spider]
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 2 if score SpiderCount _ctg_scratch matches 2 run scoreboard players set Completed _ctg_scratch 1
execute at @e[type=cat] if entity @e[type=spider,distance=..3] run scoreboard players set Completed _ctg_scratch 0

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if score Completed _ctg_scratch matches 0 unless entity @e[type=cat,tag=_ctg_l9e2c1] run summon cat -14.46 98.00 -105.59 {NoAI:1, Rotation:[-135f,2.5f], Tags:["_ctg_l9e2c1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=cat,tag=_ctg_l9e2c2] run summon cat -7.43 98.00 -104.56 {NoAI:1, Rotation:[162f,1f], Tags:["_ctg_l9e2c2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=cat,tag=_ctg_l9e2c3] run summon cat -13.02 98.00 -116.10 {NoAI:1, Rotation:[162f,1f], Tags:["_ctg_l9e2c3"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=cat,tag=_ctg_l9e2c4] run summon cat 1024 30 1024 {NoAI:1, Tags:["_ctg_l9e2c4"],PersistenceRequired:1b}

execute if score Completed _ctg_scratch matches 0 unless entity @e[type=spider,tag=_ctg_l9e2s1] run summon spider -5.43 98.00 -105.63 {NoAI:1, Rotation:[60.41f,17.96f], Tags:["_ctg_l9e2s1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=spider,tag=_ctg_l9e2s2] run summon spider -2.25 98.00 -113.95 {NoAI:1, Rotation:[61.83f,10.12f], Tags:["_ctg_l9e2s2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=spider,tag=_ctg_l9e2s3] run summon spider 1024 32 1024 {NoAI:1,Tags:["_ctg_l9e2s3"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=spider,tag=_ctg_l9e2s4] run summon spider 1024 40 1024 {NoAI:1,Tags:["_ctg_l9e2s4"],PersistenceRequired:1b}

execute if score Completed _ctg_scratch matches 1 run tp @e[type=spider] ~ -400 ~
execute if score Completed _ctg_scratch matches 1 run tp @e[type=cat] ~ -400 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=spider]
execute if score Completed _ctg_scratch matches 1 run kill @e[type=cat]
