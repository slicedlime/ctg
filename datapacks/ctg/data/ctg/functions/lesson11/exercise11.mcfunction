# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"New emerald block, new scoreboard - this one is called 'Bird'.", "color":"gold", "with": [{"text": "Bird", "color": "white", "lookup": "Bird"}]}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Place a command block on the emerald block. Make it summon a parrot if the 'Parrot' 'Bird' score is not 1 or 2.", "color":"gold", "with": [{"translate": "summon a parrot if the 'Parrot' 'Bird' score is not 1 or 2", "color": "green", "with": [{"text": "Parrot", "color": "white", "lookup": "Parrot"}, {"text": "Bird", "color": "white", "lookup": "Bird"}]}]}]
execute if score Tick _ctg_main matches 160 run tellraw @a [{"text":"\n"},{"translate":"When you are done, activate the command block.", "color":"gold"}]

title @a actionbar [{"translate":"Command Block: Summon parrot if the 'Parrot' 'Bird' score is not 1 or 2","color":"green", "with":[{"text": "Parrot", "color": "white", "lookup": "Parrot"}, {"text": "Bird", "color": "white", "lookup": "Bird"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 11 if entity @a[tag=_ctg_l11e11_check_5] if entity @e[type=parrot] run scoreboard players set Completed _ctg_scratch 1
tag @a[tag=_ctg_l11e11_check_5] remove _ctg_l11e11_check_5

execute if entity @a[tag=_ctg_l11e11_check_4] if entity @e[type=parrot] run tag @a add _ctg_l11e11_check_5
execute if entity @a[tag=_ctg_l11e11_check_4] if entity @e[type=parrot] run scoreboard players set Parrot Bird -2147483648
execute if entity @a[tag=_ctg_l11e11_check_4] if entity @e[type=parrot] run function ctg:lesson11/exercise11_check
tag @a[tag=_ctg_l11e11_check_4] remove _ctg_l11e11_check_4

execute if entity @a[tag=_ctg_l11e11_check_3] unless entity @e[type=parrot] run tag @a add _ctg_l11e11_check_4
execute if entity @a[tag=_ctg_l11e11_check_3] unless entity @e[type=parrot] run scoreboard players set Parrot Bird 3
execute if entity @a[tag=_ctg_l11e11_check_3] unless entity @e[type=parrot] run function ctg:lesson11/exercise11_check
tag @a[tag=_ctg_l11e11_check_3] remove _ctg_l11e11_check_3

execute if entity @a[tag=_ctg_l11e11_check_2] unless entity @e[type=parrot] run tag @a add _ctg_l11e11_check_3
execute if entity @a[tag=_ctg_l11e11_check_2] unless entity @e[type=parrot] run scoreboard players set Parrot Bird 2
execute if entity @a[tag=_ctg_l11e11_check_2] unless entity @e[type=parrot] run function ctg:lesson11/exercise11_check
tag @a[tag=_ctg_l11e11_check_2] remove _ctg_l11e11_check_2

execute if entity @a[tag=_ctg_l11e11_check_1] if entity @e[type=parrot] run tag @a add _ctg_l11e11_check_2
execute if entity @a[tag=_ctg_l11e11_check_1] if entity @e[type=parrot] run scoreboard players set Parrot Bird 1
execute if entity @a[tag=_ctg_l11e11_check_1] if entity @e[type=parrot] run function ctg:lesson11/exercise11_check
tag @a[tag=_ctg_l11e11_check_1] remove _ctg_l11e11_check_1

execute if block -86 101 -23 command_block run data modify block -86 101 -23 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l11e10 LastExecution set from block -86 101 -23 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run scoreboard players set Parrot Bird 0
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson11/exercise11_check
execute if score CommandExecuted _ctg_scratch matches 1 run tag @a add _ctg_l11e11_check_1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 12
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run setblock -86 100 -23 grass_block
execute if score Completed _ctg_scratch matches 0 run setblock -86 100 -23 emerald_block
execute if score Completed _ctg_scratch matches 1 run scoreboard objectives remove Bird
execute if score Completed _ctg_scratch matches 0 run scoreboard objectives add Bird dummy
