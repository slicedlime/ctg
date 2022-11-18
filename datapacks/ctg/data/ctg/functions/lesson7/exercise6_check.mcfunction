# Check if you did the right thing
tag @a add _ctg_l7e6_check
fill 1024 10 1024 1026 30 1026 air
summon creeper 1024 25 1024 {Tags:["_ctg_l7e6_creeper_target"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 26 1024 {Tags:["_ctg_l7e6_creeper_target"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 27 1024 {Tags:["_ctg_l7e6_creeper_target"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 28 1024 {Tags:["_ctg_l7e6_creeper_target"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 29 1024 {Tags:["_ctg_l7e6_creeper_target"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 30 1024 {Tags:["_ctg_l7e6_creeper_target"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 31 1024 {Tags:["_ctg_l7e6_creeper_miss_1"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 32 1024 {Tags:["_ctg_l7e6_creeper_miss_2"], NoAI:1, PersistenceRequired:1}

setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block 101 115 -50 Command
data modify block 1024 10 1024 auto set value 1
