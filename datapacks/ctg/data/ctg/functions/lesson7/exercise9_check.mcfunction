# Check if you did the right thing
tag @a add _ctg_l7e9_check
fill 1024 10 1024 1026 30 1026 air
execute as @e[type=guardian] at @s run tp @s ~ -100 ~
kill @e[type=guardian]

summon guardian 1024 123 1024 {Tags:["_ctg_l7e9_guardian_miss_1"], NoAI:1, PersistenceRequired:1}
summon guardian 1024 124 1024 {Tags:["_ctg_l7e9_guardian_miss_2"], NoAI:1, PersistenceRequired:1}
summon guardian 1024 125 1024 {Tags:["_ctg_l7e9_guardian_miss_3"], NoAI:1, PersistenceRequired:1}
summon guardian 1024 126 1024 {Tags:["_ctg_l7e9_guardian_target"], NoAI:1, PersistenceRequired:1}

setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block 104 115 -44 Command
data modify block 1024 10 1024 auto set value 1
