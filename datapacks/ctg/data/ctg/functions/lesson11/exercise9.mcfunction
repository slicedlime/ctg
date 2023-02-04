# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"New emerald block - you know the drill, command block time! Make the block summon a pig on top of itself if there isn't already one within 2 blocks.", "color":"gold", "with": [{"translate": "summon a pig on top of itself if there isn't already one within 2 blocks", "color": "green"}]}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"When you are done, activate the command block.", "color":"gold"}]

title @a actionbar [{"translate":"Make a command block summon a pig if there isn't already one","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 9 if entity @a[tag=_ctg_l11e9_check] positioned 1024 11 1024 if entity @e[type=pig,distance=..1] positioned 1024 31 1024 unless entity @e[type=pig,tag=!_ctg_l11e9p1,distance=..1] positioned 1024 51 1024 if entity @e[type=pig,distance=..1] run scoreboard players set Completed _ctg_scratch 1
tag @a[tag=_ctg_l11e9_check] remove _ctg_l11e9_check

execute if block -83 101 -25 command_block run data modify block -83 101 -25 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l11e9 LastExecution set from block -83 101 -25 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson11/exercise9_check
execute unless entity @a[tag=_ctg_l11e9_check] run tp @e[type=pig] ~ -1000 ~

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run setblock -83 100 -25 grass_block
execute if score Completed _ctg_scratch matches 0 run setblock -83 100 -25 emerald_block
