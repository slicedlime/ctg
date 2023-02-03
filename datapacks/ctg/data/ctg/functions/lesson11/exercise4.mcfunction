# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run scoreboard objectives add OnGround dummy
execute unless entity @e[type=allay,tag=_ctg_l11e4a1] run summon allay -74.88 104.28 -16.54 {NoAI:1, Tags:["_ctg_l11e4a1", "_ctg_l11e4"], Rotation:[-606.23f,34.74f]}
execute unless entity @e[type=allay,tag=_ctg_l11e4a2] run summon allay -74.37 100.50 -20.44 {NoAI:1, Tags:["_ctg_l11e4a2", "_ctg_l11e4"], Rotation:[-633.61f,7.11f]}
fill 1024 10 1024 1026 100 1026 air
setblock 1024 10 1024 andesite_stairs
execute unless entity @e[type=allay,tag=_ctg_l11e4a3] run summon allay 1024 11 1024 {NoAI:1, Tags:["_ctg_l11e4a3", "_ctg_l11e4"], Rotation:[-606.23f,34.74f]}
execute unless entity @e[type=allay,tag=_ctg_l11e4a4] run summon allay 1024 25 1024 {NoAI:1, Tags:["_ctg_l11e4a4", "_ctg_l11e4"], Rotation:[-633.61f,7.11f]}
tp @e[type=allay,tag=!_ctg_l11e4] ~ -1000 ~

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"I've created a new scoreboard called 'OnGround'. Set the score of all allays have any non-air block below their feet to 1.", "color":"gold", "with": [{"translate": "Set the score of all allays have any non-air block below their feet to 1", "color": "green"}]}]

title @a actionbar [{"translate":"Set the score of all allays not above air to 1","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 4 unless score @e[type=allay,tag=_ctg_l11e4a1,limit=1] OnGround matches 1 if score @e[type=allay,tag=_ctg_l11e4a2,limit=1] OnGround matches -2147483648..2147483647 if score @e[type=allay,tag=_ctg_l11e4a3,limit=1] OnGround matches 1 unless score @e[type=allay,tag=_ctg_l11e4a4,limit=1] OnGround matches -2147483648..2147483647 unless score @p OnGround matches -2147483648..2147483647 run scoreboard players set Completed _ctg_scratch 1

tp @e[type=sheep] ~ -1000 ~

scoreboard players reset * OnGround
execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 11
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
execute if score Completed _ctg_scratch matches 1 run tp @e[type=allay,tag=_ctg_l11e4] ~ -1000 ~
execute if score Completed _ctg_scratch matches 1 run scoreboard objectives remove OnGround
