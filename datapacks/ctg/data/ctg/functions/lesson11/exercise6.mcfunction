# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"New emerald block on the ground - place a command block on top of it. Make the command block give you a diamond if there is any silverfish in the world.", "color":"gold", "with": [{"translate": "give you a diamond if there is any silverfish in the world", "color": "green"}]}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"When you are done, activate the command block."}]

title @a actionbar [{"translate":"Make a command block that gives you diamonds if there are silverfish","color":"green"}]

# Win condition
execute store result score DiamondCount _ctg_scratch run clear @p diamond 0

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 6 if entity @p[tag=_ctg_l11e6_check_5] if score DiamondCount _ctg_scratch matches 1 run scoreboard players set Completed _ctg_scratch 1
tag @a[tag=_ctg_l11e6_check_5] remove _ctg_l11e6_check_5

execute if entity @a[tag=_ctg_l11e6_check_4] if score DiamondCount _ctg_scratch matches 0 run tag @a add _ctg_l11e6_check_5
execute if entity @a[tag=_ctg_l11e6_check_4] if score DiamondCount _ctg_scratch matches 0 run summon silverfish 1024 11 1024 {PersistenceRequired:1}
execute if entity @a[tag=_ctg_l11e6_check_4] if score DiamondCount _ctg_scratch matches 0 run function ctg:lesson11/exercise6_check
tag @a[tag=_ctg_l11e6_check_4] remove _ctg_l11e6_check_4

execute if entity @a[tag=_ctg_l11e6_check_3] if score DiamondCount _ctg_scratch matches 1 run tag @a add _ctg_l11e6_check_4
execute if entity @a[tag=_ctg_l11e6_check_3] if score DiamondCount _ctg_scratch matches 1 run kill @e[type=silverfish]
execute if entity @a[tag=_ctg_l11e6_check_3] if score DiamondCount _ctg_scratch matches 1 run function ctg:lesson11/exercise6_check
tag @a[tag=_ctg_l11e6_check_3] remove _ctg_l11e6_check_3

execute if entity @a[tag=_ctg_l11e6_check_2] if score DiamondCount _ctg_scratch matches 0 run tag @a add _ctg_l11e6_check_3
execute if entity @a[tag=_ctg_l11e6_check_2] if score DiamondCount _ctg_scratch matches 0 run summon silverfish 1024 11 1024 {PersistenceRequired:1}
execute if entity @a[tag=_ctg_l11e6_check_2] if score DiamondCount _ctg_scratch matches 0 run function ctg:lesson11/exercise6_check
tag @a[tag=_ctg_l11e6_check_2] remove _ctg_l11e6_check_2

execute if entity @a[tag=_ctg_l11e6_check_1] if score DiamondCount _ctg_scratch matches 1 run say Check 1 diamonds
execute if entity @a[tag=_ctg_l11e6_check_1] if score DiamondCount _ctg_scratch matches 0 run say Check 1 no diamonds
execute if entity @a[tag=_ctg_l11e6_check_1] if score DiamondCount _ctg_scratch matches 1 run tag @a add _ctg_l11e6_check_2
execute if entity @a[tag=_ctg_l11e6_check_1] if score DiamondCount _ctg_scratch matches 1 run kill @e[type=silverfish]
execute if entity @a[tag=_ctg_l11e6_check_1] if score DiamondCount _ctg_scratch matches 1 run function ctg:lesson11/exercise6_check
tag @a[tag=_ctg_l11e6_check_1] remove _ctg_l11e6_check_1

execute if block -79 100 -23 command_block run data modify block -79 100 -23 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l11e6 LastExecution set from block -79 100 -23 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson11/exercise6_check
execute if score CommandExecuted _ctg_scratch matches 1 run summon silverfish 1024 11 1024 {PersistenceRequired:1}
execute if score CommandExecuted _ctg_scratch matches 1 run tag @a add _ctg_l11e6_check_1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run setblock -79 99 -23 grass_block
execute if score Completed _ctg_scratch matches 0 run setblock -79 99 -23 emerald_block
execute if score Completed _ctg_scratch matches 1 run kill @e[type=silverfish]
