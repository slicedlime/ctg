# Check if you did the right thing
tag @a add _ctg_l7e7_check
fill 1024 10 1024 1026 30 1026 air
summon spider 1024 18 1024 {Tags:["_ctg_l7e7_spider_miss_1"], NoAI:1, PersistenceRequired:1}
summon spider 1024 19 1024 {Tags:["_ctg_l7e7_spider_miss_2"], NoAI:1, PersistenceRequired:1}
summon spider 1024 20 1024 {Tags:["_ctg_l7e7_spider_miss_3"], NoAI:1, PersistenceRequired:1}
summon spider 1024 21 1024 {Tags:["_ctg_l7e7_spider_target"], NoAI:1, PersistenceRequired:1}
summon spider 1024 22 1024 {Tags:["_ctg_l7e7_spider_target"], NoAI:1, PersistenceRequired:1}
summon spider 1024 23 1024 {Tags:["_ctg_l7e7_spider_target"], NoAI:1, PersistenceRequired:1}
summon creeper 1024 23 1024 {Tags:["_ctg_l7e7_creeper_miss"], NoAI:1, PersistenceRequired:1}
summon spider 1024 24 1024 {Tags:["_ctg_l7e7_spider_target"], NoAI:1, PersistenceRequired:1}
summon spider 1024 25 1024 {Tags:["_ctg_l7e7_spider_target"], NoAI:1, PersistenceRequired:1}
summon spider 1024 200 1024 {Tags:["_ctg_l7e7_spider_target"], NoAI:1, PersistenceRequired:1}

setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block 97 115 -46 Command
data modify block 1024 10 1024 auto set value 1
