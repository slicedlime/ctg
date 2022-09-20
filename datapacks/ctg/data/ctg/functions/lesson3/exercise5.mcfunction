# Player state
function ctg:creative_mode
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson3/exercise5_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson3/exercise5_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson3/exercise5_l3
function ctg:text/lesson3/exercise5_objective

# Set base blocks
setblock -15 123 -32 minecraft:waxed_copper_block
setblock -16 123 -32 minecraft:oxidized_copper
setblock -16 123 -33 minecraft:oxidized_copper
setblock -15 123 -33 minecraft:oxidized_copper

# Remove command blocks in places that aren't allowed
fill -17 124 -31 -17 124 -34 air replace command_block
fill -17 124 -31 -17 124 -34 air replace chain_command_block
fill -14 124 -31 -14 124 -34 air replace command_block
fill -14 124 -31 -14 124 -34 air replace chain_command_block
fill -16 124 -34 -15 124 -34 air replace command_block
fill -16 124 -34 -15 124 -34 air replace chain_command_block
fill -16 124 -31 -15 124 -31 air replace command_block
fill -16 124 -31 -15 124 -31 air replace chain_command_block
fill -32 114 -42 -5 132 -11 air replace repeating_command_block

# Win condition
execute if block -15 124 -32 command_block run data modify block -15 124 -32 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l3e5 LastExecution set from block -15 124 -32

execute store result score Sword _ctg_scratch run clear @a iron_sword
execute store result score Shield _ctg_scratch run clear @a shield
execute store result score Bow _ctg_scratch run clear @a bow
execute store result score Arrow _ctg_scratch run clear @a arrow

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 5 if score Sword _ctg_scratch matches 1 if score Shield _ctg_scratch matches 1 if score Bow _ctg_scratch matches 1 if score Arrow _ctg_scratch matches 64 if score CommandExecuted _ctg_scratch matches 1 if block -15 124 -32 command_block if block -16 124 -32 chain_command_block if block -15 124 -33 chain_command_block if block -16 124 -33 chain_command_block run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
