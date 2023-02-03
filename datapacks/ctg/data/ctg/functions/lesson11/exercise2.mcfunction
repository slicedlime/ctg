# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run scoreboard objectives remove fun
execute if score Tick _ctg_main matches 1 run setblock -82 100 -14 grass_block
execute if score Tick _ctg_main matches 1 run setblock -77 99 -18 emerald_block

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"Let's step is up a bit - your next task is a conditional self destruct block! Place a command block on the new emerald block.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Make the command block replace itself with an oak log if it is placed below a vertical oak log. When you are done, activate the command block.", "color":"gold", "with": [{"translate": "replace itself with an oak log if it is placed below a vertical oak log", "color": "green"}]}]

title @a actionbar [{"translate":"Make a command block replace itself if beneath a vertical oak log","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 2 if entity @a[tag=_ctg_l11e2_check] if block 1024 10 1024 oak_log if block 1024 30 1024 command_block if block 1024 50 1024 command_block run scoreboard players set Completed _ctg_scratch 1
tag @a[tag=_ctg_l11e2_check] remove _ctg_l11e2_check

execute if block -82 101 -14 command_block run data modify block -77 100 -18 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l11e2 LastExecution set from block -77 100 -18 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson11/exercise2_check

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
