# Player state
function ctg:gamemode/adventure
clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"These husks look like they need a bit of a cheering up. You know what's good for that? Shroomlights.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Place a shroomlight above the head of all husks.", "color":"gold", "with": [{"translate": "Place a shroomlight above the head of all husks", "color": "green"}]}]

title @a actionbar [{"translate":"Place a shroomlight above the head of all husks","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
scoreboard players set Shrooms _ctg_scratch 0
execute as @e[type=husk] at @s if block ~1 ~2 ~ air run scoreboard players add Shrooms _ctg_scratch 1
execute as @e[type=husk] at @s if block ~ ~2 ~ shroomlight run scoreboard players add Shrooms _ctg_scratch 1
execute as @e[type=husk] at @s if block ~ ~1 ~ air run scoreboard players add Shrooms _ctg_scratch 1
execute positioned 1024 30 1024 if entity @e[type=husk,distance=..30] if score Shrooms _ctg_scratch matches 12 run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 2
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if score Completed _ctg_scratch matches 0 unless entity @e[type=husk,tag=_ctg_l9e1h1] run summon husk -14.46 98.00 -105.59 {NoAI:1, Rotation:[-135f,2.5f], Tags:["_ctg_l9e1h1"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=husk,tag=_ctg_l9e1h2] run summon husk -7.43 98.00 -104.56 {NoAI:1, Rotation:[162f,1f], Tags:["_ctg_l9e1h2"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=husk,tag=_ctg_l9e1h3] run summon husk -13.02 98.00 -116.10 {NoAI:1, Rotation:[162f,1f], Tags:["_ctg_l9e1h3"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 unless entity @e[type=husk,tag=_ctg_l9e1h4] run summon husk 1024 30 1024 {NoAI:1, Tags:["_ctg_l9e1h4"],PersistenceRequired:1b}
execute if score Completed _ctg_scratch matches 0 as @e[type=husk] at @s run fill ~ ~ ~ ~ ~2 ~ air

execute if score Completed _ctg_scratch matches 1 run tp @e[type=husk] ~ -400 ~
execute if score Completed _ctg_scratch matches 1 run kill @e[type=husk]
