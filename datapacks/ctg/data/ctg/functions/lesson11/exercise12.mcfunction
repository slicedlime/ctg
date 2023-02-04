# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Final exercise this time around! New emerald block, new scoreboard: 'Winner'", "color":"gold", "with": [{"text": "Winner", "color": "white", "lookup": "Winner"}]}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"This time, make your command block give you an emerald if your score is larger than the 'Limit' score.", "color":"gold", "with": [{"translate": "give you an emerald if your score is larger than the 'Limit' score", "color": "green", "with": [{"text": "Limit", "color": "white", "lookup": "Limit"}]}]}]
execute if score Tick _ctg_main matches 160 run tellraw @a [{"text":"\n"},{"translate":"When you are done, activate the command block.", "color":"gold"}]

title @a actionbar [{"translate":"Give @p an emerald if your 'Winner' score > 'Limit's 'Winner' score","color":"green", "with":[{"text": "@p", "color": "white", "lookup": "@p"}, {"text": "Winner", "color": "white", "lookup": "Winner"}, {"text": "Limit", "color": "white", "lookup": "Limit"}, {"text": "Winner", "color": "white", "lookup": "Winner"}]}]

# Win condition
execute store result score EmeraldCount _ctg_scratch run clear @p emerald 0

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 12 if entity @a[tag=_ctg_l11e12_check_5] if score EmeraldCount _ctg_scratch matches 1 run scoreboard players set Completed _ctg_scratch 1
tag @a[tag=_ctg_l11e12_check_5] remove _ctg_l11e12_check_5

execute if entity @a[tag=_ctg_l11e12_check_4] unless score EmeraldCount _ctg_scratch matches 1 run tag @a add _ctg_l11e12_check_5
execute if entity @a[tag=_ctg_l11e12_check_4] unless score EmeraldCount _ctg_scratch matches 1 run scoreboard players set Limit Winner -2001
execute if entity @a[tag=_ctg_l11e12_check_4] unless score EmeraldCount _ctg_scratch matches 1 run function ctg:lesson11/exercise12_check
tag @a[tag=_ctg_l11e12_check_4] remove _ctg_l11e12_check_4

execute if entity @a[tag=_ctg_l11e12_check_3] if score EmeraldCount _ctg_scratch matches 1 run tag @a add _ctg_l11e12_check_4
execute if entity @a[tag=_ctg_l11e12_check_3] if score EmeraldCount _ctg_scratch matches 1 run scoreboard players set @a Winner -2000
execute if entity @a[tag=_ctg_l11e12_check_3] if score EmeraldCount _ctg_scratch matches 1 run function ctg:lesson11/exercise12_check
tag @a[tag=_ctg_l11e12_check_3] remove _ctg_l11e12_check_3

execute if entity @a[tag=_ctg_l11e12_check_2] unless score EmeraldCount _ctg_scratch matches 1 run tag @a add _ctg_l11e12_check_3
execute if entity @a[tag=_ctg_l11e12_check_2] unless score EmeraldCount _ctg_scratch matches 1 run scoreboard players set Limit Winner -1
execute if entity @a[tag=_ctg_l11e12_check_2] unless score EmeraldCount _ctg_scratch matches 1 run function ctg:lesson11/exercise12_check
tag @a[tag=_ctg_l11e12_check_2] remove _ctg_l11e12_check_2

execute if entity @a[tag=_ctg_l11e12_check_1] if score EmeraldCount _ctg_scratch matches 1 run tag @a add _ctg_l11e12_check_2
execute if entity @a[tag=_ctg_l11e12_check_1] if score EmeraldCount _ctg_scratch matches 1 run scoreboard players set @a Winner 0
execute if entity @a[tag=_ctg_l11e12_check_1] if score EmeraldCount _ctg_scratch matches 1 run function ctg:lesson11/exercise12_check
tag @a[tag=_ctg_l11e12_check_1] remove _ctg_l11e12_check_1

execute if block -84 101 -20 command_block run data modify block -84 101 -20 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l11e10 LastExecution set from block -84 101 -20 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run scoreboard players set Limit Winner 0
execute if score CommandExecuted _ctg_scratch matches 1 run scoreboard players set @a Winner 1
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson11/exercise12_check
execute if score CommandExecuted _ctg_scratch matches 1 run tag @a add _ctg_l11e12_check_1

execute if score Completed _ctg_scratch matches 1 run function ctg:lesson11/continue
execute if score Completed _ctg_scratch matches 1 run setblock -84 100 -20 minecraft:stone_brick_slab[type=top,waterlogged=false]
execute if score Completed _ctg_scratch matches 0 run setblock -84 100 -20 emerald_block
execute if score Completed _ctg_scratch matches 1 run scoreboard objectives remove Winner
execute if score Completed _ctg_scratch matches 0 run scoreboard objectives add Winner dummy
