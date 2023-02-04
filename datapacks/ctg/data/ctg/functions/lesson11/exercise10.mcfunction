# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"There's a scoreboard called 'Test' now, and a new emerald block.", "color":"gold", "with": [{"text": "Test", "color": "white", "lookup": "Test"}]}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Place a command block on the emerald block. Make it place a netherite block above itself if the 'Strength' score is over 9000.", "color":"gold", "with": [{"translate": "place a netherite block above itself if the 'Strength' score is over 9000", "color": "green", "with": [{"text": "Strength", "color": "white", "lookup": "Strength"}]}]}]
execute if score Tick _ctg_main matches 160 run tellraw @a [{"text":"\n"},{"translate":"When you are done, activate the command block.", "color":"gold"}]

title @a actionbar [{"translate":"Make a command set Netherite above if the 'Strength' 'Test' score is >9000","color":"green", "with":[{"text": "Strength", "color": "white", "lookup": "Strength"}, {"text": "Test", "color": "white", "lookup": "Test"}]}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 10 if entity @a[tag=_ctg_l11e10_check_5] if block 1024 11 1024 netherite_block run scoreboard players set Completed _ctg_scratch 1
tag @a[tag=_ctg_l11e10_check_5] remove _ctg_l11e10_check_5

execute if entity @a[tag=_ctg_l11e10_check_4] unless block 1024 11 1024 netherite_block run tag @a add _ctg_l11e10_check_5
execute if entity @a[tag=_ctg_l11e10_check_4] unless block 1024 11 1024 netherite_block run scoreboard players set Strength Test 9001
execute if entity @a[tag=_ctg_l11e10_check_4] unless block 1024 11 1024 netherite_block run function ctg:lesson11/exercise10_check
tag @a[tag=_ctg_l11e10_check_4] remove _ctg_l11e10_check_4

execute if entity @a[tag=_ctg_l11e10_check_3] if block 1024 11 1024 netherite_block run tag @a add _ctg_l11e10_check_4
execute if entity @a[tag=_ctg_l11e10_check_3] if block 1024 11 1024 netherite_block run scoreboard players set Strength Test -2147483648
execute if entity @a[tag=_ctg_l11e10_check_3] if block 1024 11 1024 netherite_block run function ctg:lesson11/exercise10_check
tag @a[tag=_ctg_l11e10_check_3] remove _ctg_l11e10_check_3

execute if entity @a[tag=_ctg_l11e10_check_2] unless block 1024 11 1024 netherite_block run tag @a add _ctg_l11e10_check_3
execute if entity @a[tag=_ctg_l11e10_check_2] unless block 1024 11 1024 netherite_block run scoreboard players set Strength Test 2147483647
execute if entity @a[tag=_ctg_l11e10_check_2] unless block 1024 11 1024 netherite_block run function ctg:lesson11/exercise10_check
tag @a[tag=_ctg_l11e10_check_2] remove _ctg_l11e10_check_2

execute if entity @a[tag=_ctg_l11e10_check_1] if block 1024 11 1024 netherite_block run tag @a add _ctg_l11e10_check_2
execute if entity @a[tag=_ctg_l11e10_check_1] if block 1024 11 1024 netherite_block run scoreboard players set Strength Test 9000
execute if entity @a[tag=_ctg_l11e10_check_1] if block 1024 11 1024 netherite_block run function ctg:lesson11/exercise10_check
tag @a[tag=_ctg_l11e10_check_1] remove _ctg_l11e10_check_1

execute if block -85 102 -26 command_block run data modify block -85 102 -26 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l11e10 LastExecution set from block -85 102 -26 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run scoreboard players set Strength Test 9001
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson11/exercise10_check
execute if score CommandExecuted _ctg_scratch matches 1 run tag @a add _ctg_l11e10_check_1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run setblock -85 101 -26 grass_block
execute if score Completed _ctg_scratch matches 0 run setblock -85 101 -26 emerald_block
execute if score Completed _ctg_scratch matches 1 run scoreboard objectives remove Test
execute if score Completed _ctg_scratch matches 0 run scoreboard objectives add Test dummy
