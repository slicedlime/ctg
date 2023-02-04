# Player state
function ctg:gamemode/adventure
execute if score Tick _ctg_main matches 1 run clear @a
fill 1024 10 1024 1026 100 1026 air
execute unless entity @e[type=husk,tag=_ctg_l11e8h1] run summon husk -79.57 101.00 -30.28 {NoAI:1, Tags:["_ctg_l11e8h1", "_ctg_l11e8"], Rotation:[-1757.73f,-0.24f]}
execute unless entity @e[type=husk,tag=_ctg_l11e8h2] run summon husk -86.61 101.50 -17.16 {NoAI:1, Tags:["_ctg_l11e8h2", "_ctg_l11e8"], Rotation:[-1555.72f,8.70f]}
execute unless entity @e[type=husk,tag=_ctg_l11e8h3] run summon husk 1024 11 1024 {NoAI:1, Tags:["_ctg_l11e8h3", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h4] run summon husk 1024 13 1024 {NoAI:1, Tags:["_ctg_l11e8h4", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h5] run summon husk 1024 15 1024 {NoAI:1, Tags:["_ctg_l11e8h5", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h6] run summon husk 1024 17 1024 {NoAI:1, Tags:["_ctg_l11e8h6", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h7] run summon husk 1024 19 1024 {NoAI:1, Tags:["_ctg_l11e8h7", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h8] run summon husk 1024 21 1024 {NoAI:1, Tags:["_ctg_l11e8h8", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h9] run summon husk 1024 23 1024 {NoAI:1, Tags:["_ctg_l11e8h9", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h10] run summon husk 1024 25 1024 {NoAI:1, Tags:["_ctg_l11e8h10", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h11] run summon husk 1024 27 1024 {NoAI:1, Tags:["_ctg_l11e8h11", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h12] run summon husk 1024 29 1024 {NoAI:1, Tags:["_ctg_l11e8h12", "_ctg_l11e8"], PersistenceRequired:1}
execute unless entity @e[type=husk,tag=_ctg_l11e8h13] run summon husk 1024 31 1024 {NoAI:1, Tags:["_ctg_l11e8h13", "_ctg_l11e8"], PersistenceRequired:1}
tp @e[type=husk,tag=!_ctg_l11e8] ~ -1000 ~

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Some husks have shown up! I wonder if there are more hidden somewhere else in this world? There is a new scoreboard called 'Entities' now.", "color":"gold", "with": [{"text": "Entities", "color": "white", "lookup": "Entities"}]}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Find out how many husks there are in the world and set the 'Husks' score in the 'Entities' scoreboard to that number.", "color":"gold", "with": [{"translate": "Find out how many husks there are in the world and set the 'Husks' score in the 'Entities' scoreboard to that number", "color": "green", "with": [{"text": "Husks", "color": "white", "lookup": "Husks"}, {"text": "Entities", "color": "white", "lookup": "Entities"}]}]}]

title @a actionbar [{"translate":"Set the 'Husks' score in the 'Entities' scoreboard to the no. of husks","color":"green", "with": [{"text": "Husks", "color": "white", "lookup": "Husks"}, {"text": "Entities", "color": "white", "lookup": "Entities"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 8 if score Husks Entities matches 13 run scoreboard players set Completed _ctg_scratch 1

scoreboard players add Husks Entities 0
execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run tp @e[tag=_ctg_l11e8] ~ -1000 ~
execute if score Completed _ctg_scratch matches 1 run scoreboard objectives remove Entities
execute if score Completed _ctg_scratch matches 0 run scoreboard objectives add Entities dummy
