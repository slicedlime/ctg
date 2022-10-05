# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
tag @a remove _ctg_l4e7_check

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson4/exercise8_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson4/exercise8_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson4/exercise8_l3
function ctg:text/lesson4/exercise8_objective

# Set blocks
setblock -15 113 49 lapis_block
setblock -15 113 48 waxed_oxidized_copper
setblock -15 113 45 minecraft:diamond_block
execute store success score ButtonPressed _ctg_scratch run setblock -15 114 45 minecraft:polished_blackstone_button[face=floor,facing=east,powered=false]
execute if score Tick _ctg_main matches 1 run fill -22 112 46 -22 112 48 snow_block
execute if score Tick _ctg_main matches 1 run fill -15 114 48 -15 114 49 air replace snow

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 8 if entity @a[tag=_ctg_l4e8_check] if block 1024 17 1024 bookshelf if block 1024 17 1025 air if block 1024 33 1034 bookshelf if block 1024 33 1035 air positioned 1024.5 34.0 1035.0 if entity @e[type=experience_orb,distance=..1] positioned 1024.5 18.0 1024.5 unless entity @e[type=experience_orb,distance=..1] run scoreboard players set Completed _ctg_scratch 1

execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 8 if entity @a[tag=_ctg_l4e8_check] if block 1024 17 1024 bookshelf if block 1024 17 1025 air if block 1024 33 1034 bookshelf if block 1024 33 1035 air run say blocks right

tag @a remove _ctg_l4e8_check

execute if score ButtonPressed _ctg_scratch matches 1 if block -15 114 49 repeating_command_block if block -15 114 48 chain_command_block[conditional=true] run function ctg:lesson4/exercise8_check

execute if score Completed _ctg_scratch matches 1 run fill 1024 16 1024 1024 32 1026 air

execute if score Completed _ctg_scratch matches 1 run function ctg:lesson4/continue
