# Check if you did the right thing
tag @a add _ctg_l7e8_check
fill 1024 10 1024 1026 30 1026 air
summon witch 1024 21 1024 {Tags:["_ctg_l7e8_witch_target"], NoAI:1, PersistenceRequired:1}
summon witch 1024 22 1024 {Tags:["_ctg_l7e8_witch_target"], NoAI:1, PersistenceRequired:1}
summon witch 1024 23 1024 {Tags:["_ctg_l7e8_witch_miss_1"], NoAI:1, PersistenceRequired:1}
summon witch 1024 24 1024 {Tags:["_ctg_l7e8_witch_miss_2"], NoAI:1, PersistenceRequired:1}
summon witch 1024 25 1024 {Tags:["_ctg_l7e8_witch_miss_3"], NoAI:1, PersistenceRequired:1}
summon witch 1024 26 1024 {Tags:["_ctg_l7e8_witch_target"], NoAI:1, PersistenceRequired:1}
summon witch 1024 27 1024 {Tags:["_ctg_l7e8_witch_target"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 27 1024 {Tags:["_ctg_l7e8_creeper_miss"], NoAI:1, PersistenceRequired:1}

setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block 98 115 -42 Command
data modify block 1024 10 1024 auto set value 1
setblock 1024 300 1024 command_block
data modify block 1024 300 1024 Command set from block 98 115 -42 Command
data modify block 1024 300 1024 auto set value 1
