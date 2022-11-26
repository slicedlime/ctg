# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
data modify storage ctg:l8e10 entity set value {Brain: {memories: {}}, HurtByTimestamp: 0, Attributes: [{Base: 1.0d, Name: "minecraft:generic.movement_speed"}], Invulnerable: 0b, FallFlying: 0b, ForcedAge: 0, PortalCooldown: 0, AbsorptionAmount: 0.0f, FallDistance: 0.0f, InLove: 0, DeathTime: 0s, HandDropChances: [0.085f, 0.085f], PersistenceRequired: 0b, Age: 0, Motion: [0.0d, 0.0d, 0.0d], FromBucket: 0b, Health: 14.0f, LeftHanded: 0b, Air: 6000s, OnGround: 1b, NoAI: 1b, Rotation: [-121.39406f, 0.0f], HandItems: [{}, {}], Variant: 0, ArmorDropChances: [0.085f, 0.085f, 0.085f, 0.085f], CustomName: '{"text":"Axlollotlltl"}', Fire: 0s, ArmorItems: [{}, {}, {}, {}], CanPickUpLoot: 0b, HurtTime: 0s, Tags:["_ctg_l8_e10"], Pos:[36.3d, 92.0d, -107.01d]}
data modify storage ctg:l8e10 test set from entity @e[type=axolotl,tag=_ctg_l8_e10,limit=1]
# Don't compare UUIDs
data remove storage ctg:l8e10 test.UUID
execute store success score Modified _ctg_scratch run data modify storage ctg:l8e10 test set from storage ctg:l8e10 entity
execute if score Modified _ctg_scratch matches 1 run tp @e[type=axolotl,tag=_ctg_l8_e10] ~ -300 ~
execute if score Modified _ctg_scratch matches 1 run kill @e[type=axolotl,tag=_ctg_l8_e10]
execute unless entity @a[tag=_ctg_l8e10_check] unless entity @e[type=axolotl,tag=_ctg_l8_e10] run summon minecraft:axolotl 36.30 92.00 -107.01 {Brain: {memories: {}}, HurtByTimestamp: 0, Attributes: [{Base: 1.0d, Name: "minecraft:generic.movement_speed"}], Invulnerable: 0b, FallFlying: 0b, ForcedAge: 0, PortalCooldown: 0, AbsorptionAmount: 0.0f, FallDistance: 0.0f, InLove: 0, DeathTime: 0s, HandDropChances: [0.085f, 0.085f], PersistenceRequired: 0b, Tags: ["_ctg_l8_e10"], Age: 0, Motion: [0.0d, 0.0d, 0.0d], FromBucket: 0b, Health: 14.0f, LeftHanded: 0b, Air: 6000s, OnGround: 1b, NoAI: 1b, Rotation: [-121.39406f, 0.0f], HandItems: [{}, {}], Variant: 0, ArmorDropChances: [0.085f, 0.085f, 0.085f, 0.085f], CustomName: '{"text":"Axlollotlltl"}', Fire: 0s, ArmorItems: [{}, {}, {}, {}], CanPickUpLoot: 0b, HurtTime: 0s}
setblock 38 91 -106 emerald_block

# Description
execute if score Tick _ctg_main matches 1 run tellraw @a [{"text":"\n"},{"translate":"One final test for this time - check out the friendly Axo... axlol... pink boy over here! There's an emerald block nearby too - place a command block on that emerald block.", "color":"gold"}]
execute if score Tick _ctg_main matches 80 run tellraw @a [{"text":"\n"},{"translate":"Fill that command block with a command to summon an exact copy of the axolotl!", "color":"gold", "with": [{"translate": "summon an exact copy of the axolotl", "color": "green"}]}]
execute if score Tick _ctg_main matches 160 run tellraw @a [{"text":"\n"},{"translate":"When you are done, activate the command block.", "color":"gold"}]

title @a actionbar [{"translate":"Make a command block to copy the axolotl","color":"green"}]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 10 if entity @a[tag=_ctg_l8e10_check] if entity @e[type=axolotl,tag=_ctg_l8_e10] if score Modified _ctg_scratch matches 0 run scoreboard players set Completed _ctg_scratch 1
tag @a remove _ctg_l8e10_check

execute if block 38 92 -106 command_block run data modify block 38 92 -106 UpdateLastExecution set value 1
execute store success score CommandExecuted _ctg_scratch run data modify storage ctg:l8e10 LastExecution set from block 38 92 -106 LastExecution
execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson8/exercise10_check

execute if score Completed _ctg_scratch matches 1 run function ctg:lesson8/continue
